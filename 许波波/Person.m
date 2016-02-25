//
//  Person.m
//  许波波
//
//  Created by alan on 16/2/25.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "Person.h"

@implementation Person
//- (void)setNameString:(NSString *)nameString
//{
//    if (self.nameString != nameString) {
//       self.nameString = nameString;
//    }
//}
//- (NSString *)nameString
//{
//    return self.nameString;
//}
- (id)init{
    if (self = [super init]) {
        self.nameString = @"xiaoming";
    }
    return self;
}
- (void)firstSay
{
    NSLog(@"小明第一次回答是我是小明");
}
- (void)secondSay
{
    NSLog(@"小明第二次回答是我是小龙");
}
@end
