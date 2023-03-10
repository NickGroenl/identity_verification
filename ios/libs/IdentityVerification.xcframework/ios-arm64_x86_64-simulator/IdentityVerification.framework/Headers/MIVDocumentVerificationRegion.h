//
//  MIVDocumentVerificationRegion.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 14/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentVerification/DocumentVerification.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentVerificationRegion : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Region wrapper
/// @param region Document region supported by Document Verification
- (instancetype)initWithRegion:(MDVRegion)region;

/// Document region supported by Document Verification
@property (readonly) MDVRegion region;

@end

NS_ASSUME_NONNULL_END
