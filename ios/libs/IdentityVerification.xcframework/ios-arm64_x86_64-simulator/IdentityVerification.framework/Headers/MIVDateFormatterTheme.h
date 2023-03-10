//
//  MIVDateFormatterTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 31/08/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVDateFormatterTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// Custom date format. By default, date will be shown as dd MMM yyyy. Example: 10 Sep 1989
/// You can specify custom format. Example: dd.MM.yyyy.
@property (nonatomic, strong) NSString *customDateFormat;

@end

NS_ASSUME_NONNULL_END
