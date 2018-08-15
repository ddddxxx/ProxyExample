//
//  TransparentProxy.h
//  ProxyExample
//
//  Created by noctis on 2018/8/15.
//  Copyright © 2018年 ddddxxx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

id proxy(id obj);

@interface TransparentProxy : NSProxy

@property (nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)obj;
- (instancetype)initWithTarget:(id)obj;

@end

NS_ASSUME_NONNULL_END
