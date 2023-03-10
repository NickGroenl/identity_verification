//
//  MBImageAnalysisResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 06/07/2020.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBDocumentImageColorStatus.h"
#import "MBImageAnalysisDetectionStatus.h"

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVImageAnalysisResult : NSObject

MB_INIT_UNAVAILABLE

/**
 * Whether the image is blurred.
 */
@property (nonatomic, readonly, assign) BOOL blurred;

/**
 * The color status determined from scanned image.
 */
@property (nonatomic, readonly, assign) MDVDocumentImageColorStatus documentImageColorStatus;

/**
 * The Moire pattern detection status determined from the scanned image.
 */
@property (nonatomic, readonly, assign) MDVImageAnalysisDetectionStatus documentImageMoireStatus;

/**
 * Face detection status determined from the scanned image.
 */
@property (nonatomic, readonly, assign) MDVImageAnalysisDetectionStatus faceDetectionStatus;

/**
 * Mrz detection status determined from the scanned image.
 */
@property (nonatomic, readonly, assign) MDVImageAnalysisDetectionStatus mrzDetectionStatus;

/**
 * Barcode detection status determined from the scanned image.
 */
@property (nonatomic, readonly, assign) MDVImageAnalysisDetectionStatus barcodeDetectionStatus;

@end

NS_ASSUME_NONNULL_END
