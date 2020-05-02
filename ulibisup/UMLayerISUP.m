//
//  UMLayerISUP.m
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMLayerISUP.h"
#import "UMISUP_mtpTransfer.h"
#import "UMISUP_mtpPause.h"
#import "UMISUP_mtpResume.h"
#import "UMISUP_mtpStatus.h"
#import "UMLayerISUPApplicationContextProtocol.h"

@implementation UMLayerISUP

- (UMLayerISUP *)init
{
    self = [super init];
    if(self)
    {
        [self genericInitialisation];
    }
    return self;
}

- (UMLayerISUP *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    self = [super initWithTaskQueueMulti:tq];
    if(self)
    {
        [self genericInitialisation];
    }
    return self;
}

- (void)genericInitialisation
{
}


- (void)mtpTransfer:(NSData *)data
       callingLayer:(id)mtp3Layer
                opc:(UMMTP3PointCode *)opc
                dpc:(UMMTP3PointCode *)dpc
                 si:(int)si
                 ni:(int)ni
        linksetName:(NSString *)linksetName
            options:(NSDictionary *)options
              ttmap:(UMMTP3TranslationTableMap *)map

{
    UMISUP_mtpTransfer *task = [[UMISUP_mtpTransfer alloc]initForISUP:self
                                                                   mtp3:mtp3Layer
                                                                    opc:opc
                                                                    dpc:dpc
                                                                     si:si
                                                                     ni:ni
                                                                   data:data
                                                                options:options];
    [self queueFromLower:task];
}

- (void)mtpPause:(NSData *)data
    callingLayer:(id)mtp3Layer
      affectedPc:(UMMTP3PointCode *)affPC
              si:(int)si
              ni:(int)ni
         options:(NSDictionary *)options
{
    UMISUP_mtpPause *task = [[UMISUP_mtpPause alloc]initForISUP:self
                                                           mtp3:mtp3Layer
                                              affectedPointcode:affPC
                                                             si:si
                                                             ni:ni
                                                        options:options];

    [self queueFromLowerWithPriority:task];
}

- (void)mtpResume:(NSData *)data
     callingLayer:(id)mtp3Layer
       affectedPc:(UMMTP3PointCode *)affPC
               si:(int)si
               ni:(int)ni
          options:(NSDictionary *)options
{
    UMISUP_mtpResume *task = [[UMISUP_mtpResume alloc]initForISUP:self
                                                             mtp3:mtp3Layer
                                                affectedPointcode:affPC
                                                               si:si
                                                               ni:ni
                                                          options:options];
    [self queueFromLowerWithPriority:task];
}

- (void)mtpStatus:(NSData *)data
     callingLayer:(id)mtp3Layer
       affectedPc:(UMMTP3PointCode *)affPC
               si:(int)si
               ni:(int)ni
           status:(int)status
          options:(NSDictionary *)options
{

    UMISUP_mtpStatus *task = [[UMISUP_mtpStatus alloc] initForISUP:self
                                                              mtp3:mtp3Layer
                                                 affectedPointcode:affPC
                                                                si:si
                                                                ni:ni
                                                           options:options];
    [self queueFromLowerWithPriority:task];
}

- (void)setConfig:(NSDictionary *)cfg applicationContext:(id<UMLayerISUPApplicationContextProtocol>)appContext
{
    [self readLayerConfig:cfg];

    for(id key in [cfg allKeys])
    {
 //       id value = cfg[key];
        if([key isEqualToStringCaseInsensitive:@"attach-to"])
        {
            mtp3_name =  [cfg[@"attach-to"] stringValue];
            mtp3 = [appContext getMTP3:mtp3_name];
            if(mtp3 == NULL)
            {
                NSString *s = [NSString stringWithFormat:@"Can not find mtp3 layer '%@' referred from sccp '%@'",mtp3_name,self.layerName];
                @throw([NSException exceptionWithName:[NSString stringWithFormat:@"CONFIG_ERROR FILE %s line:%ld",__FILE__,(long)__LINE__]
                                               reason:s
                                             userInfo:NULL]);
            }
            [mtp3 setUserPart:MTP3_SERVICE_INDICATOR_ISUP user:self];
        }
    }
}

- (NSDictionary *)config
{
    NSMutableDictionary *cfg = [[NSMutableDictionary alloc]init];
    [self addLayerConfig:cfg];

    cfg[@"attach-to"] = mtp3_name;

    return cfg;
}

@end
