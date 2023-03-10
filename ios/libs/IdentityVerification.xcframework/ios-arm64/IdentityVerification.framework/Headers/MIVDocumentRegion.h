//
//  MIVDocumentRegion.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 14/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Microblink/Microblink.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentRegion : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Region wrapper
/// @param region Document region supported by BlinkID
- (instancetype)initWithRegion:(MBRegion)region;

/// Document region supported by BlinkID
@property (readonly) MBRegion region;

@end

NS_ASSUME_NONNULL_END
