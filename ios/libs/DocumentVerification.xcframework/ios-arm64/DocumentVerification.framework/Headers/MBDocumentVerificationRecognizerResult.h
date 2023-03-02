// Created by Jura Skrlec on 01.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBRecognizerResult.h"
#import "MBImage.h"
#import "MBStaticSecurityFeatureAnalysisResult.h"
#import "MBDocumentLivenessAnalysisResult.h"

typedef NS_ENUM(NSInteger, MDVTiltStep) {
    MDVTiltStepTiltNeutral,
    MDVTiltStepTiltLeft,
    MDVTiltStepTiltRight,
    MDVTiltStepTiltUp,
    MDVTiltStepTiltDown
};

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVDocumentVerificationRecognizerResult : MDVRecognizerResult<NSCopying>

MB_INIT_UNAVAILABLE

/**
 * Defines document liveness status
 */
@property (nonatomic, readonly, strong, nullable) MDVDocumentLivenessAnalysisResult *documentLivenessAnalysisResult;

/**
 * Defines 2D feature analysis result
 */
@property (nonatomic, readonly, strong, nullable) MDVStaticSecurityFeatureAnalysisResult *staticSecurityFeatureAnalysisResult;

/**
 * Defines how certain we are all front frames contain the same document
 */
@property (nonatomic, readonly, assign) CGFloat consistencyScore;

/**
 * Get successful tilt frame for verification step
 */
- (nullable MDVImage *)getTiltStepImage:(MDVTiltStep)tiltStep NS_SWIFT_NAME(getTiltStepImage(tiltStep:));

@end

NS_ASSUME_NONNULL_END
