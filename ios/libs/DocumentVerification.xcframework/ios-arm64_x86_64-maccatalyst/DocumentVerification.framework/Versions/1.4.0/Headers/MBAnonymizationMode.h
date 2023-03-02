//
//  MBAnonymizationMode.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 06/07/2020.
//

#ifndef MBAnonymizationMode_h
#define MBAnonymizationMode_h

/**
 * MDVAnonymizationMode is used to define level of anonymization performed on recognizer result.
 */
typedef NS_ENUM(NSInteger, MDVAnonymizationMode) {
    
    /**
     * Anonymization will not be performed.
     */
    MDVAnonymizationModeNone = 0,
    
    /**
     * FullDocumentImage is anonymized with black boxes covering sensitive data.
     */
    MDVAnonymizationModeImageOnly,
    
    /**
     * Result fields containing sensitive data are removed from result.
     */
    MDVAnonymizationModeResultFieldsOnly,
    
    /**
     * This mode is combination of ImageOnly and ResultFieldsOnly modes.
     */
    MDVAnonymizationModeFullResult
};


#endif /* MBAnonymizationMode_h */
