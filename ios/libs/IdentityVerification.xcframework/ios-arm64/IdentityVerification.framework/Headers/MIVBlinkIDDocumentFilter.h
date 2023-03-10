//
//  MIVBlinkIDDocumentFilter.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 12/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Microblink/Microblink.h>

#import "MIVDocumentCountry.h"
#import "MIVDocumentRegion.h"
#import "MIVDocumentType.h"

NS_ASSUME_NONNULL_BEGIN

@interface MIVBlinkIDDocumentFilter: NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// Array of document countries
@property (nonatomic, strong, readonly) NSArray<MIVDocumentCountry *> *documentCountries;
/// Array of document regions
@property (nonatomic, strong, readonly) NSArray<MIVDocumentRegion *> *documentRegions;
/// Array of document types
@property (nonatomic, strong, readonly) NSArray<MIVDocumentType *> *documentTypes;
/// Boolean that respresents if listed countries, region, and types should be allowed or not
@property (readonly) BOOL allowScanning;

/// Initializer for filtering documents by parameters
/// @param documentCountries Array of document countries
/// @param documentRegions Array of document regions
/// @param documentTypes Array of document types
/// @param allowScanning Boolean that respresents if listed countries, region, and types should be allowed or not
- (instancetype)initWithDocumentCountries:(nullable NSArray<MIVDocumentCountry *> *)documentCountries documentRegions:(nullable NSArray<MIVDocumentRegion *> *)documentRegions documentTypes:(nullable NSArray<MIVDocumentType *> *)documentTypes allowScanning:(BOOL)allowScanning;

@end

NS_ASSUME_NONNULL_END
