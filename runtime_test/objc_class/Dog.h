//
//  Dog.h
//  runtime_test
//
//  Created by YangJie on 2017/12/18.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import "Animal.h"

@interface Dog : Animal
{
    UIButton *tmpBtn;
    UILabel *tmpLabel;
}
@property (nonatomic, copy) NSString *tmpStr;
@property (nonatomic, assign) int tmpInt;
@property (nonatomic, copy) NSArray *tmpArr;

+ (BOOL)isFriend;
- (void)eatShit;
@end
