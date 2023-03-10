// Created by Tomislav Cvetkovic on 12.10.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import "MIVVerificationStep.h"
#import "MIVDocumentVerificationDocumentFilter.h"
#import "MIVDocumentVerificationResult.h"
#import "MIVDocumentField.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MIVDocumentVerificationStepDelegate <NSObject>

/// Method called when document scan results are confirmed
/// @param documentVerificationResult Result of scanning document
- (void)documentVerificationStepResultsConfirmed:(nonnull MIVDocumentVerificationResult *)documentVerificationResult;

@end

@interface MIVDocumentVerificationStep : MIVVerificationStep

/// License key encoded as string for unlocking SDK
@property (nonatomic, strong, readonly) NSString *microblinkLicense;
/// Result fields that will be shown on Results screen
@property (nonatomic, strong, readonly) NSArray<MIVDocumentField *> *resultFields;
/// Document scan step delegate
@property (nonatomic, weak, readonly) id<MIVDocumentVerificationStepDelegate> documentVerificationStepDelegate;
/// Result fields that will be processed but not shown on Results screen
@property (nonatomic, strong) NSArray<MIVDocumentField *> *hiddenDocumentFields;
/// Document filter used for filtering by country, region or document type
@property (nonatomic, strong) MIVDocumentVerificationDocumentFilter *documentFilter;
/// Showing document images on the bottom of the Result screen. Default: true
@property (nonatomic) BOOL showDocumentImages;
/// Showing header with face image, name and address on the top of the Result screen. Default: true
@property (nonatomic) BOOL showResultHeader;
/**
 * Skip back side capture and processing step when back side of the document is not supported
 *
 * Default: NO
 */
@property (nonatomic, assign) BOOL skipUnsupportedBack;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Verification step
/// @param microblinkLicense License key encoded as string for unlocking SDK
/// @param resultFields Result fields that will be shown on Results screen
/// @param documentVerificationStepDelegate Document scan step delegate
- (instancetype)initWithMicroblinkLicense:(NSString *)microblinkLicense resultFields:(NSArray<MIVDocumentField *> *)resultFields documentVerificationStepDelegate:(nullable id<MIVDocumentVerificationStepDelegate>)documentVerificationStepDelegate;

@end

NS_ASSUME_NONNULL_END

