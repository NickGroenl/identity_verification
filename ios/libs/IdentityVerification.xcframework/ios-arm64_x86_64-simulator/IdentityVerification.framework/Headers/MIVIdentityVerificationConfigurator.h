//
//  MIVConfigurator.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 21/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MIVServiceSettings.h"
#import "MIVVerificationStep.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVIdentityVerificationConfigurator : NSObject

/// Array of steps used for document scanning and liveness flow. Recommended is to use MIVBlinkIDScanStep and MIVFaceTecLivenessStep
@property (nonatomic, strong, readonly) NSArray<MIVVerificationStep *> *verificationSteps;
/// Settings for rest API calls
@property (nonatomic, strong, readonly) MIVServiceSettings *serviceSettings;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for setting license key and unlocking the SDK
/// Define verification steps
/// @param verificationSteps Array of steps used for document scanning and liveness flow. For now, we implemented MIVBlinkIDScanStep and MIVFaceTecLivenessStep
/// @param serviceSettings Settings for rest API calls
- (instancetype)initWithVerificationSteps:(NSArray<MIVVerificationStep *> *)verificationSteps serviceSettings:(MIVServiceSettings *)serviceSettings;

@end

NS_ASSUME_NONNULL_END
