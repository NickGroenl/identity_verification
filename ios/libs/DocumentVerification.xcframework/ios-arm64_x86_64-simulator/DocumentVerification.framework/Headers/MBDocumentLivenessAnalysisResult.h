// Created by Jura Skrlec on 06.10.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"

typedef NS_ENUM(NSInteger, MDVDocumentLivenessAnalysisResultProcessingStatus) {
    /** Document liveness analysis is not performed. */
    MDVDocumentLivenessAnalysisResultProcessingStatusNotPerformed,
    /** Document liveness analysis is not supported by the license. */
    MDVDocumentLivenessAnalysisResultProcessingStatusUnsupportedByLicense,
    /** Document liveness analysis performed */
    MDVDocumentLivenessAnalysisResultProcessingStatusPerformed
};

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVDocumentLivenessAnalysisResult : NSObject

- (instancetype)init NS_UNAVAILABLE;

/** Status of document liveness analysis process. */
@property (nonatomic, readonly, assign) MDVDocumentLivenessAnalysisResultProcessingStatus processingStatus;

/** Document liveness score */
@property (nonatomic, readonly, assign) CGFloat score;

@end

NS_ASSUME_NONNULL_END
