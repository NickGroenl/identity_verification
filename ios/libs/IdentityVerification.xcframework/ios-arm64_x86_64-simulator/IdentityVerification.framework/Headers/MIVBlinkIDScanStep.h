//
//  MBStepDocumentScanning.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 07/07/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import "MIVVerificationStep.h"
#import "MIVBlinkIDDocumentFilter.h"
#import "MIVBlinkIDScanResult.h"
#import "MIVDocumentField.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MIVBlinkIDScanStepDelegate <NSObject>

/// Method called when document scan results are confirmed
/// @param blinkIDScanResult Result of scanning document
- (void)blinkIDScanStepResultsConfirmed:(nonnull MIVBlinkIDScanResult *)blinkIDScanResult;

@end

@interface MIVBlinkIDScanStep : MIVVerificationStep

/// License key encoded as string for unlocking SDK
@property (nonatomic, strong, readonly) NSString *microblinkLicense;
/// Result fields that will be shown on Results screen
@property (nonatomic, strong, readonly) NSArray<MIVDocumentField *> *resultFields;
/// Document scan step delegate
@property (nonatomic, weak, readonly) id<MIVBlinkIDScanStepDelegate> blinkIDScanStepDelegate;
/// Result fields that will be processed but not shown on Results screen
@property (nonatomic, strong) NSArray<MIVDocumentField *> *hiddenDocumentFields;
/// Document filter used for filtering by country, region or document type
@property (nonatomic, strong) MIVBlinkIDDocumentFilter *blinkIDDocumentFilter;
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

/// Initializer for Document Scan step
/// @param microblinkLicense License key encoded as string for unlocking SDK
/// @param resultFields Result fields that will be shown on Results screen
/// @param blinkIDScanStepDelegate BlinkID scan step delegate
- (instancetype)initWithMicroblinkLicense:(NSString *)microblinkLicense resultFields:(NSArray<MIVDocumentField *> *)resultFields blinkIDScanStepDelegate:(nullable id<MIVBlinkIDScanStepDelegate>)blinkIDScanStepDelegate;

@end

NS_ASSUME_NONNULL_END
