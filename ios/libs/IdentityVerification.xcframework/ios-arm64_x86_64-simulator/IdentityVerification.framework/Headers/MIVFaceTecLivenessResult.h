// Created by Tomislav Cvetkovic on 13.05.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVFaceTecLivenessResult : NSObject

/// Returned captured face image
@property (nonatomic, strong, readonly) UIImage *faceImage;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initalizer for result of FaceTec liveness step
/// @param faceImage Returned captured face image
- (instancetype)initWithFaceImage:(UIImage *)faceImage;

@end

NS_ASSUME_NONNULL_END
