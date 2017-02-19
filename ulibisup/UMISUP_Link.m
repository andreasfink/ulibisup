//
//  UMISUP_Link.m
//  ulibisup
//
//  Created by Andreas Fink on 18.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMISUP_Link.h"

@implementation UMISUP_Link

- (void)logDebug:(NSString *)s
{
    [logFeed debugText:s];
}

- (void)logWarning:(NSString *)s
{
    [logFeed warningText:s];
}

- (void)logInfo:(NSString *)s
{
    [logFeed infoText:s];
}

- (void) logPanic:(NSString *)s
{
    [logFeed panicText:s];
}

- (void)logMajorError:(NSString *)s
{
    [logFeed majorErrorText:s];
}

- (void)logMinorError:(NSString *)s
{
    [logFeed majorErrorText:s];
}


#define GRAB_BYTE(var,data,index,max)               \
        if (index<max)                              \
        {                                           \
            var = data[index];                      \
            index++;                                \
        }                                           \
        else                                        \
        {                                           \
            @throw([NSException exceptionWithName:@"ISUP_PACKET_TOO_SHORT" \
                reason:NULL \
                userInfo:@{ \
                           @"sysmsg" : [NSString stringWithFormat:@"too-short-packet %s:%d",__FILE__,__LINE__],\
                           @"func": @(__func__),\
                           @"obj":self,\
                           @"backtrace": UMBacktrace(NULL,0)\
                           }\
                    ]);\
        }

