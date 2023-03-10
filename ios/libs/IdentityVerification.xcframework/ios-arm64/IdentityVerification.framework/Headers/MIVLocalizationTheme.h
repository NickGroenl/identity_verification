//
//  MIVLocalizationTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 06/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVLocalizationTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// For using custom localization, localization file name must be specified
@property (nonatomic, strong) NSString *localizationFileName;
/// For using custom localization on FaceTec Liveness step, localization file name must be specified
@property (nonatomic, strong) NSString *faceTecLocalizationFileName;

@end

NS_ASSUME_NONNULL_END
