//
//  UMISUP_mtpTransfer.m
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMISUP_mtpTransfer.h"
#import "UMLayerISUP.h"

@implementation UMISUP_mtpTransfer

- (UMISUP_mtpTransfer *)initForISUP:(UMLayerISUP *)layer
                               mtp3:(UMLayerMTP3 *)mtp3
                                opc:(UMMTP3PointCode *)xopc
                                dpc:(UMMTP3PointCode *)xdpc
                                 si:(int)xsi
                                 ni:(int)xni
                                sls:(int)xsls
                               data:(NSData *)xdata
                            options:(NSDictionary *)xoptions
{
    self = [super initWithName:@"UMISUP_mtpTransfer" receiver:layer sender:mtp3 requiresSynchronisation:NO];
    if(self)
    {
        opc = xopc;
        dpc = xdpc;
        si = xsi;
        ni = xni;
        sls = xsls;
        data = xdata;
        options = xoptions;
        isupLayer = layer;
        mtp3Layer = mtp3;
    }
    return self;
}

- (void)main
{
}

@end
