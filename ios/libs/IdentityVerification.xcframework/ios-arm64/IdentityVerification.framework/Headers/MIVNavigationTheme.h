//
//  MIVNavigationTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 17/07/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVNavigationTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/**
 * Used for customization of UIBarStyle.
 *
 * Default: UIBarStyleDefault
 */
@property (nonatomic) UIBarStyle barStyle;
/**
 * Used for customization translucentcy of UINavigationBar.
 *
 * Default: true
 */
@property (nonatomic) BOOL isTranslucent;
/**
 * This will only be applied to the Close bar button item on the last screen when verification is successful.
 * In a case of failure, the Close button will always be shown.
 *
 * Default: false
 */
@property (nonatomic) BOOL hideBarButtonOnSuccessfulVerification;

/// Used for customization bar tint color of UINavigationBar.
@property (nonatomic, strong) UIColor *barTintColor;
/// Used for customization title color in UINavigationBar.
@property (nonatomic, strong) UIColor *titleColor;
/// Used for customization bar button tint color of UINavigationBar.
@property (nonatomic, strong) UIColor *barButtonItemColor;

@end

NS_ASSUME_NONNULL_END
