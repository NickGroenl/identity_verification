//
//  MIVIDResult.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 02/06/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MIVIDFieldType.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVIDResult : NSObject

/// Enum result field type
@property (nonatomic) MIVIDFieldType fieldType;
/// Bool that shows if item was defined as insertable. By default false
@property (nonatomic) BOOL insertable;
/// Bool that shows if item was defined as editable. By default false
@property (nonatomic) BOOL editable;
/// Defined validation block or default validation block that checks if value is not empty
@property (nonatomic) BOOL (^validationBlock)(id value);
/// Defined keyboard type. By default UIKeyboardTypeDefault
@property (nonatomic) UIKeyboardType keyboardType;
/// Original value read from document. It can be empty
@property (nonatomic, strong) NSString *originalValue;
/// User entered value if the item was defined as insertable and data was not read from the document
@property (nonatomic, strong) NSString *insertedValue;
/// User entered value if the item was defined as editable
@property (nonatomic, strong) NSString *editedValue;
/// Used for API request for insertable and editable field
@property (nonatomic, strong) NSString *key;
/// Used for API request for insertable and editable field
@property (nonatomic, strong) NSString *value;

@end

NS_ASSUME_NONNULL_END
