// Created by Tomislav Cvetkovic on 14.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MIVIDFieldType.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVModificationConfig : NSObject

@property (nonatomic, readonly) BOOL editable;
@property (nonatomic, readonly) BOOL insertable;
@property (nullable, nonatomic, readonly) BOOL (^validator)(NSString *value);
@property (nonatomic, readonly) UIKeyboardType keyboardType;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithEditable:(BOOL)editable insertable:(BOOL)insertable validator:(nullable BOOL (^)(NSString *))validator keyboardType:(UIKeyboardType)keyboardType;

@end

NS_ASSUME_NONNULL_END
