//
//  MBDriverLicenseDetailedInfo.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 17/06/2019.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"

@class MDVVehicleClassInfo;

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVDriverLicenseDetailedInfo : NSObject

- (instancetype)init NS_UNAVAILABLE;

/**
 * The restrictions to driving privileges for the United States driver license owner.
 */
@property (nonatomic, readonly, nullable) NSString *restrictions;

/**
 * The additional privileges granted to the United States driver license owner.
 */
@property (nonatomic, readonly, nullable) NSString *endorsements;

/**
 * The type of vehicle the driver license owner has privilege to drive.
 */
@property (nonatomic, readonly, nullable) NSString *vehicleClass;

/**
 * The driver license conditions.
 */
@property (nonatomic, readonly, nullable) NSString *conditions;

/**
 * The additional information on vehicle class.
 */
@property (nonatomic, readonly, nullable) NSArray<MDVVehicleClassInfo *> *vehicleClassesInfo;

@end

NS_ASSUME_NONNULL_END
