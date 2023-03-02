//
//  MBRecognizer.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 21/11/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBMicroblinkDefines.h"
#import "MBEntity.h"
#import "MBRecognizerResult.h"

@class MDVSignedPayload;

NS_ASSUME_NONNULL_BEGIN

/**
 * Base class for all recognizers
 */
MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVRecognizer : MDVEntity

/**
 * Base recognizer result.
 */
@property (nonatomic, readonly, weak) MDVRecognizerResult *baseResult;

- (UIInterfaceOrientationMask)getOptimalHudOrientation;

/**
 * Returns the signed JSON representation of this entity's current state as a MDVSignedPayload.
 *
 * @return signed JSON representation of this entity's current state.
 */
- (MDVSignedPayload *)toSignedJson;

@end

NS_ASSUME_NONNULL_END
