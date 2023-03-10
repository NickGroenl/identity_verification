//
//  MIVserviceSettings.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 21/04/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIVAPIRequestTimeout.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVServiceSettings : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Initializer with base url
/// @param baseURL Base URL for API calls
- (instancetype)initWithBaseURL:(NSString *)baseURL;

/// Initializer with base url and additional headers
/// @param baseURL Base URL for API calls
/// @param additionalRequestHeaders Used for custom header in request. By default in header SDK is sending key: "Content-Type" and value: "application/json"
- (instancetype)initWithBaseURL:(NSString *)baseURL additionalRequestHeaders:(nullable NSDictionary *)additionalRequestHeaders;

/// Base URL for API calls
@property (nonatomic, strong, readonly) NSString *baseURL;
/// Used for custom headers in request
@property (nullable, nonatomic, strong, readonly) NSDictionary *additionalRequestHeaders;
/// Array of public keys for SSL pining. By default SSL pinning is not done
@property (nullable, nonatomic, strong) NSArray *publicKeys;
/// Property for defining custom API request timeout intervals
@property (nonatomic, strong) MIVAPIRequestTimeout *requestTimeout;
/// Boolean that is used to handle self-signed certificate. Default: False
@property (nonatomic) BOOL isUsingSelfSignedCertificate;

@end

NS_ASSUME_NONNULL_END
