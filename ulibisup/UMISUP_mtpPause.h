//
//  UMISUP_mtpPause.h
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibmtp3/ulibmtp3.h>

@class UMLayerISUP;

@interface UMISUP_mtpPause : UMLayerTask
{
    NSData *data;
    int si;
    int ni;
    UMMTP3PointCode *affpc;
    NSDictionary *options;

    UMLayerISUP *isupLayer;
    UMLayerMTP3 *mtp3Layer;

    NSData          *isup_pdu;
    UMSynchronizedSortedDictionary *decodedJson;
    
}


- (UMISUP_mtpPause *)initForISUP:(UMLayerISUP *)layer
                            mtp3:(UMLayerMTP3 *)mtp3
               affectedPointcode:(UMMTP3PointCode *)xaffpc
                              si:(int)xsi
                              ni:(int)xni
                         options:(NSDictionary *)xoptions;

@end
