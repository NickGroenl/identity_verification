//
//  MIVDocumentVerificationType.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 14/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentVerification/DocumentVerification.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentVerificationType : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Type wrapper
/// @param type Document type supported by Document Verification
- (instancetype)initWithType:(MDVType)type;

/// Document type supported by Document Verification
@property (readonly) MDVType type;

@end

NS_ASSUME_NONNULL_END
