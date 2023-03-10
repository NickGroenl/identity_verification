//
//  MIVCountry.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 11/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Microblink/Microblink.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentCountry: NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Country wrapper
/// @param country Document country supported by BlinkID
- (instancetype)initWithCountry:(MBCountry)country;

/// Document country supported by BlinkID
@property (readonly) MBCountry country;

@end

NS_ASSUME_NONNULL_END
