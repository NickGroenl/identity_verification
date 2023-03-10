//
//  MIVIProovLivenessStep.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 27.05.2022..
//  Copyright © 2022 Microblink. All rights reserved.
//

#import "MIVVerificationStep.h"
#import "MIVIProovLivenessStepOptions.h"

NS_ASSUME_NONNULL_BEGIN

/// The listener which provides callbacks for the MIVIProovLivenessStep
@protocol MIVIProovLivenessStepDelegate <NSObject>

/// Called when an IProov liveness session is sucessfully completed.
- (void)iproovLivenessCheckSuccess;

/// Called when a the user fails the liveness verification. For more information on the possible values, check out the official documentation https://github.com/iProov/ios#failures
/// @param feedbackCode Returned string representing failure
- (void)iproovLivenessCheckFailure:(NSString *)feedbackCode NS_SWIFT_NAME(iproovLivenessCheckFailure(feedbackCode:));

/// Called when the iProov liveness session fails with an internal error. For more information on the possible error types, check out the official documentation https://github.com/iProov/ios#errors
/// @param error Returned error representing failure
- (void)iproovLivenessCheckError:(NSError *)error NS_SWIFT_NAME(iproovLivenessCheckError(error:));

@end

@interface MIVIProovLivenessStep : MIVVerificationStep

@property (nonatomic, strong) MIVIProovLivenessStepOptions *options;
/// iProov liveness step delegate
@property (nonatomic, weak, readonly) id<MIVIProovLivenessStepDelegate> iproovLivenessStepDelegate;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initalizer for iProov Liveness Step
/// @param iproovLivenessStepDelegate FaceTec liveness step delegate
- (instancetype)initWithIProovLivenessStepDelegate:(nullable id<MIVIProovLivenessStepDelegate>)iproovLivenessStepDelegate NS_SWIFT_NAME(init(iproovLivenessStepDelegate:));

@end

NS_ASSUME_NONNULL_END
