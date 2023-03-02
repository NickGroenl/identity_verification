//
//  MBLogger.h
//  PhotoMathFramework
//
//  Created by Marko Mihovilić on 23/03/16.
//  Copyright © 2016 Microblink Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBMicroblinkDefines.h"

typedef NS_ENUM(NSInteger, MDVLogLevel) {
    MDVLogLevelError,
    MDVLogLevelWarning,
    MDVLogLevelInfo,
    MDVLogLevelDebug,
    MDVLogLevelVerbose
};

@protocol MDVLoggerDelegate <NSObject>

@optional

- (void)log:(MDVLogLevel)level message:(const char *)message;
- (void)log:(MDVLogLevel)level format:(const char *)format arguments:(const char *)arguments;

@end

MB_CLASS_AVAILABLE_IOS(11.0) @interface MDVLogger : NSObject

@property (nonatomic) id<MDVLoggerDelegate> delegate;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

- (void)disableMicroblinkLogging;

@end
