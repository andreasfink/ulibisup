//
//  UMISUP_Link.h
//  ulibisup
//
//  Created by Andreas Fink on 18.02.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMLayerISUP;

@interface UMISUP_Link : UMObject
{
    NSString            *_name;
    UMLayerISUP __weak  *_isup;
    UMLogFeed           *_logfeed;
    UMSynchronizedSortedDictionary *circuits;
    UMLogLevel          _logLevel;

}

@property(readwrite,strong,atomic) NSString *name;
@property(readwrite,strong,atomic) UMLogFeed *logfeed;
@property(readwrite,weak,atomic) UMLayerISUP *isup;
@property(readwrite,assign,atomic)  UMLogLevel logLevel;

- (void)logDebug:(NSString *)s;
- (void)logWarning:(NSString *)s;
- (void)logInfo:(NSString *)s;
- (void)logPanic:(NSString *)s;
- (void)logMajorError:(NSString *)s;
- (void)logMinorError:(NSString *)s;

- (void)processMessage:(NSData *)message;
@end
