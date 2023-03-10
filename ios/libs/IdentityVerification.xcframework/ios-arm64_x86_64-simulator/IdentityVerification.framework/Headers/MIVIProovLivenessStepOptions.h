//
//  MIVIProovLivenessStepOptions.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 10.06.2022..
//  Copyright © 2022 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MIVIProovLivenessUIFilter) {
    MIVIProovLivenessUIFilterClassic,
    MIVIProovLivenessUIFilterShaded,
    MIVIProovLivenessUIFilterVibrant
};

NS_ASSUME_NONNULL_BEGIN

@interface MIVIProovLivenessStepOptions : NSObject

/// Adjust the filter used for the face preview. Can be Classic, Shaded or Vibrant (default).
@property (nonatomic) MIVIProovLivenessUIFilter filter;

@end

NS_ASSUME_NONNULL_END
