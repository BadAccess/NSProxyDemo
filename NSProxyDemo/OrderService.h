//
//  OrderService.h
//  test
//
//  Created by ZhengWei on 2017/6/19.
//  Copyright © 2017年 ZhengWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OrderServiceProtocel <NSObject>

- (void)submitOrder:(NSString *)prodcutName;

@end

@interface OrderService : NSObject

@end
