//
//  Person.h
//  许波波
//
//  Created by alan on 16/2/25.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString * nameString;
@property (nonatomic,copy) NSString * ageString;
- (void)firstSay;
- (void)secondSay;
@end
