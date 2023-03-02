// Created by Jura Skrlec on 20.09.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBImage.h"

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVSegmentResult : NSObject

- (instancetype)init NS_UNAVAILABLE;

/**
 * Relative box of the analysed 2D feature segment.
 */
@property (nonatomic, readonly, assign) CGRect relativeBox;

/**
 * Determines if the analysed 2D feature segment is verified
 */
@property (nonatomic, readonly, assign) BOOL verified;

/**
 * Cropped segment image
 */
@property (nonatomic, readonly, strong) MDVImage *segmentImage;

@end

NS_ASSUME_NONNULL_END
