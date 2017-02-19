//
//  UMISUP_CallState.m
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMISUP_CallState.h"
#import "UMLayerISUP.h"
#import "UMISUP_Link.h"

@implementation UMISUP_CallState


- (UMISUP_CallState *) eventAddressComplete:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // Objective-C

    [self unexpected:@"eventAddressComplete" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventAnswer:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventAnswer" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventBlocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventBlocking" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventBlockingAcknowledgement" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventCallProgress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCallProgress" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupBlocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupBlocking" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupBlockingAcknowledgement" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupReset:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupReset" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventCircuitGroupResetAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupResetAcknowledgement" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventCircuitGroupUnblocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupUnblocking" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventCircuitGroupUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventCircuitGroupUnblockingAcknowledgement" link:link circuitId:cic];
    return self;
}

- (UMISUP_CallState *) eventConnect:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventConnect" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventContinuity:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventContinuity" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventConfusion:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventConfusion" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventContinuityCheckRequest:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventContinuityCheckRequest" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventFacilityAccepted:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventFacilityAccepted" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventFacilityReject:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventFacilityReject" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventFacilityRequest:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventFacilityRequest" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventForwardTransfer:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventForwardTransfer" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventInitialAddress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventInitialAddress" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventRelease:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventRelease" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventReleaseComplete:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventReleaseComplete" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventResetCircuit:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventResetCircuit" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventResume:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventResume" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventSubsequentAddress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventSubsequentAddress" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventSuspend:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventSuspend" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventUnblocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventUnblockingAcknowledgement" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventUnblockingAcknowledgement" link:link circuitId:cic];
    return self;
}


- (UMISUP_CallState *) eventUserToUserInformation:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic
{
    [self unexpected:@"eventUserToUserInformation" link:link circuitId:cic];
    return self;
}

- (void) unexpected:(NSString *)ev link:(UMISUP_Link *)link circuitId:(int)cic
{
    NSString *s = [NSString stringWithFormat:@"Unexpected event %@ in state %@ for cic %d link %@",ev,NSStringFromClass(self.class), cic,link.name];
    [link.isup logMajorError:s];
}



@end
