//
//  MIVDocumentVerificationDocumentFilter.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 15.07.2022..
//  Copyright © 2022 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentVerification/DocumentVerification.h>

#import "MIVDocumentVerificationCountry.h"
#import "MIVDocumentVerificationRegion.h"
#import "MIVDocumentVerificationType.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVDocumentVerificationDocumentFilter: NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Array of document countries
@property (nonatomic, strong, readonly) NSArray<MIVDocumentVerificationCountry *> *documentCountries;
/// Array of document regions
@property (nonatomic, strong, readonly) NSArray<MIVDocumentVerificationRegion *> *documentRegions;
/// Array of document types
@property (nonatomic, strong, readonly) NSArray<MIVDocumentVerificationType *> *documentTypes;
/// Boolean that respresents if listed countries, region, and types should be allowed or not
@property (readonly) BOOL allowScanning;

/// Initializer for filtering documents by parameters
/// @param documentCountries Array of document countries
/// @param documentRegions Array of document regions
/// @param documentTypes Array of document types
/// @param allowScanning Boolean that respresents if listed countries, region, and types should be allowed or not
- (instancetype)initWithDocumentCountries:(nullable NSArray<MIVDocumentVerificationCountry *> *)documentCountries documentRegions:(nullable NSArray<MIVDocumentVerificationRegion *> *)documentRegions documentTypes:(nullable NSArray<MIVDocumentVerificationType *> *)documentTypes allowScanning:(BOOL)allowScanning;

@end

NS_ASSUME_NONNULL_END
