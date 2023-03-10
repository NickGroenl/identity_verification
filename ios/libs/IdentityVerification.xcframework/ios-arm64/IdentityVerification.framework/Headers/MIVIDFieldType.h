//
//  MIVIDFieldType.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 29/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#ifndef MIVIDFieldType_h
#define MIVIDFieldType_h

typedef NS_ENUM(NSUInteger, MIVIDFieldType) {
    MIVIDFieldTypeAdditionalAddressInformation = 1,
    MIVIDFieldTypeAdditionalNameInformation,
    MIVIDFieldTypeAddress,
    MIVIDFieldTypeDateOfBirth,
    MIVIDFieldTypeDateOfExpiry,
    MIVIDFieldTypeDateOfExpiryPermanent,
    MIVIDFieldTypeDateOfIssue,
    MIVIDFieldTypeDocumentAdditionalNumber,
    MIVIDFieldTypeDocumentNumber,
    MIVIDFieldTypeEmployer,
    MIVIDFieldTypeFirstName,
    MIVIDFieldTypeFullName,
    MIVIDFieldTypeIssuingAuthority,
    MIVIDFieldTypeLastName,
    MIVIDFieldTypeLocalizedName,
    MIVIDFieldTypeMaritalStatus,
    MIVIDFieldTypeNationality,
    MIVIDFieldTypePersonalIdNumber,
    MIVIDFieldTypePlaceOfBirth,
    MIVIDFieldTypeProfession,
    MIVIDFieldTypeRace,
    MIVIDFieldTypeReligion,
    MIVIDFieldTypeResidentialStatus,
    MIVIDFieldTypeSex
};

#endif /* MIVIDFieldType_h */
