//
//  MBAgeLimitStatus.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 22/04/2020.
//

#ifndef MBAgeLimitStatus_h
#define MBAgeLimitStatus_h

typedef NS_ENUM(NSInteger, MDVAgeLimitStatus) {

    /** Status cannot be determined. When date of birth is not known. */
    MDVAgeLimitStatusNotAvailable,

    /** Document owner age is less than the given age limit. */
    MDVAgeLimitStatusBelowAgeLimit,

    /** Document owner age is greater than the given age limit. */
    MDVAgeLimitStatusOverAgeLimit
};

#endif /* MBAgeLimitStatus_h */
