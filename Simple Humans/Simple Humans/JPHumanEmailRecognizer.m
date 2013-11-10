//
//  JPHumanEmailRecognizer.m
//  Simple Humans
//
//  Created by Joseph Perla on 11/9/13.
//  Copyright (c) 2013 Joseph Perla. All rights reserved.
//

#import "JPHumanEmailRecognizer.h"

@implementation JPHumanEmailRecognizer

+ (BOOL)isHumanWithFromName:(NSString *)fromName fromAddress:(NSString *)fromAddress senderAddress:(NSString *)senderAddress
{
    NSArray *componentsOfEmail = [fromAddress componentsSeparatedByString:@"@"];
    NSString *prefix = [componentsOfEmail firstObject];
    NSString *suffix = ([componentsOfEmail count] > 1 ? [componentsOfEmail objectAtIndex:1] : @"*");
    NSString *mainDomain = [[suffix componentsSeparatedByString:@"."] firstObject];
    
    const NSArray *bannedPrefixes = @[
                                      @"notifications",
                                      @"confirmation",
                                      @"info",
                                      @"admin",
                                      @"alert",
                                      @"help",
                                      @"members",
                                      @"mailers",
                                      @"reservations",
                                      @"success",
                                      @"weekly",
                                      @"automated",
                                      @"contact",
                                      @"mailer",
                                      @"daily",
                                      @"founders",
                                      @"feedback",
                                      @"alerts",
                                      @"updates",
                                      @"news",
                                      @"support",
                                      @"email",
                                      @"team",
                                      @"auto-response",
                                      @"digest",
                                      @"marketing",
                                      @"community",
                                      @"sleeptight",
                                      @"please-reply",
                                      @"member_services",
                                      ];
    
    if ([bannedPrefixes containsObject:prefix]) {
        return NO;
    }
    
    /* Google, for example, uses mail-noreply@gmail.com */
    const NSArray *bannedPrefixSuffixes = @[@"noreply",
                                           @"no-reply",
                                           @"do-not-reply",
                                           @"do_not_reply",
                                           @"donotreply",
    ];
    for (NSString *suffix in bannedPrefixSuffixes) {
        if ([prefix hasSuffix:suffix]) {
            return NO;
        }
    }
    
    /* We only want to ban hi and hello if the name is like the domain (not a real person) */
    const NSArray *simpleGreetings = @[@"hello", @"hi"];
    NSString *simpleName = [[fromName lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([simpleGreetings containsObject:prefix] && ([simpleName rangeOfString:mainDomain].location != NSNotFound)) {
        return NO;
    }
    
    /* Ignore from many senders like mailchimp */
    const NSArray *bannedSuffixes = @[@"rsgsv.net",
                                      @"mcsv.net",
                                      @"ccsend.com",
                                      @"mktomail.com"];
    
    for (NSString *suffix in bannedSuffixes) {
        if ([senderAddress hasSuffix:suffix]) {
            return NO;
        }
    }
    
    return YES;
}

@end
