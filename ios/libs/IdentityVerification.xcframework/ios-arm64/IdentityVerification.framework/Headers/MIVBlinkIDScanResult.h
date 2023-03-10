// Created by Tomislav Cvetkovic on 13.05.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import <Microblink/Microblink.h>
#import "MIVIDResult.h"
NS_ASSUME_NONNULL_BEGIN

@interface MIVBlinkIDScanResult : NSObject

/// Defines possible color and moire statuses determined from scanned back image.
@property (nonatomic, strong, readonly) MBImageAnalysisResult *backImageAnalysisResult;
/// Image of back side document
@property (nonatomic, strong, readonly) UIImage *backSideDocumentImage;
/// Face image from scanned document
@property (nonatomic, strong, readonly) UIImage *faceImage;
 /// Defines possible color and moire statuses determined from scanned front image.
@property (nonatomic, strong, readonly) MBImageAnalysisResult *frontImageAnalysisResult;
/// Image of back side document
@property (nonatomic, strong, readonly) UIImage *frontSideDocumentImage;
/// Result fields shown on Results screen
@property (nonatomic, strong, readonly) NSArray<MIVIDResult *> *resultFields;
/// Signature image from scanned document
@property (nonatomic, strong, readonly) UIImage *signatureImage;
/// Document classification information
@property (nonatomic, strong, readonly) MBClassInfo *classInfo;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (NSDictionary<NSString*, MIVIDResult*> *)resultFieldAsDictionary;

/// Initializer for Documents Scan result
/// @param backImageAnalysisResult Defines possible color and moire statuses determined from scanned back image.
/// @param backSideDocumentImage Image of back side document
/// @param faceImage Face image from scanned document
/// @param frontImageAnalysisResult Defines possible color and moire statuses determined from scanned front image.
/// @param frontSideDocumentImage Image of back side document
/// @param resultFields Result fields shown on Results screen
/// @param signatureImage Signature image from scanned document
/// @param classInfo Document classification information
- (instancetype)initWithBackImageAnalysisResult:(MBImageAnalysisResult *)backImageAnalysisResult backSideDocumentImage:(UIImage *)backSideDocumentImage faceImage:(UIImage *)faceImage frontImageAnalysisResult:(MBImageAnalysisResult *)frontImageAnalysisResult frontSideDocumentImage:(UIImage *)frontSideDocumentImage resultFields:(NSArray<MIVIDResult *> *)resultFields signatureImage:(UIImage *)signatureImage classInfo:(MBClassInfo *)classInfo;

@end

NS_ASSUME_NONNULL_END
