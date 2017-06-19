//
//  ServiceProxy.h
//  test
//
//  Created by ZhengWei on 2017/6/19.
//  Copyright © 2017年 ZhengWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductService.h"
#import "OrderService.h"

@interface ServiceProxy : NSProxy <ProductServiceProtocel, OrderServiceProtocel>

+ (ServiceProxy *)shareProxy;

@end
