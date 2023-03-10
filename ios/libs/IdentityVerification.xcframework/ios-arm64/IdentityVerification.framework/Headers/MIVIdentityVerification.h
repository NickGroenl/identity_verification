//
//  MIVIdentityVerification.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 16/04/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Microblink/Microblink.h>
#import <UIKit/UIKit.h>

#import "MIVIdentityVerificationConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MIVIdentityVerificationDelegate <NSObject>

/// Delegate method called on sucessful verification
/// @param identityVerificationViewController Returned view controller to handle dismiss
- (void)identityVerificationDidFinishSuccessfulVerification:(nonnull UIViewController *)identityVerificationViewController;

/// Delegate method called on verification that still needs review
/// @param identityVerificationViewController Returned view controller to handle dismiss
- (void)identityVerificationNeedsReview:(nonnull UIViewController *)identityVerificationViewController;

/// Delegate method called when user press close button
/// @param identityVerificationViewController Returned view controller to handle dismiss
- (void)identityVerificationDidClose:(nonnull UIViewController *)identityVerificationViewController;

@optional
/// Delegate method called on sucessful initialization
/// @param sessionId Returns unique session id
- (void)identityVerificationDidInitializeWithSessionId:(nonnull NSString *)sessionId NS_SWIFT_NAME(identityVerificationDidInitializeWithSessionId(sessionId:)) __deprecated_msg("Use identityVerificationDidInitializeWithVerificationId instead.");

/// Delegate method called on sucessful initialization
/// @param verificationId Returns unique verification id
- (void)identityVerificationDidInitializeWithVerificationId:(nonnull NSString *)verificationId NS_SWIFT_NAME(identityVerificationDidInitializeWithVerificationId(verificationId:));

@end

@interface MIVIdentityVerification : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for creating Identity Verification
/// @param configurator Configuration required for Identity Verification initialization
/// @param delegate Delegate required for getting verification result
- (instancetype)initWithConfigurator:(MIVIdentityVerificationConfigurator *)configurator delegate:(id<MIVIdentityVerificationDelegate>)delegate;

/// Method that returns Identity Verification view controller which is with steps UI
- (UIViewController *)getInitialViewController;

@end

NS_ASSUME_NONNULL_END
