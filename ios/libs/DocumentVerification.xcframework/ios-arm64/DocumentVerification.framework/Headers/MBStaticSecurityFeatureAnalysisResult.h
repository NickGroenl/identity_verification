// Created by Jura Skrlec on 20.09.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import "MBSegmentResult.h"
#import "MBImage.h"
#import "MBMicroblinkDefines.h"

typedef NS_ENUM(NSInteger, MDVStaticSecurityFeatureAnalysisResultProcessingStatus) {
    /** Static security feature analysis is not performed */
    MDVStaticSecurityFeatureAnalysisResultNotPerformed,
    /** Static security feature analysis is not supported by the license */
    MDVStaticSecurityFeatureAnalysisResultUnsupportedByLicense,
    /** Static security feature analysis not available for the current document */
    MDVStaticSecurityFeatureAnalysisResultUnsupportedDocument,
    /** Static security feature analysis performed */
    MDVStaticSecurityFeatureAnalysisResultPerformed
};

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVStaticSecurityFeatureAnalysisResult : NSObject

- (instancetype)init NS_UNAVAILABLE;

/**
 * Status of static security feature analysis process
 */
@property (nonatomic, readonly, assign) MDVStaticSecurityFeatureAnalysisResultProcessingStatus processingStatus;

/**
 * The full document image
 */
@property (nonatomic, readonly, strong, nullable) MDVImage *fullDocumentImage;

/**
 * Defines whether the list of segments that are checked on the document is empty
 */
@property (nonatomic, readonly, assign) BOOL empty NS_SWIFT_NAME(isEmpty);

/**
 * Ratio of verified segments of the document
 */
@property (nonatomic, readonly, assign) CGFloat score;

/**
 * Number of segments.
 */
@property (nonatomic, readonly, assign) NSInteger size;

/**
 * Get MDVSegmentResult for index
 */
- (nullable MDVSegmentResult *)getSegmentResult:(NSInteger)index NS_SWIFT_NAME(getSegmentResult(index:));

@end

NS_ASSUME_NONNULL_END
