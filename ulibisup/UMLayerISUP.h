//
//  UMLayerISUP.h
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibmtp3/ulibmtp3.h>

@interface UMLayerISUP : UMLayer<UMLayerMTP3UserProtocol>
{
    NSString *mtp3_name;
    UMLayerMTP3 *mtp3;
    UMSynchronizedSortedDictionary *links;
}

@end
