//
//  UMISUP_CallState.h
//  ulibisup
//
//  Created by Andreas Fink on 17.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
@class UMLayerISUP;
@class UMISUP_Link;

@interface UMISUP_CallState : UMLayerTask

- (UMISUP_CallState *) eventAddressComplete:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventAnswer:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventBlocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCallProgress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupBlocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupBlockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupReset:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupResetAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupUnblocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventCircuitGroupUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventConnect:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventContinuity:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventConfusion:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventContinuityCheckRequest:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventFacilityAccepted:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventFacilityReject:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventFacilityRequest:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventForwardTransfer:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventInitialAddress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventRelease:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventReleaseComplete:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventResetCircuit:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventResume:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventSubsequentAddress:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventSuspend:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventUnblocking:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventUnblockingAcknowledgement:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;
- (UMISUP_CallState *) eventUserToUserInformation:(UMSynchronizedSortedDictionary *)params link:(UMISUP_Link *)link circuitId:(int)cic;


- (void) unexpected:(NSString *)ev link:(UMISUP_Link *)link circuitId:(int)cic;

@end
