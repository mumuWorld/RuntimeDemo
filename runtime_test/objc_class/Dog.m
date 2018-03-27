//
//  Dog.m
//  runtime_test
//
//  Created by YangJie on 2017/12/18.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import "Dog.h"

@interface Dog()
{
    UIButton *private_tmpBtn;
    UILabel *private_tmpLabel;
}
@property (nonatomic, strong) NSMutableArray *tmpMutableArray;

@property (nonatomic, assign) NSNumber *tmpNumber;

@property (nonatomic, assign) float tmpFloat;

@end

@implementation Dog
- (void)eatShit {
    private_tmpBtn = [[UIButton alloc] init];
    tmpBtn = [[UIButton alloc] init];
    NSLog(@"Dog eat shit");
}
+ (BOOL)isFriend {
    return true;
}
@end
