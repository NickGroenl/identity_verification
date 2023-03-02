//
//  MBSuccessFrameGrabberRecognizerResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 22/12/2017.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBRecognizerResult.h"

@class MDVImage;

NS_ASSUME_NONNULL_BEGIN

/**
 * A recognizer that returns SuccessFrameGrabber result.
 */
MB_CLASS_AVAILABLE_IOS(11.0)

@interface MDVSuccessFrameGrabberRecognizerResult : MDVRecognizerResult<NSCopying>

MB_INIT_UNAVAILABLE

/**
 * Success frame MDVImage of successful frame
 */
@property (nonatomic, strong, readonly) MDVImage *successFrame;

@end

NS_ASSUME_NONNULL_END
