//
//  TransparentProxy.m
//  ProxyExample
//
//  Created by noctis on 2018/8/15.
//  Copyright © 2018年 ddddxxx. All rights reserved.
//

#import "TransparentProxy.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static char kProxyObjectKey;

id proxy(id obj) {
    if ([obj isKindOfClass:[TransparentProxy class]]) {
        return obj;
    }
    id proxy = objc_getAssociatedObject(obj, &kProxyObjectKey);
    if (!proxy) {
        proxy = [TransparentProxy proxyWithTarget:obj];
        objc_setAssociatedObject(obj, &kProxyObjectKey, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}

@implementation TransparentProxy

// MARK: - Proxy

+ (instancetype)proxyWithTarget:(id)obj {
    return [[self alloc] initWithTarget:obj];
}

- (instancetype)initWithTarget:(id)obj {
    if (obj) {
        _target = obj;
        return self;
    }
    return nil;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _target;
}

//- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
//    return [_obj methodSignatureForSelector:sel];
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation {
//    [invocation invokeWithTarget:_obj];
//}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [[self class] instancesRespondToSelector:aSelector] ?: [_target respondsToSelector:aSelector];
}

@end

NS_ASSUME_NONNULL_END
