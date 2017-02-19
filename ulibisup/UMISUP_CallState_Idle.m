//
//  UMISUP_CallState_Idle.m
//  ulibisup
//
//  Created by Andreas Fink on 18.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMISUP_CallState_Idle.h"
#import "UMLayerISUP.h"

@implementation UMISUP_CallState_Idle

- (UMISUP_CallState *) eventAddressCompleteMessage:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventAnswer:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventBlocking:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventCallProgress:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupBlocking:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupReset:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventCircuitGroupResetAcknowledgement:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupUnblocking:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventCircuitGroupUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}

- (UMISUP_CallState *) eventConnect:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventContinuity:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventConfusion:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventContinuityCheckRequest:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventFacilityAccepted:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventFacilityReject:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventFacilityRequest:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventForwardTransfer:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventInitialAddress:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventRelease:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventReleaseComplete:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventResetCircuit:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventResume:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventSubsequentAddress:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventSuspend:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventUnblocking:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


- (UMISUP_CallState *) eventUserToUserInformation:(UMSynchronizedSortedDictionary *)params isup:(UMLayerISUP *)isup circuitId:(int)cic
{
    return self;
}


@end
