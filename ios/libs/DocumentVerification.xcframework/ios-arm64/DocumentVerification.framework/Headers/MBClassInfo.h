//
//  MBClassInfo.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 09/10/2019.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBClassInfoTypes.h"

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVClassInfo : NSObject <NSSecureCoding>

- (instancetype)init NS_UNAVAILABLE;

/**
 * The document country.
 */
@property (nonatomic, readonly, assign) MDVCountry country;

/**
 * The document region.
 */
@property (nonatomic, readonly, assign) MDVRegion region;

/**
 * The type of the scanned document.
 */
@property (nonatomic, readonly, assign) MDVType type;

/**
 * Flag that indicates if class info is empty
*/
@property (nonatomic, readonly, assign) BOOL empty;

/**
 * The name of the country that issued the scanned document.
*/
@property (nonatomic, readonly, copy, nullable) NSString *countryName;

/**
 * The ISO numeric code of the country that issued the scanned document.
*/
@property (nonatomic, readonly, copy, nullable) NSString *isoNumericCountryCode;

/**
 * The 2 letter ISO code of the country that issued the scanned document.
*/
@property (nonatomic, readonly, copy, nullable) NSString *isoAlpha2CountryCode;

/**
 * The 3 letter ISO code of the country that issued the scanned document.
 */
@property (nonatomic, readonly, copy, nullable) NSString *isoAlpha3CountryCode;

@end

NS_ASSUME_NONNULL_END
