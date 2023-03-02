//
//  MBRecognizerResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 22/11/2017.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"

/**
 * Enumeration of posibble recognizer result state
 */
typedef NS_ENUM(NSInteger, MDVRecognizerResultState) {
    
    /**
     *  Empty
     */
    MDVRecognizerResultStateEmpty,
    
    /**
     *  Uncertain
     */
    MDVRecognizerResultStateUncertain,
    
    /**
     *  Valid
     */
    MDVRecognizerResultStateValid,

    /**
     *  StageValid
     */
    MDVRecognizerResultStateStageValid,

};

NS_ASSUME_NONNULL_BEGIN

/**
 * Base class for all recognizer results
 */
MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVRecognizerResult : NSObject

MB_INIT_UNAVAILABLE

@property (nonatomic, assign, readonly) MDVRecognizerResultState resultState;
@property (nonatomic, readonly) NSString *resultStateString;

@end

NS_ASSUME_NONNULL_END
