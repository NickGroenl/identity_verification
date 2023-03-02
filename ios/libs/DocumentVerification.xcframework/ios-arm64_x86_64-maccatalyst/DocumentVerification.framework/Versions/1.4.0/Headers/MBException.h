//
//  MBException.h
//  Pdf417MobiDev
//
//  Created by Jura Skrlec on 07/02/2018.
//

#ifndef MBException_h
#define MBException_h

typedef NSString * MDVExceptionName NS_EXTENSIBLE_STRING_ENUM;

FOUNDATION_EXPORT MDVExceptionName const MDVIllegalModificationException;
FOUNDATION_EXPORT MDVExceptionName const MDVInvalidLicenseKeyException;
FOUNDATION_EXPORT MDVExceptionName const MDVInvalidLicenseeKeyException;
FOUNDATION_EXPORT MDVExceptionName const MDVInvalidLicenseResourceException;
FOUNDATION_EXPORT MDVExceptionName const MDVInvalidBundleException;
FOUNDATION_EXPORT MDVExceptionName const MDVMissingSettingsException;
FOUNDATION_EXPORT MDVExceptionName const MDVInvalidArgumentException;

#endif /* MBException_h */
