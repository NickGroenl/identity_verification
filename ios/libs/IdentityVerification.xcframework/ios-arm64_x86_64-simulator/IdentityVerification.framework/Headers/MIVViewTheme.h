//
//  MIVViewTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 10/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVViewTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// Corner radius for image view on last screen with photo from document. Default is 20
@property (nonatomic) CGFloat faceImageCornerRadius;
/// Corner radius for all buttons. Default is 10
@property (nonatomic) CGFloat buttonCornerRadius;
/// Corner radius for action view. Default is 10
@property (nonatomic) CGFloat actionViewCornerRadius;
/// Corner radius for each step in action view. Default is 18
@property (nonatomic) CGFloat actionStepCornerRadius;
/// Corner radius for each step in action view. Default is 14
@property (nonatomic) CGFloat resultsPersonImageCornerRadius;
/// Shadow color for each step in action view. Default is nil
@property (nonatomic, strong) UIColor *stepViewShadowColor;
/// Shadow offset of layers shadow for each step in action view. Default is nil
@property (nonatomic) CGSize stepViewShadowOffset;
/// Shadow opacity of layers shadow for each step in action view. Default is nil
@property (nonatomic) CGFloat stepViewShadowOpacity;
/// Shadow blur radius for each step in action view. Default is nil
@property (nonatomic) CGFloat stepViewShadowRadius;
/// Height for all buttons. Default is 50
@property (nonatomic) CGFloat buttonHeight;

// ID Scanning

/**
 * Instructions view corner radius
 *
 * Default: 6
*/
@property (nonatomic, assign)  CGFloat idInstructionsCornerRadius;

/**
 * Flashlight warning corner radius
 *
 * Default: 4
*/
@property (nonatomic, assign) CGFloat idFlashlightWarningCornerRadius;

// Document Verification

/**
 * Instructions view corner radius
 *
 * Default: 6
*/
@property (nonatomic, assign)  CGFloat documentVerificationInstructionsCornerRadius;

/**
 * Flashlight warning corner radius
 *
 * Default: 4
*/
@property (nonatomic, assign) CGFloat documentVerificationFlashlightWarningCornerRadius;

/**
 * Status view corner radius.
 *
 * Default: 6
*/
@property (nonatomic) CGFloat documentVerificationStatusViewCornerRadius;

/**
 * Need help tootlip corner radius.
 *
 * Default: 4
*/
@property (nonatomic) CGFloat documentVerificationTooltipCornerRadius;

@end

NS_ASSUME_NONNULL_END