- (void)processMessage:(NSData *)message
{
    const uint8_t *bytes = message.bytes;
    int len = (int)message.length;
    int idx = 0;

    uint8_t b1;
    uint8_t b2;
    int     cic;


    GRAB_BYTE(b1,bytes,idx,len);
    GRAB_BYTE(b2,bytes,idx,len);

    cic = (b2 << 8) | b1;
    cic = cic & 0x0FFF;

    uint8_t messageType;
    GRAB_BYTE(messageType, bytes,idx,len);
    switch(messageType)
    {
        case 0b00000110: /* Address complete */
            [self processACM:cic data:bytes len:len offset:idx];
            break;
        case 0b00001001: /* Answer message */
            [self processANM:cic data:bytes len:len offset:idx];
            break;
        case 0b00010011: /* Blocking acknowledgement */
            [self processBLA:cic data:bytes len:len offset:idx];
            break;
        case 0b00010101: /* Blocking */
            [self processBLO:cic data:bytes len:len offset:idx];
            break;
        case 0b00101100: /* Call progress */
            [self processCPG:cic data:bytes len:len offset:idx];
            break;
        case 0b00011000: /* Circuit group blocking */
            [self processCGB:cic data:bytes len:len offset:idx];
            break;
        case 0b00011010: /* Circuit group blocking acknowledgement */
            [self processCGBA:cic data:bytes len:len offset:idx];
            break;
        case 0b00101010: /* Circuit group query */
            [self processCQM:cic data:bytes len:len offset:idx];
            break;
        case 0b00101011: /* Circuit group query response */
            [self processCQR:cic data:bytes len:len offset:idx];
            break;
        case 0b00010111: /* Circuit group reset */
            [self processGRS:cic data:bytes len:len offset:idx];
            break;
        case 0b00101001: /* Circuit group reset acknowledgement */
            [self processGRA:cic data:bytes len:len offset:idx];
            break;
        case 0b00011001: /* Circuit group unblocking */
            [self processCGU:cic data:bytes len:len offset:idx];
            break;
        case 0b00011011: /* Circuit group unblocking acknowledgement  */
            [self processCGUA:cic data:bytes len:len offset:idx];
            break;
        case 0b00110001: /* Charge information */
            [self processCRG:cic data:bytes len:len offset:idx];
            break;
        case 0b00101111: /* Confusion */
            [self processCFN:cic data:bytes len:len offset:idx];
            break;
        case 0b00000111: /* Connect */
            [self processCON:cic data:bytes len:len offset:idx];
            break;
        case 0b00000101: /* Continuity */
            [self processCOT:cic data:bytes len:len offset:idx];
            break;
        case 0b00010001: /* Continuity check request */
            [self processCCR:cic data:bytes len:len offset:idx];
            break;
        case 0b00110011: /* Facility */
            [self processFAC:cic data:bytes len:len offset:idx];
            break;
        case 0b00100000: /* Facility accepted */
            [self processFAA:cic data:bytes len:len offset:idx];
            break;
        case 0b00011111: /* Facility request */
            [self processFAR:cic data:bytes len:len offset:idx];
            break;
        case 0b00001000: /* Forward transfer */
            [self processFOT:cic data:bytes len:len offset:idx];
            break;
        case 0b00110110: /* Identification request */
            [self processIDR:cic data:bytes len:len offset:idx];
            break;
        case 0b00110111: /* Identification response */
            [self processIRS:cic data:bytes len:len offset:idx];
            break;
        case 0b00000100: /* Information */
            [self processINF:cic data:bytes len:len offset:idx];
            break;
        case 0b00000011: /* Information request */
            [self processINR:cic data:bytes len:len offset:idx];
            break;
        case 0b00000001: /* Initial address */
            [self processIAM:cic data:bytes len:len offset:idx];
            break;
        case 0b00100100: /* Loop back acknowledgement */
            [self processLPA:cic data:bytes len:len offset:idx];
            break;
        case 0b01000000: /* Loop prevention */
            [self processLOP:cic data:bytes len:len offset:idx];
            break;
        case 0b00110010: /* Network resource management */
            [self processNRM:cic data:bytes len:len offset:idx];
            break;
        case 0b00110000: /* Overload */
            [self processOLM:cic data:bytes len:len offset:idx];
            break;
        case 0b00101000: /* Pass-along */
            [self processPAM:cic data:bytes len:len offset:idx];
            break;
        case 0b00001100: /* Release */
            [self processREL:cic data:bytes len:len offset:idx];
            break;
        case 0b00010000: /* Release complete */
            [self processRLC:cic data:bytes len:len offset:idx];
            break;
        case 0b00010010: /* Reset circuit */
            [self processRSC:cic data:bytes len:len offset:idx];
            break;
        case 0b00001110: /* Resume */
            [self processRES:cic data:bytes len:len offset:idx];
            break;
        case 0b00111000: /* Segmentation */
            [self processSGM:cic data:bytes len:len offset:idx];
            break;
        case 0b00000010: /* Subsequent address */
            [self processSAM:cic data:bytes len:len offset:idx];
            break;
        case 0b00001101: /* Suspend */
            [self processSUS:cic data:bytes len:len offset:idx];
            break;
        case 0b00010100: /* Unblocking */
            [self processUBL:cic data:bytes len:len offset:idx];
            break;
        case 0b00010110: /* Unblocking acknowledgement */
            [self processUBA:cic data:bytes len:len offset:idx];
            break;
        case 0b00101110: /* Unequipped circuit identification code */
            [self processUCIC:cic data:bytes len:len offset:idx];
            break;
        case 0b00110101: /* User part available */
            [self processUPA:cic data:bytes len:len offset:idx];
            break;
        case 0b00110100: /* User part test */
            [self processUPT:cic data:bytes len:len offset:idx];
            break;
        case 0b00101101: /* User-to-user information */
            [self processUSR:cic data:bytes len:len offset:idx];
            break;
        case 0b00100001: /* Facility reject */
            [self processFRJ:cic data:bytes len:len offset:idx];
            break;
        default: /* unknown  */
            [self processUnknown:cic data:bytes len:len offset:idx];
            break;
    }
}

- (void) logDebug:(NSString *)msg cic:(int)cic
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"[link %@][cic: %d] %@",
                       self.name,
                       cic,
                       msg];
        [self logDebug:s];
    }
}

