//
//  UMLayerISUPApplicationContextProtocol.h
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMLayerMTP3;
@protocol UMLayerISUPApplicationContextProtocol<NSObject>

-(UMLayerMTP3 *)getMTP3:(NSString *)name;

@end
