//
//  JPHumanEmailRecognizer.h
//  Simple Humans
//
//  Created by Joseph Perla on 11/9/13.
//  Copyright (c) 2013 Joseph Perla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPHumanEmailRecognizer : UIApplication

+ (BOOL)isHumanWithFromName:(NSString *)fromName fromAddress:(NSString *)fromAddress senderAddress:(NSString *)senderAddress;

@end
