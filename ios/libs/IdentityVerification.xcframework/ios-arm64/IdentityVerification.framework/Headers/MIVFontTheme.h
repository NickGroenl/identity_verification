//
//  MIVFontTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 06/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVFontTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// By default 17 semibold
@property (nonatomic, strong) UIFont *navigationBarTitleFont;
/// By default 17 semibold
@property (nonatomic, strong) UIFont *buttonFont;
/// By default 17 regular
@property (nonatomic, strong) UIFont *dataCaptionFont;
/// By default 13 semibold
@property (nonatomic, strong) UIFont *dataTitleFont;
/// By default 20 bold
@property (nonatomic, strong) UIFont *dataHeaderFont;
/// By default 20 medium
@property (nonatomic, strong) UIFont *titleFont;
/// By default 18 bold
@property (nonatomic, strong) UIFont *buttonStartFont;
/// By default 18 medium
@property (nonatomic, strong) UIFont *stepTitleFont;
/// By default 18 semibold
@property (nonatomic, strong) UIFont *stepNumberFont;
/// By default 16 regular
@property (nonatomic, strong) UIFont *secondaryLabelFont;

/// By default 20 regular. Only font family and weight can be customized. Size is ignored
@property (nonatomic, strong) UIFont *faceTecMessageFont;
/// By default 29 medium. Only font family and weight can be customized. Size is ignored
@property (nonatomic, strong) UIFont *faceTecHeaderFont;
/// By default 15 regular. Only font family and weight can be customized. Size is ignored
@property (nonatomic, strong) UIFont *faceTecSubtextFont;
/// By default 17 semibold. Only font family and weight can be customized. Size is ignored
@property (nonatomic, strong) UIFont *faceTecButtonFont;

/// Method used to change all fonts with font family name, without need to change every font
- (void)setupCustomFontFamily:(NSString *)fontFamily;


// ID Scanning


/**
 * Intructions text font
 *
 * Default: System 17.f
 */
@property (nonatomic, strong) UIFont *idInstructionsFont;

/**
 * Flashlight warning font
 *
 * Default: System (iPhone - 14pt, iPad - 16pt)
 */
@property (nonatomic, strong) UIFont *idFlashlightWarningFont;

// iProov

/// Takes Font Name as String
@property (nonatomic, strong) NSString *iproovFontName;

// Document Verification

/**
 * Intructions text font
 *
 * Default: System 17.f
 */
@property (nonatomic, strong) UIFont *documentVerificationInstructionsFont;

/**
 * Flashlight warning font
 *
 * Default: System (iPhone - 14pt, iPad - 16pt)
 */
@property (nonatomic, strong) UIFont *documentVerificationFlashlightWarningFont;

/**
 * Status view label's font. Status view handles all the messages.
 *
 * Default: SystemFont 17pt SemiBold
*/
@property (nonatomic) UIFont *documentVerificationStatusViewFont;

/**
 * Initial onboarding alert view font.
 *
 * Default: SystemFont 17pt Semibold
*/
@property (nonatomic) UIFont *documentVerificationOnboardingAlertViewTitleFont;

/**
 * Initial onboarding alert view font.
 *
 * Default: SystemFont 14pt Regular
*/
@property (nonatomic) UIFont *documentVerificationOnboardingAlertViewMessageFont;

/**
 * Initial onboarding alert view font.
 *
 * Default: Microblink blue
*/
@property (nonatomic) UIFont *documentVerificationOnboardingAlertViewDoneButtonFont;

/**
 * Need help tutorial view title font.
 *
 * Default: SystemFont 22pt SemiBold
*/
@property (nonatomic) UIFont *documentVerificationTutorialViewTitleFont;

/**
 * Need help tutorial view message font.
 *
 * Default: SystemFont 15pt
*/
@property (nonatomic) UIFont *documentVerificationTutorialViewMessageFont;

/**
 * Need help tutorial view action button next and done font.
 *
 * Default: SystemFont 17pt Bold
*/
@property (nonatomic) UIFont *documentVerificationTutorialViewActionButtonNextFont;

/**
 * Need help tutorial view action button close and back font.
 *
 * Default: SystemFont 17pt
*/
@property (nonatomic) UIFont *documentVerificationTutorialViewActionButtonCloseFont;

@end

NS_ASSUME_NONNULL_END
