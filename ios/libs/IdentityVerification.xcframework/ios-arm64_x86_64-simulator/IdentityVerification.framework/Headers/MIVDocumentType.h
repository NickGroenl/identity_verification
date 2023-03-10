//
//  MIVDocumentType.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 14/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Microblink/Microblink.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentType : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer for Document Type wrapper
/// @param type Document type supported by BlinkID
- (instancetype)initWithType:(MBType)type;

/// Document type supported by BlinkID
@property (readonly) MBType type;

@end

NS_ASSUME_NONNULL_END
