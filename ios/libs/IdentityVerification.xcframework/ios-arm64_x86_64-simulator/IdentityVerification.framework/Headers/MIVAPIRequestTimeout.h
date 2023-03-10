// Created by Tomislav Cvetkovic on 11/12/2020.
// Copyright (c) 2020 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVAPIRequestTimeout : NSObject

/**
 * The timeout interval to use when waiting for additional data.
 *
 * Implemented directly with NSURLSession. More info on https://developer.apple.com/documentation/foundation/nsurlsessionconfiguration/1408259-timeoutintervalforrequest
 *
 * Default: 60 sec
*/
@property (nonatomic) NSTimeInterval timeoutIntervalForRequest;

/**
 * The maximum amount of time that a resource request should be allowed to take.
 *
 * Implemented directly with NSURLSession. More info on https://developer.apple.com/documentation/foundation/nsurlsessionconfiguration/1408153-timeoutintervalforresource
 *
 * Default: 7 days
*/
@property (nonatomic) NSTimeInterval timeoutIntervalForResource;

@end

NS_ASSUME_NONNULL_END
