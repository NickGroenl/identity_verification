// Created by Tomislav Cvetkovic on 18.03.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import "MIVVerificationStep.h"
#import "MIVServiceSettings.h"
#import "MIVFaceTecEnvironment.h"
#import "MIVFaceTecLivenessResult.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MIVFaceTecLivenessStepDelegate <NSObject>

/// Called on success Liveness
/// @param livenessResult Result of liveness scan
- (void)faceTecLivenessCheckSuccessWithLivenessResult:(nonnull MIVFaceTecLivenessResult *)livenessResult NS_SWIFT_NAME(faceTecLivenessCheckSuccessWithLivenessResult(livenessResult:));

@end

@interface MIVFaceTecLivenessStep : MIVVerificationStep

/// enum for selecting between development and production environment
@property (nonatomic, readonly) MIVFaceTecEnvironment environment;
/// FaceTec liveness step delegate
@property (nonatomic, weak, readonly) id<MIVFaceTecLivenessStepDelegate> faceTecLivenessStepDelegate;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initalizer for FaceTec Liveness Step
/// @param environment enum for selecting between development and production environment
/// @param faceTecLivenessStepDelegate FaceTec liveness step delegate
- (instancetype)initWithFaceTecEnvironment:(MIVFaceTecEnvironment)environment faceTecLivenessStepDelegate:(nullable id<MIVFaceTecLivenessStepDelegate>)faceTecLivenessStepDelegate;

/// Initalizer for FaceTec Liveness Step. Default environment is production
/// @param faceTecLivenessStepDelegate FaceTec liveness step delegate
- (instancetype)initWithFaceTecLivenessStepDelegate:(nullable id<MIVFaceTecLivenessStepDelegate>)faceTecLivenessStepDelegate;

@end

NS_ASSUME_NONNULL_END
