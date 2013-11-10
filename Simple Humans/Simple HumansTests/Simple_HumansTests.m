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
    
    /* generic terms */
    XCTAssertFalse([JPHumanEmailRecognizer isHumanWithFromName:@"Notifications" fromAddress:@"notifications@google.com" senderAddress:@"notifications@google.com"], @"notifications are not humans");
    
    /* special services */
    
}

@end
