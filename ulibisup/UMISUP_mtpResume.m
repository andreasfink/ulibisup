//
//  UMISUP_mtpResume.m
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMISUP_mtpResume.h"
#import "UMLayerISUP.h"

@implementation UMISUP_mtpResume


- (UMISUP_mtpResume *)initForISUP:(UMLayerISUP *)layer
                             mtp3:(UMLayerMTP3 *)mtp3
                affectedPointcode:(UMMTP3PointCode *)xaffpc
                               si:(int)xsi
                               ni:(int)xni
                          options:(NSDictionary *)xoptions
{
    self = [super initWithName:@"UMISUP_mtpResume" receiver:layer sender:mtp3 requiresSynchronisation:NO];
    if(self)
    {
        affpc = xaffpc;
        si = xsi;
        ni = xni;
        options = xoptions;
        isupLayer = layer;
        mtp3Layer = mtp3;
    }
    return self;
}

@end
