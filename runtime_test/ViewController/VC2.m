//
//  VC2.m
//  runtime_test
//
//  Created by YangJie on 2018/3/27.
//  Copyright © 2018年 YangJie. All rights reserved.
//

#import "VC2.h"
#import "Dog.h"
//#import <objc/message.h>
#import <objc/runtime.h>

@interface VC2 ()

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    const char *class_name = class_getName([UIView class]);
    NSLog(@"class_name=%s",class_name);
    int ver = class_getVersion([UIView class]);
    NSLog(@"ver= %i",ver);
    
    [self printIverList];
    [self printPropertyList];
    [self printMethodList];
}

/**
 typedef struct objc_ivar *Ivar;
 */
- (void)printIverList {
    u_int count = 0;
    Ivar *ivars = class_copyIvarList([Dog class], &count);
    for (int i = 0; i<count; i++) {
        const char *ivarName = ivar_getName(ivars[i]);
        NSString *str = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        NSLog(@"ivarName: %s",ivarName);
    }
}
/**
 typedef struct objc_property *objc_property_t;
 */
- (void)printPropertyList {
    u_int count = 0;
    objc_property_t *property = class_copyPropertyList([Dog class], &count);
    for (int i = 0; i<count; i++) {
        const char *propertyName = property_getName(property[i]);
        NSLog(@"propertyName: %s",propertyName);
    }
}
- (void)printMethodList {
    u_int count = 0;
    Method *methods = class_copyMethodList([Dog class], &count);
    for (int i = 0; i<count; i++) {
        /// An opaque type that represents a method selector.
//        typedef struct objc_selector *SEL;
        SEL methodName = method_getName(methods[i]);
        NSString *str = [NSString stringWithCString:sel_getName(methodName) encoding:NSUTF8StringEncoding];
        NSLog(@"methodName=%@",str);
    }
}
/*
 2018-03-27 17:59:42.104409+0800 runtime_test[33982:628850] class_name=UIView
 2018-03-27 17:59:42.104572+0800 runtime_test[33982:628850] ver= 0
 2018-03-27 17:59:42.104718+0800 runtime_test[33982:628850] ivarName: tmpBtn
 2018-03-27 17:59:42.104811+0800 runtime_test[33982:628850] ivarName: tmpLabel
 2018-03-27 17:59:42.104908+0800 runtime_test[33982:628850] ivarName: private_tmpBtn
 2018-03-27 17:59:42.104985+0800 runtime_test[33982:628850] ivarName: private_tmpLabel
 2018-03-27 17:59:42.105074+0800 runtime_test[33982:628850] ivarName: _tmpInt
 2018-03-27 17:59:42.105169+0800 runtime_test[33982:628850] ivarName: _tmpFloat
 2018-03-27 17:59:42.105260+0800 runtime_test[33982:628850] ivarName: _tmpStr
 2018-03-27 17:59:42.105347+0800 runtime_test[33982:628850] ivarName: _tmpArr
 2018-03-27 17:59:42.105432+0800 runtime_test[33982:628850] ivarName: _tmpMutableArray
 2018-03-27 17:59:42.105528+0800 runtime_test[33982:628850] ivarName: _tmpNumber
 
 2018-03-27 17:59:42.105697+0800 runtime_test[33982:628850] propertyName: tmpMutableArray
 2018-03-27 17:59:42.105863+0800 runtime_test[33982:628850] propertyName: tmpNumber
 2018-03-27 17:59:42.106052+0800 runtime_test[33982:628850] propertyName: tmpFloat
 2018-03-27 17:59:42.106228+0800 runtime_test[33982:628850] propertyName: tmpStr
 2018-03-27 17:59:42.106386+0800 runtime_test[33982:628850] propertyName: tmpInt
 2018-03-27 17:59:42.112475+0800 runtime_test[33982:628850] propertyName: tmpArr
 
 2018-03-27 18:13:49.577422+0800 runtime_test[34136:640189] methodName=eatShit
 2018-03-27 18:13:49.577559+0800 runtime_test[34136:640189] methodName=tmpStr
 2018-03-27 18:13:49.577658+0800 runtime_test[34136:640189] methodName=setTmpStr:
 2018-03-27 18:13:49.577766+0800 runtime_test[34136:640189] methodName=tmpInt
 2018-03-27 18:13:49.577861+0800 runtime_test[34136:640189] methodName=setTmpInt:
 2018-03-27 18:13:49.577952+0800 runtime_test[34136:640189] methodName=tmpArr
 2018-03-27 18:13:49.578043+0800 runtime_test[34136:640189] methodName=setTmpArr:
 2018-03-27 18:13:49.578129+0800 runtime_test[34136:640189] methodName=tmpMutableArray
 2018-03-27 18:13:49.578239+0800 runtime_test[34136:640189] methodName=setTmpMutableArray:
 2018-03-27 18:13:49.578329+0800 runtime_test[34136:640189] methodName=tmpNumber
 2018-03-27 18:13:49.578421+0800 runtime_test[34136:640189] methodName=setTmpNumber:
 2018-03-27 18:13:49.578636+0800 runtime_test[34136:640189] methodName=tmpFloat
 2018-03-27 18:13:49.578862+0800 runtime_test[34136:640189] methodName=setTmpFloat:
 2018-03-27 18:13:49.579067+0800 runtime_test[34136:640189] methodName=.cxx_destruct
 */


@end