- (void)processACM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"ACM (Address complete)" cic:cic];
}

- (void)processANM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"ANM (Answer message)" cic:cic];
}

- (void)processBLA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"BLA (Blocking acknowledgement)" cic:cic];
}

- (void)processBLO:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"BLO (Blocking)" cic:cic];
}

- (void)processCPG:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CPG (Call progress)" cic:cic];
}

- (void)processCGB:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CGB (Circuit group blocking)" cic:cic];
}

- (void)processCGBA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CGBA (Circuit group blocking acknowledgement)" cic:cic];
}

- (void)processCQM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CQM (Circuit group query)" cic:cic];
}

- (void)processCQR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CQR (Circuit group query response)" cic:cic];
}

- (void)processGRS:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"GRS (Circuit group reset)" cic:cic];
}

- (void)processGRA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"GRA (Circuit group reset acknowledgement)" cic:cic];
}

- (void)processCGU:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CGU (Circuit group unblocking)" cic:cic];
}

- (void)processCGUA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CGUA (Circuit group unblocking acknowledgement )" cic:cic];
}

- (void)processCRG:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CRG (Charge information)" cic:cic];
}

- (void)processCFN:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CFN (Confusion)" cic:cic];
}

- (void)processCON:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CON (Connect)" cic:cic];
}

- (void)processCOT:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"COT (Continuity)" cic:cic];
}

- (void)processCCR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"CCR (Continuity check request)" cic:cic];
}

- (void)processFAC:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"FAC (Facility)" cic:cic];
}

- (void)processFAA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"FAA (Facility accepted)" cic:cic];
}

- (void)processFAR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"FAR (Facility request)" cic:cic];
}

- (void)processFOT:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"FOT (Forward transfer)" cic:cic];
}

- (void)processIDR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"IDR (Identification request)" cic:cic];
}

- (void)processIRS:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"IRS (Identification response)" cic:cic];
}

- (void)processINF:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"INF (Information)" cic:cic];
}

- (void)processINR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"INR (Information request)" cic:cic];
}

- (void)processIAM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"IAM (Initial address)" cic:cic];
}

- (void)processLPA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"LPA (Loop back acknowledgement)" cic:cic];
}

- (void)processLOP:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"LOP (Loop prevention)" cic:cic];
}

- (void)processNRM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"NRM (Network resource management)" cic:cic];
}

- (void)processOLM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"OLM (Overload)" cic:cic];
}

- (void)processPAM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"PAM (Pass-along)" cic:cic];
}

- (void)processREL:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"REL (Release)" cic:cic];
}

- (void)processRLC:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"RLC (Release complete)" cic:cic];
}

- (void)processRSC:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"RSC (Reset circuit)" cic:cic];
}

- (void)processRES:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"RES (Resume)" cic:cic];
}

- (void)processSGM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"SGM (Segmentation)" cic:cic];
}

- (void)processSAM:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"SAM (Subsequent address)" cic:cic];
}

- (void)processSUS:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"SUS (Suspend)" cic:cic];
}

- (void)processUBL:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"UBL (Unblocking)" cic:cic];
}

- (void)processUBA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"UBA (Unblocking acknowledgement)" cic:cic];
}

- (void)processUCIC:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"UCIC (Unequipped circuit identification code)" cic:cic];
}

- (void)processUPA:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"UPA (User part available)" cic:cic];
}

- (void)processUPT:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"UPT (User part test)" cic:cic];
}

- (void)processUSR:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"USR (User-to-user information)" cic:cic];
}

- (void)processFRJ:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"FRJ (Facility reject)" cic:cic];
}

- (void)processUnknown:(int)cic data:(const uint8_t *)bytes len:(int)len offset:(int)idx
{
    [self logDebug:@"Unknown Message" cic:cic];
}


@end
