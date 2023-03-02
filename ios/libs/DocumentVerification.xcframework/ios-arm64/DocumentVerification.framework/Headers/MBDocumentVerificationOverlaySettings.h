// Created by Jura Skrlec on 05.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import "MBBaseOverlaySettings.h"

typedef NS_ENUM(NSInteger, MDVDocumentTypeUI) {
    MDVDocumentTypeUIDefault,
    MDVDocumentTypeUIId,
    MDVDocumentTypeUIPassport
};

NS_ASSUME_NONNULL_BEGIN

/**
 * Settings class containing parameters for Document Verification Overlay.
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVDocumentVerificationOverlaySettings : MDVBaseOverlaySettings

/**
 * Designated initializer. Initializes the object with default settings.
 *
 *  @return object initialized with default values.
 */
- (instancetype)init NS_DESIGNATED_INITIALIZER;

/**
 * Time interval between neutral tilt step and first tilt step (left, right, top or down)
 *
 * Default: 2s
 */
@property (nonatomic) NSTimeInterval tiltStartTimeInterval;

/**
 * Timeout interval for each tilt step.
 *
 * Default: 12s
 */
@property (nonatomic) NSTimeInterval tiltStepTimeoutInterval;

/**
 * Time interval after Need help tooltip is shown on tilt steps.
 *
 * Default: 12s
 */
@property (nonatomic) NSTimeInterval showTooltipTimeInterval;

/**
 * Defines whether glare warning will be displayed when user turn on a flashlight.
 *
 * Default: YES
*/
@property(nonatomic, getter=isFlashlightWarningOn) BOOL flashlightWarningOn;

/**
 * Defines whether the idle timer is disabled for the DocumentVerificationOverlay
 *
 * Default: YES
*/
@property(nonatomic, getter=isSystemSleepDisabled) BOOL systemSleepDisabled;

/**
 * Defines the image displayed in the sheet viewcontroller;
 *
 * Default: DocumentTypeUIDefault - id
*/
@property (nonatomic, assign) MDVDocumentTypeUI documentTypeUI;

@end

NS_ASSUME_NONNULL_END
