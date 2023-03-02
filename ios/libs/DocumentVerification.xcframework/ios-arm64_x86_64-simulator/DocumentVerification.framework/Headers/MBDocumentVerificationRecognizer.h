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
#import "MBBlinkIdCombinedRecognizer.h"
#import "MBDocumentVerificationRecognizerResult.h"
#import "MBVerificationStep.h"
#import "MBVerificationStatus.h"

@protocol MDVDocumentVerificationRecognizerDelegate;

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVDocumentVerificationRecognizer : MDVRecognizer<NSCopying>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithRecognizer:(MDVBlinkIdCombinedRecognizer *)blinkIdCombinedRecognizer NS_SWIFT_NAME(init(recognizer:)) NS_DESIGNATED_INITIALIZER;

/**
 * MDVDocumentVerificationRecognizerResult's results
 */
@property (nonatomic, strong, readonly) MDVDocumentVerificationRecognizerResult *result;

/**
 * Custom serializable extraction recognizer
 */
@property (nonatomic, strong, readonly) MDVBlinkIdCombinedRecognizer *extractionRecognizer;

/**
 * See {MDVDocumentVerificationRecognizerDelegate}
 */
@property (nonatomic, nullable, weak) id<MDVDocumentVerificationRecognizerDelegate> delegate;

/**
 * Defines allowed tilt tolerance
 *
 * Default: 20.f
 */
@property (nonatomic, assign) CGFloat tiltTolerance;

/**
 * Defines whether verification is restarted on failed attempt
 *
 * Default: YES
 */
@property (nonatomic, assign) BOOL restartFailedVerification;

/**
 * Defines whether to randomize the order of document tilting steps during verification process
 *
 * Default: NO
 */
@property (nonatomic, assign) BOOL randomizeTiltingSteps;

/**
 * Defines how many tilting steps to perform. Valid values are in range 0 to 4 (inclusive)
 *
 * Default: 0
 */
@property (nonatomic, assign) NSInteger tiltStepCount;

@end

@protocol MDVDocumentVerificationRecognizerDelegate <NSObject>

/**
 * Called when document verification step starts
 * @param verificationStep The {MDVVerificationStep} when available.
 */
- (void)documentVerificationRecognizer:(MDVDocumentVerificationRecognizer *)documentVerificationRecognizer verificationStep:(MDVVerificationStep)verificationStep;

/**
 * Called when document verification status is available.
 * @param verificationStatus The {MDVVerificationStatus} when available.
 */
- (void)documentVerificationRecognizer:(MDVDocumentVerificationRecognizer *)documentVerificationRecognizer verificationStatus:(MDVVerificationStatus)verificationStatus;

/**
 * Called when document verification is done.
 * @param finished Indicates wheter verification is finished or not.
 */
- (void)documentVerificationRecognizerDidFinishVerification:(BOOL)finished;

@end

NS_ASSUME_NONNULL_END
