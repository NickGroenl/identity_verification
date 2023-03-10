//
//  MIVDocumentVerificationCountry.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 11/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentVerification/DocumentVerification.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentVerificationCountry: NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Country wrapper
/// @param country Document country supported by Document Verification
- (instancetype)initWithCountry:(MDVCountry)country;

/// Document country supported by Document Verification
@property (readonly) MDVCountry country;

@end

NS_ASSUME_NONNULL_END
