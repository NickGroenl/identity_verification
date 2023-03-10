//
//  MIVColorTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 06/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVColorTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// By default blue
@property (nonatomic, strong) UIColor *primaryColor;
/// By default dark gray
@property (nonatomic, strong) UIColor *stepCaptionColor;
/// By default light gray
@property (nonatomic, strong) UIColor *stepDisabledColor;
/// By default green
@property (nonatomic, strong) UIColor *successColor;
/// By default lime
@property (nonatomic, strong) UIColor *highlightColor;
/// By default transparent green
@property (nonatomic, strong) UIColor *stepBackgroundSuccessColor;
/// By default red
@property (nonatomic, strong) UIColor *errorColor;
/// By default primary color
@property (nonatomic, strong) UIColor *buttonBackgroundEnabledColor;
/// By default light gray
@property (nonatomic, strong) UIColor *buttonBackgroundDisabledColor;
/// By default white
@property (nonatomic, strong) UIColor *buttonTextDisabledColor;
/// By default white
@property (nonatomic, strong) UIColor *buttonTextEnabledColor;
/// By default white in light and black in dark mode
@property (nonatomic, strong) UIColor *defaultBackgroundColor;
/// By default white in light and black in dark mode
@property (nonatomic, strong) UIColor *stepBackgroundColor;
/// By default navy blue in light and white in dark mode
@property (nonatomic, strong) UIColor *labelColor;
/// By default medium gray
@property (nonatomic, strong) UIColor *secondaryLabelColor;
/// By default light blue
@property (nonatomic, strong) UIColor *reviewDataEditBannerBackgroundColor;
/// By default black
@property (nonatomic, strong) UIColor *reviewDataEditBannerTextColor;
/// By default white
@property (nonatomic, strong) UIColor *stepLabelColor;
/// By default blue
@property (nonatomic, strong) UIColor *alertColor;
/// By default lime
@property (nonatomic, strong) UIColor *needsReviewColor;

// ID Scanning


/**
 * Instructions text color
 *
 * Default: white
*/
@property (nonatomic, strong) UIColor *idInstructionsTextColor;

/**
 * Flashlight warning background color
 *
 * Default: #3A3A3C
*/
@property (nonatomic, strong) UIColor *idFlashlightWarningBackgroundColor;

/**
 * Flashlight warning text color
 *
 * Default: white
*/
@property (nonatomic, strong) UIColor *idFlashlightWarningTextColor;

/**
 * Reticle error color
 *
 * Default: red alpha .4f
*/
@property (nonatomic, strong) UIColor *idReticleErrorColor;

// FaceTec

/// By default blue
@property (nonatomic, strong) UIColor *faceTecPrimaryColor;
/// By default blue
@property (nonatomic, strong) UIColor *faceTecLoadingBarRailColor;
/// By default navy blue
@property (nonatomic, strong) UIColor *faceTecMainTextColor;
/// By default gray
@property (nonatomic, strong) UIColor *faceTecSubtextColor;
/// By default white
@property (nonatomic, strong) UIColor *faceTecButtonTextColor;
/// By default white/transparent
@property (nonatomic, strong) UIColor *faceTecOvalColor;
/// By default blue, 50% transparent
@property (nonatomic, strong) UIColor *faceTecOvalProgressColor;
/// By default black
@property (nonatomic, strong) UIColor *faceTecFeedbackBarBackgroundColor;
/// By default white
@property (nonatomic, strong) UIColor *faceTecFeedbackBarTextColor;
/// By default black
@property (nonatomic, strong) UIColor *faceTecResultAnimationCheckmarkForegroundColor;

// iProov

@property (nonatomic, strong) UIColor *iproovHeaderTextColor;
@property (nonatomic, strong) UIColor *iproovPromptTextColor;
@property (nonatomic, strong) UIColor *iproovHeaderBackgroundColor;
@property (nonatomic, strong) UIColor *iproovFooterBackgroundColor;
@property (nonatomic, strong) UIColor *iproovReadyTintColor;
@property (nonatomic, strong) UIColor *iproovNotReadyTintColor;
@property (nonatomic, strong) UIColor *iproovNotReadyOverlayStrokeColor;
@property (nonatomic, strong) UIColor *iproovNotReadyFloatingPromptBackgroundColor;
@property (nonatomic, strong) UIColor *iproovProgressBarColor;

// Document Verification

/**
 * Instructions text color
 *
 * Default: white
*/
@property (nonatomic, strong) UIColor *documentVerificationInstructionsTextColor;

/**
 * Flashlight warning background color
 *
 * Default: #3A3A3C
*/
@property (nonatomic, strong) UIColor *documentVerificationFlashlightWarningBackgroundColor;

/**
 * Flashlight warning text color
 *
 * Default: white
*/
@property (nonatomic, strong) UIColor *documentVerificationFlashlightWarningTextColor;

/**
 * Reticle error color
 *
 * Default: red alpha .4f
*/
@property (nonatomic, strong) UIColor *documentVerificationReticleErrorColor;

/**
 * Success flash color
 *
 * Default: white
*/
@property (nonatomic, strong) UIColor *documentVerificationSuccessFlashColor;

/**
 * Need help tootlip background color. Same as dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationTooltipBackgroundColor;

/**
 * Need help tootlip text color. Same as dark mode.
 *
 * Default: white
*/
@property (nonatomic) UIColor *documentVerificationTooltipTextColor;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationOnboardingAlertViewTitleTextColor;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Label
*/
@property (nonatomic) UIColor *documentVerificationOnboardingAlertViewMessageTextColor;

/**
 * Initial onboarding alert view title color. Same for dark mode.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationOnboardingAlertViewDoneButtonTextColor;

/**
 * Need help tutorial view title text color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationTutorialViewTitleTextColor;

/**
 * Need help tutorial view message text color.
 *
 * Default: Label
*/
@property (nonatomic) UIColor *documentVerificationTutorialViewMessageTextColor;

/**
 * Need help tutorial view action buttons text color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationTutorialViewActionButtonsTextColor;

/**
 * Need help tutorial view page control color.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIColor *documentVerificationTutorialViewPageControlColor;

@end

NS_ASSUME_NONNULL_END
