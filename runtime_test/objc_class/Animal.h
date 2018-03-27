//
//  Animal.h
//  runtime_test
//
//  Created by YangJie on 2017/12/18.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject

@property (nonatomic, copy) NSString *eat;

@property (nonatomic, copy) NSString *name;

- (void)eatFood;
@end
