//
//  ViewController.m
//  runtime_test
//
//  Created by YangJie on 2017/12/18.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Dog *dog1 = [[Dog alloc] init];
    unsigned int numIvars;
    Ivar *ivarList = class_copyIvarList([Dog class], &numIvars);
    NSString *key;
    for (int i = 0; i < numIvars; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"variable name :%@", ivarName);
        key = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)]; //获取成员变量的数据类型
        NSLog(@"variable type :%@", key);
    }
    free(ivarList);
     Method *meth = class_copyMethodList([Dog class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Method thisIvar = meth[i];
        SEL sel = method_getName(thisIvar);
        const char *name = sel_getName(sel);
        NSLog(@"zp method :%s", name);
    }
    free(meth);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
