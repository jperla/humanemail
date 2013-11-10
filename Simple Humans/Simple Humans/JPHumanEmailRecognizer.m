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
    
    const NSArray *bannedPrefixes = @[@"noreply",
                                      @"no-reply",
                                      @"do-not-reply",
                                      @"do_not_reply",
                                      @"donotreply",
                                      @"hello",
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
                                      @"hi",
                                      @"support",
                                      @"email",
                                      @"team",
                                      @"auto-response",
                                      @"digest",
                                      @"marketing",
                                      @"community"
    ];
    
    if ([bannedPrefixes containsObject:prefix]) {
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
