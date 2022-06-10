//
//  UMISUP_mtpTransfer.h
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibmtp3/ulibmtp3.h>

@class UMLayerISUP;

@interface UMISUP_mtpTransfer : UMLayerTask
{
    NSData *data;
    int si;
    int ni;
    int sls;
    UMMTP3PointCode *opc;
    UMMTP3PointCode *dpc;
    NSDictionary *options;

    UMLayerISUP *isupLayer;
    UMLayerMTP3 *mtp3Layer;

    NSData          *isup_pdu;
    UMSynchronizedSortedDictionary *decodedJson;

}

- (UMISUP_mtpTransfer *)initForISUP:(UMLayerISUP *)layer
                               mtp3:(UMLayerMTP3 *)mtp3
                                opc:(UMMTP3PointCode *)xopc
                                dpc:(UMMTP3PointCode *)xdpc
                                 si:(int)xsi
                                 ni:(int)xni
                                sls:(int)xsls
                               data:(NSData *)xdata
                            options:(NSDictionary *)xoptions;

@end
