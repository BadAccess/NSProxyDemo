//
//  ServiceProxy.m
//  test
//
//  Created by ZhengWei on 2017/6/19.
//  Copyright © 2017年 ZhengWei. All rights reserved.
//

#import "ServiceProxy.h"
#import <objc/runtime.h>

@implementation ServiceProxy
{
    ProductService *_product;
    OrderService *_order;
    NSMutableDictionary *_targetProxy;
}

#pragma class method
+ (ServiceProxy *)shareProxy {
    return [[ServiceProxy alloc] init];
}

#pragma init
- (ServiceProxy *)init {
    _targetProxy = [NSMutableDictionary dictionary];
    _product = [[ProductService alloc] init];
    _order = [[OrderService alloc] init];
    
    [self _registerMethodsWithTarget:_product];
    [self _registerMethodsWithTarget:_order];
    
    return self;
}

#pragma private
- (void)_registerMethodsWithTarget:(id)target {
    unsigned int methodsNum = 0;
    
    Method *methodList = class_copyMethodList([target class], &methodsNum);
    for (int i = 0; i < methodsNum; i++) {
        Method method = methodList[i];
        SEL temp_sel = method_getName(method);
        const char *temp_method_name = sel_getName(temp_sel);
        [_targetProxy setObject:target forKey:[NSString stringWithUTF8String:temp_method_name]];
    }
    
    free(methodList);
}

#pragma override
- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL selector = invocation.selector;
    NSString *methodName = NSStringFromSelector(selector);
    id target = _targetProxy[methodName];
    if (target && [target respondsToSelector:selector]) {
        [invocation invokeWithTarget:target];
    }else {
        [super forwardInvocation:invocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *methodName = NSStringFromSelector(sel);
    id target = _targetProxy[methodName];
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    }else {
        return [super methodSignatureForSelector:sel];
    }
}

@end
