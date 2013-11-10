//
//  Simple_HumansTests.m
//  Simple HumansTests
//
//  Created by Joseph Perla on 11/9/13.
//  Copyright (c) 2013 Joseph Perla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JPHumanEmailRecognizer.h"

@interface Simple_HumansTests : XCTestCase

@end

@implementation Simple_HumansTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    /* normal emails */
    XCTAssertTrue([JPHumanEmailRecognizer isHumanWithFromName:@"Bobby Tables" fromAddress:@"bobby@gmail.com" senderAddress:@"bobby@gmail.com"], @"normal emails go through");
    XCTAssertTrue([JPHumanEmailRecognizer isHumanWithFromName:@"Mick Hagen" fromAddress:@"mick@gmail.com" senderAddress:@"mick@gmail.com"], @"normal emails go through");
    
    /* mailchimp, ccsend, etc */
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Bobby Tables" fromAddress:@"bobby@gmail.com" senderAddress:@"slkjdfkj@slkdjf.mcsv.net"], @"fail mailchimp");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Bobby Tables" fromAddress:@"bobby@gmail.com" senderAddress:@"slkjdfkj@mail43.wdc03.rsgsv.net"], @"fail mailchimp");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Bobby Tables" fromAddress:@"bobby@gmail.com" senderAddress:@"slkjdfkj@slkdjf.auth.ccsend.com"], @"fail ccsend");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Bobby Tables" fromAddress:@"bobby@gmail.com" senderAddress:@"slkjdfkj@potomac1050.mktomail.com"], @"fail mktomail");
    
    /* no-reply */
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Noreply" fromAddress:@"noreply@google.com" senderAddress:@"noreply@google.com"], @"No replies are not humans");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Noreply" fromAddress:@"no-reply@google.com" senderAddress:@"no-reply@google.com"], @"No replies are not humans");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Noreply" fromAddress:@"mail-no-reply@google.com" senderAddress:@"no-reply@google.com"], @"No replies are not humans");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Noreply" fromAddress:@"mail-noreply@google.com" senderAddress:@"mail-noreply@google.com"], @"No replies are not humans");
    
    /* generic terms */
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Notifications" fromAddress:@"notifications@google.com" senderAddress:@"notifications@google.com"], @"notifications are not humans");
    
    /* special services */
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Notifications" fromAddress:@"please-reply@google.com" senderAddress:@"please-reply@google.com"], @"circa news aggregator");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Notifications" fromAddress:@"sleeptight@hoteltonight.com" senderAddress:@"sleeptight@hoteltonight.com"], @"hotel tonight");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Notifications" fromAddress:@"member_services@opentable.com" senderAddress:@"member_services@opentable.com"], @"open table");
    
    /* hi and hello are special, users may use it on their own domain */
    XCTAssertTrue([JPHumanEmailRecognizer isHumanWithFromName:@"Joseph Perla" fromAddress:@"hi@jperla.com" senderAddress:@"hi@jperla.com"], @"legit person");
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Hotel Greetings" fromAddress:@"hi@hotelgreetings.com" senderAddress:@"hi@hotelgreetings.com"], @"yo, this is fake bro");
}

@end
