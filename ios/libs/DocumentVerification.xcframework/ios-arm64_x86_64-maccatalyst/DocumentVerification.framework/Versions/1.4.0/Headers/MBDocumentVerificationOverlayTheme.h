// Created by Jura Skrlec on 26.10.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Document Verification UI customization class.
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVDocumentVerificationOverlayTheme : NSObject

/** Init unavailable; use sharedInstance */
- (instancetype)init NS_UNAVAILABLE;

/**
 * Returns shared document verification overlay theme instance.
 */
@property (class, nonatomic, readonly) MDVDocumentVerificationOverlayTheme *sharedInstance NS_SWIFT_NAME(shared);

/**
 * Success image after first side scan, back side scan and every tilt step.
 * Dimensions: 136x136
 *
 * Default: confirmationBlinkId
*/
@property (nonatomic) UIImage *successStepImage;

/**
 * Help button image
 * Dimensions: 32x32
 *
 * Default: need-help-tooltip
*/
@property (nonatomic) UIImage *helpButtonImage;

/**
 * Help button dark image
 * Dimensions: 32x32
 *
 * Default: need-help-tooltip-dark
*/
@property (nonatomic) UIImage *helpButtonDarkImage;

/**
 * Status view label's font. Status view handles all the messages.
 *
 * Default: SystemFont 17pt SemiBold
*/
@property (nonatomic) UIFont *statusViewFont;

/**
 * Status view corner radius.
 *
 * Default: 6
*/
@property (nonatomic) CGFloat statusViewCornerRadius;

/**
 * Flashlight warning font
 *
 * Default: System (iPhone - 14pt, iPad - 16pt)
 */
@property (nonatomic) UIFont *flashlightWarningFont;

/**
 * Flashlight warning background color. Same for dark mode.
 *
 * Default: #3A3A3C
*/
@property (nonatomic) UIColor *flashlightWarningBackgroundColor;

/**
 * Flashlight warning text color. Same for dark mode.
 *
 * Default: white
*/
@property (nonatomic) UIColor *flashlightWarningTextColor;

/**
 * Flashlight warning corner radius
 *
 * Default: 4
*/
@property (nonatomic) CGFloat flashlightWarningCornerRadius;

/**
 * Reticle error color. Same for dark mode.
 *
 * Default: Microblink red
*/
@property (nonatomic) UIColor *reticleErrorColor;

/**
 * Need help tootlip background color. Same as dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *tooltipBackgroundColor;

/**
 * Need help tootlip text color. Same as dark mode.
 *
 * Default: white
*/
@property (nonatomic) UIColor *tooltipTextColor;

/**
 * Need help tootlip corner radius.
 *
 * Default: 4
*/
@property (nonatomic) CGFloat tooltipCornerRadius;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *onboardingAlertViewTitleTextColor;

/**
 * Initial onboarding alert view font.
 *
 * Default: SystemFont 17pt Semibold
*/
@property (nonatomic) UIFont *onboardingAlertViewTitleFont;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Label
*/
@property (nonatomic) UIColor *onboardingAlertViewMessageTextColor;

/**
 * Initial onboarding alert view font.
 *
 * Default: SystemFont 14pt Regular
*/
@property (nonatomic) UIFont *onboardingAlertViewMessageFont;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *onboardingAlertViewDoneButtonTextColor;

/**
 * Initial onboarding alert view font.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIFont *onboardingAlertViewDoneButtonFont;

/**
 * Need help tutorial view title text color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *tutorialViewTitleTextColor;

/**
 * Need help tutorial view title font.
 *
 * Default: SystemFont 22pt SemiBold
*/
@property (nonatomic) UIFont *tutorialViewTitleFont;

/**
 * Need help tutorial view message text color.
 *
 * Default: Label
*/
@property (nonatomic) UIColor *tutorialViewMessageTextColor;

/**
 * Need help tutorial view message font.
 *
 * Default: SystemFont 15pt
*/
@property (nonatomic) UIFont *tutorialViewMessageFont;

/**
 * Need help tutorial view action buttons text color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *tutorialViewActionButtonsTextColor;

/**
 * Need help tutorial view action button next and done font.
 *
 * Default: SystemFont 17pt Bold
*/
@property (nonatomic) UIFont *tutorialViewActionButtonNextFont;

/**
 * Need help tutorial view action button close and back font.
 *
 * Default: SystemFont 17pt
*/
@property (nonatomic) UIFont *tutorialViewActionButtonCloseFont;

/**
 * Need help tutorial view page control color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *tutorialViewPageControlColor;

@end

NS_ASSUME_NONNULL_END
