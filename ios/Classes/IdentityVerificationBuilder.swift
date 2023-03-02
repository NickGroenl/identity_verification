//
//  IdentityVerificationBuilder.swift
//  identity_verification_flutter
//
//  Created by Belinda Natividad on 7/26/22.
//

import Foundation
import IdentityVerification

// MARK: Identity Verification Configuration
func buildServiceSettings(settings: VerificationServiceSettings) throws -> MIVServiceSettings {
    
    var serviceSettings = MIVServiceSettings(baseURL: settings.url)
    
    if let header = settings.headers {
        serviceSettings = MIVServiceSettings(baseURL: settings.url, additionalRequestHeaders: header as [AnyHashable : Any])
    }

    if let keys = settings.publicKeyPins {
        serviceSettings.publicKeys = keys.compactMap{ $0 }
    }

    if let timeout = settings.requestTimeout {
        let requestTimeOut = MIVAPIRequestTimeout()

        requestTimeOut.timeoutIntervalForRequest = TimeInterval(timeout.timeoutIntervalForRequest.doubleValue)
        requestTimeOut.timeoutIntervalForResource = TimeInterval(timeout.timeoutIntervalForResource.doubleValue)

        serviceSettings.requestTimeout = requestTimeOut
    }

    if let isSelfSigned = settings.isUsingSelfSignedCertificate {
        serviceSettings.isUsingSelfSignedCertificate = isSelfSigned.boolValue
    }
    
    return serviceSettings
}

func buildDocumentScanStep(scanStep: DocumentScanStep, blinkIdScanStepdelegate: MIVBlinkIDScanStepDelegate, docVerStepDelegate:MIVDocumentVerificationStepDelegate) throws -> MIVVerificationStep {
    
    if scanStep.scanStep == .documentVerification {
        
        var fields:[MIVDocumentField] = []
        if let f = scanStep.documentFields?.compactMap({$0}) {
            fields = try buildDocumentFields(fields: f)
        }
        
        let docVerStep = MIVDocumentVerificationStep(microblinkLicense: scanStep.iOSLicense ?? "", resultFields: fields, documentVerificationStepDelegate: docVerStepDelegate)
        
        if let hiddenFields = scanStep.hiddenDocumentFields?.compactMap({$0}) {
            docVerStep.hiddenDocumentFields = try buildDocumentFields(fields: hiddenFields)
        }

        if let showDocImages = scanStep.showDocumentImages {
            docVerStep.showDocumentImages = showDocImages.boolValue
        }

        if let showResultsHeader = scanStep.showResultHeader {
            docVerStep.showResultHeader = showResultsHeader.boolValue
        }

        if let skipUnsupportedBack = scanStep.skipUnsupportedBack {
            docVerStep.skipUnsupportedBack = skipUnsupportedBack.boolValue
        }

        if let docFilter = scanStep.documentFilter {
            let f = buildDocVerDocumentFilter(documentFilter: docFilter)
            docVerStep.documentFilter = f
        }

        
        return docVerStep
    }
    
    var fields:[MIVDocumentField] = []
    if let f = scanStep.documentFields?.compactMap({$0}) {
        fields = try buildDocumentFields(fields: f)
    }
    
    let blinkIdScanStep = MIVBlinkIDScanStep(microblinkLicense: scanStep.iOSLicense ?? "", resultFields:fields, blinkIDScanStepDelegate: blinkIdScanStepdelegate)
    
    if let hiddenFields = scanStep.hiddenDocumentFields?.compactMap({$0}) {
        blinkIdScanStep.hiddenDocumentFields = try buildDocumentFields(fields: hiddenFields)
    }

    if let showDocImages = scanStep.showDocumentImages {
        blinkIdScanStep.showDocumentImages = showDocImages.boolValue
    }

    if let showResultsHeader = scanStep.showResultHeader {
        blinkIdScanStep.showResultHeader = showResultsHeader.boolValue
    }

    if let skipUnsupportedBack = scanStep.skipUnsupportedBack {
        blinkIdScanStep.skipUnsupportedBack = skipUnsupportedBack.boolValue
    }

    if let docFilter = scanStep.documentFilter {
        let f = buildDocumentFilter(documentFilter: docFilter)
        blinkIdScanStep.blinkIDDocumentFilter = f
    }
    
    return blinkIdScanStep
}

func buildLivenessStep(step: LivenessStep, faceTecdelegate: MIVFaceTecLivenessStepDelegate, iproovDelegate:MIVIProovLivenessStepDelegate) throws -> MIVVerificationStep {
    if step.liveness == Liveness.iProov {
        let iproovLiveness = MIVIProovLivenessStep(iproovLivenessStepDelegate: iproovDelegate)
        
        if let options = step.options {
            let iproovOptions = MIVIProovLivenessStepOptions()
            
            var filter:MIVIProovLivenessUIFilter = .classic
            switch options.filter {
            case .classic:
                filter = .classic
            case .shaded:
                filter = .shaded
            case .vibrant:
                filter = .vibrant
            }
            
            iproovOptions.filter = filter
            iproovLiveness.options = iproovOptions

            print("iproovOptions.filter \(iproovOptions.filter) iproovLiveness.options \(iproovLiveness.options)")
        }
        
        print("iproovLiveness \(iproovLiveness)")

        return iproovLiveness
    }
    
    return MIVFaceTecLivenessStep(faceTecEnvironment: step.initializeInProduction == true ? .production : .development, faceTecLivenessStepDelegate: faceTecdelegate)
}

// MARK: Document Filter
func buildDocumentCountries(countriesIndex:[Int]) -> [MIVDocumentCountry] {
    var documentCountries:[MIVDocumentCountry] = []
    countriesIndex.forEach { idx in
        if let c = MBCountry(rawValue: idx) {
            documentCountries.append(MIVDocumentCountry(country:c))
        }
    }

    return documentCountries
    
}

func buildDocVerDocumentCountries(countriesIndex:[Int]) -> [MIVDocumentVerificationCountry] {
    var documentCountries:[MIVDocumentVerificationCountry] = []
    countriesIndex.forEach { idx in
        if let c = MDVCountry(rawValue: idx) {
            documentCountries.append(MIVDocumentVerificationCountry(country:c))
        }
    }

    return documentCountries
    
}

func buildDocumentRegions(regionsIndex:[Int]) -> [MIVDocumentRegion] {
    var documentRegions:[MIVDocumentRegion] = []
    regionsIndex.forEach { idx in
        if let r = MBRegion(rawValue:idx) {
            documentRegions.append(MIVDocumentRegion(region:r))
        }
    }

    return documentRegions
    
}

func buildDocVerDocumentRegions(regionsIndex:[Int]) -> [MIVDocumentVerificationRegion] {
    var documentRegions:[MIVDocumentVerificationRegion] = []
    regionsIndex.forEach { idx in
        if let r = MDVRegion(rawValue:idx) {
            documentRegions.append(MIVDocumentVerificationRegion(region:r))
        }
    }

    return documentRegions
    
}

func buildDocumentTypes(typesIndex:[Int]) -> [MIVDocumentType] {
    var documentTypes:[MIVDocumentType] = []
    typesIndex.forEach { idx in
        if let t = MBType(rawValue: idx) {
            documentTypes.append(MIVDocumentType(type:t))
        }
    }

    return documentTypes
    
}

func buildDocVerDocumentTypes(typesIndex:[Int]) -> [MIVDocumentVerificationType] {
    var documentTypes:[MIVDocumentVerificationType] = []
    typesIndex.forEach { idx in
        if let t = MDVType(rawValue: idx) {
            documentTypes.append(MIVDocumentVerificationType(type:t))
        }
    }

    return documentTypes
    
}

func buildDocumentFilter(documentFilter:DocumentFilter) -> MIVBlinkIDDocumentFilter {
    
    var documentCountries:[MIVDocumentCountry] = []
    var documentRegions: [MIVDocumentRegion] = []
    var documentTypes: [MIVDocumentType] = []
    
    if let c = documentFilter.countries {
        let indexes = c.compactMap {$0}.map{ $0.intValue }
        documentCountries = buildDocumentCountries(countriesIndex:indexes)
    }

    if let r = documentFilter.regions {
        let indexes = r.compactMap {$0}.map{ $0.intValue }
        documentRegions = buildDocumentRegions(regionsIndex: indexes)
    }

    if let t = documentFilter.types {
        let indexes = t.compactMap {$0}.map{ $0.intValue  }

        documentTypes = buildDocumentTypes(typesIndex: indexes)
    }
    
    return MIVBlinkIDDocumentFilter(
        documentCountries: documentCountries.count > 0 ? documentCountries : nil,
        documentRegions: documentRegions.count > 0 ? documentRegions : nil,
        documentTypes: documentTypes.count > 0 ? documentTypes : nil,
        allowScanning:documentFilter.allowScanning.boolValue)
}

func buildDocVerDocumentFilter(documentFilter:DocumentFilter) -> MIVDocumentVerificationDocumentFilter {
    
    var documentCountries:[MIVDocumentVerificationCountry] = []
    var documentRegions: [MIVDocumentVerificationRegion] = []
    var documentTypes: [MIVDocumentVerificationType] = []
    
    if let c = documentFilter.countries {
        let indexes = c.compactMap {$0}.map{ $0.intValue }
        documentCountries = buildDocVerDocumentCountries(countriesIndex:indexes)
    }

    if let r = documentFilter.regions {
        let indexes = r.compactMap {$0}.map{ $0.intValue }
        documentRegions = buildDocVerDocumentRegions(regionsIndex: indexes)
    }

    if let t = documentFilter.types {
        let indexes = t.compactMap {$0}.map{ $0.intValue  }

        documentTypes = buildDocVerDocumentTypes(typesIndex: indexes)
    }
    
    return MIVDocumentVerificationDocumentFilter(
        documentCountries: documentCountries.count > 0 ? documentCountries : nil,
        documentRegions: documentRegions.count > 0 ? documentRegions : nil,
        documentTypes: documentTypes.count > 0 ? documentTypes : nil,
        allowScanning:documentFilter.allowScanning.boolValue)
}

// MARK: Result
func buildImageAnalysisResult(result:MBImageAnalysisResult) -> ImageAnalysisResult {

    return ImageAnalysisResult.make(
        withIsBlurred:NSNumber(value: result.blurred),
        documentImageColorStatus: DocumentImageColorStatus(rawValue: UInt(result.documentImageColorStatus.rawValue))!,
        documentImageMoireStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.documentImageMoireStatus.rawValue))!,
        face: ImageAnalysisDetectionStatus(rawValue: UInt(result.faceDetectionStatus.rawValue))!,
        mrzDetectionStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.mrzDetectionStatus.rawValue))!,
        barcodeDetectionStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.barcodeDetectionStatus.rawValue))!)
}
 
func buildDocVerImageAnalysisResult(result:MDVImageAnalysisResult) -> ImageAnalysisResult {

    return ImageAnalysisResult.make(
        withIsBlurred:NSNumber(value: result.blurred),
        documentImageColorStatus: DocumentImageColorStatus(rawValue: UInt(result.documentImageColorStatus.rawValue))!,
        documentImageMoireStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.documentImageMoireStatus.rawValue))!,
        face: ImageAnalysisDetectionStatus(rawValue: UInt(result.faceDetectionStatus.rawValue))!,
        mrzDetectionStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.mrzDetectionStatus.rawValue))!,
        barcodeDetectionStatus: ImageAnalysisDetectionStatus(rawValue: UInt(result.barcodeDetectionStatus.rawValue))!)
}


func buildResultField(result:MIVIDResult) -> ResultField {
    
    var resultFieldType:ResultFieldType! = .stringResult
    
    var value1, value2:String?
    value1 = result.originalValue
    
    if result.editedValue != "" {
        resultFieldType = .editedStringResult
        value2 = result.editedValue
    } else if result.insertedValue != "" {
        value1 = result.insertedValue
        resultFieldType = .insertedStringResult
    }

    
    return ResultField.make(
        with: buildResultFieldType(type: result.fieldType) ?? FieldType.FULL_NAME,
        resultFieldType:resultFieldType,
        value1: value1,
        value2: value2,
        boolValue: nil,
        simpleDate: nil,
        insertable: NSNumber(value: result.insertable),
        editable: NSNumber(value: result.editable),
        keyboardType: KeyboardType(rawValue: UInt(result.keyboardType.rawValue))!,
        originalValue: result.originalValue,
        insertedValue: result.insertedValue,
        editedValue: result.editedValue,
        key: result.key,
        value: result.value)
}

func buildBlinkIdDocumentResult(result:MIVBlinkIDScanResult) -> DocumentResult {
    
    var resultFields:[ResultField] = []
    result.resultFields.forEach { field in
        let resultField = buildResultField(result: field)
        resultFields.append(resultField)
        
    }
    
    let faceImage = UIImage.toByteArray(image: result.faceImage)
    let frontSideDocImage = UIImage.toByteArray(image: result.frontSideDocumentImage)
    let backSideDocImage = UIImage.toByteArray(image: result.backSideDocumentImage)
    let signatureImage = UIImage.toByteArray(image: result.signatureImage)
    
    let classInfo = buildClassInfo(classInfo: result.classInfo)
    let frontImageAnalysisResult = buildImageAnalysisResult(result:result.frontImageAnalysisResult)
    let backImageAnalysisResult = buildImageAnalysisResult(result:result.backImageAnalysisResult)

    let r = DocumentResult.make(
        withResultsFields: resultFields.count > 0 ? resultFields : nil,
        faceImage:faceImage != nil ? faceImage : nil,
        frontSideDocumentImage: frontSideDocImage != nil ? frontSideDocImage : nil,
        backSideDocumentImage: backSideDocImage != nil ? backSideDocImage : nil,
        signatureImage: signatureImage != nil ? signatureImage : nil,
        classInfo: classInfo,
        frontImageAnalysisResult: frontImageAnalysisResult,
        back: backImageAnalysisResult)
    
    return r
    
}

func buildDocumentVerificationResult(result:MIVDocumentVerificationResult) -> DocumentResult {
    
    var resultFields:[ResultField] = []
    result.resultFields.forEach { field in
        let resultField = buildResultField(result: field)
        resultFields.append(resultField)
        
    }
    
    let faceImage = UIImage.toByteArray(image: result.faceImage)
    let frontSideDocImage = UIImage.toByteArray(image: result.frontSideDocumentImage)
    let backSideDocImage = UIImage.toByteArray(image: result.backSideDocumentImage)
    let signatureImage = UIImage.toByteArray(image: result.signatureImage)
    
    let classInfo = buildDocVerClassInfo(classInfo: result.classInfo)
    let frontImageAnalysisResult = buildDocVerImageAnalysisResult(result:result.frontImageAnalysisResult)
    let backImageAnalysisResult = buildDocVerImageAnalysisResult(result:result.backImageAnalysisResult)

    let r = DocumentResult.make(
        withResultsFields: resultFields.count > 0 ? resultFields : nil,
        faceImage:faceImage != nil ? faceImage : nil,
        frontSideDocumentImage: frontSideDocImage != nil ? frontSideDocImage : nil,
        backSideDocumentImage: backSideDocImage != nil ? backSideDocImage : nil,
        signatureImage: signatureImage != nil ? signatureImage : nil,
        classInfo: classInfo,
        frontImageAnalysisResult: frontImageAnalysisResult,
        back: backImageAnalysisResult)
    
    return r
    
}

// MARK:
func buildDocumentFields(fields:[DocumentField]) throws -> [MIVDocumentField] {
    var docFields:[MIVDocumentField] = []
    for field in fields {
        if let f = try? buildDocumentField(field:field) {
            docFields.append(f)
        }
    }
    
    return docFields
}

func buildDocumentField(field: DocumentField) throws -> MIVDocumentField? {
    
    var config:MIVModificationConfig?
    if let c = field.modificationConfig {
        config = buildModificationConfig(config: c)
    }
    switch field.type {
    case .FIRST_NAME:
        return field.modificationConfig == nil ? MIVFieldFirstName() : MIVFieldFirstName(modificationConfig:config)
    case .LAST_NAME:
        return field.modificationConfig == nil ? MIVFieldLastName() : MIVFieldLastName(modificationConfig:config)
    case .FULL_NAME:
        return field.modificationConfig == nil ? MIVFieldFullName() : MIVFieldFullName(modificationConfig:config)
    case .LOCALIZED_NAME:
        return field.modificationConfig == nil ? MIVFieldLocalizedName() : MIVFieldLocalizedName(modificationConfig:config)
    case .ADDITIONAL_NAME_INFORMATION:
        return field.modificationConfig == nil ? MIVFieldAdditionalNameInformation() : MIVFieldAdditionalNameInformation(modificationConfig:config)
    case .DATE_OF_BIRTH:
        return MIVFieldDateOfBirth()
    case .PLACE_OF_BIRTH:
        return field.modificationConfig == nil ? MIVFieldPlaceOfBirth() : MIVFieldPlaceOfBirth(modificationConfig:config)
    case .DATE_OF_ISSUE:
        return MIVFieldDateOfIssue()
    case .DATE_OF_EXPIRY:
        return MIVFieldDateOfExpiry()
    case .DATE_OF_EXPIRY_PERMANENT:
        return MIVFieldDateOfExpiryPermanent()
    case .DOCUMENT_NUMBER:
        return field.modificationConfig == nil ? MIVFieldDocumentNumber() : MIVFieldDocumentNumber(modificationConfig:config)
    case .PERSONAL_ID_NUMBER:
        return field.modificationConfig == nil ? MIVFieldPersonalIdNumber() : MIVFieldPersonalIdNumber(modificationConfig:config)
    case .DOCUMENT_ADDITIONAL_NUMBER:
        return field.modificationConfig == nil ? MIVFieldDocumentAdditionalNumber() : MIVFieldDocumentAdditionalNumber(modificationConfig:config)
    case .ADDRESS:
        return field.modificationConfig == nil ? MIVFieldAddress() : MIVFieldAddress(modificationConfig:config)
    case .RESIDENTIAL_STATUS:
        return field.modificationConfig == nil ? MIVFieldResidentialStatus() : MIVFieldResidentialStatus(modificationConfig:config)
    case .ADDITIONAL_ADDRESS_INFORMATION:
        return field.modificationConfig == nil ? MIVFieldAdditionalAddressInformation() : MIVFieldAdditionalAddressInformation(modificationConfig:config)
    case .NATIONALITY:
        return field.modificationConfig == nil ? MIVFieldNationality() : MIVFieldNationality(modificationConfig:config)
    case .ISSUING_AUTHORITY:
        return field.modificationConfig == nil ? MIVFieldIssuingAuthority() : MIVFieldIssuingAuthority(modificationConfig:config)
    case .SEX:
        return field.modificationConfig == nil ? MIVFieldSex() : MIVFieldSex(modificationConfig:config)
    case .MARITAL_STATUS:
        return field.modificationConfig == nil ? MIVFieldMaritalStatus() : MIVFieldMaritalStatus(modificationConfig:config)
    case .RACE:
        return field.modificationConfig == nil ? MIVFieldRace() : MIVFieldRace(modificationConfig:config)
    case .RELIGION:
        return field.modificationConfig == nil ? MIVFieldReligion() : MIVFieldReligion(modificationConfig:config)
    case .PROFESSION:
        return field.modificationConfig == nil ? MIVFieldProfession() : MIVFieldProfession(modificationConfig:config)
    case .EMPLOYER:
        return field.modificationConfig == nil ? MIVFieldEmployer() : MIVFieldEmployer(modificationConfig:config)
    }
}

func buildResultFieldType(type: MIVIDFieldType) -> FieldType? {
    switch type {
    case .additionalAddressInformation:
        return FieldType.ADDITIONAL_ADDRESS_INFORMATION
    case .additionalNameInformation:
        return FieldType.ADDITIONAL_NAME_INFORMATION
    case .address:
        return FieldType.ADDRESS
    case .dateOfBirth:
        return FieldType.DATE_OF_BIRTH
    case .dateOfExpiry:
        return .DATE_OF_EXPIRY
    case .dateOfExpiryPermanent:
        return .DATE_OF_EXPIRY_PERMANENT
    case .dateOfIssue:
        return .DATE_OF_ISSUE
    case .documentAdditionalNumber:
        return .DOCUMENT_ADDITIONAL_NUMBER
    case .documentNumber:
        return .DOCUMENT_NUMBER
    case .employer:
        return .EMPLOYER
    case .firstName:
        return .FIRST_NAME
    case .fullName:
        return .FULL_NAME
    case .issuingAuthority:
        return .ISSUING_AUTHORITY
    case .lastName:
        return .LAST_NAME
    case .localizedName:
        return .LOCALIZED_NAME
    case .maritalStatus:
        return .MARITAL_STATUS
    case .nationality:
        return .NATIONALITY
    case .personalIdNumber:
        return .PERSONAL_ID_NUMBER
    case .placeOfBirth:
        return .PLACE_OF_BIRTH
    case .profession:
        return .PROFESSION
    case .race:
        return .RACE
    case .religion:
        return .RELIGION
    case .residentialStatus:
        return .RESIDENTIAL_STATUS
    case .sex:
        return .SEX
    @unknown default:
        return nil
    }
}

func buildModificationConfig(config:ModificationConfig) -> MIVModificationConfig? {
    
    var keyboardType:UIKeyboardType = UIKeyboardType.default
    switch config.keyboardType {
    case .DEFAULT:
        keyboardType = .default
    case .ASCII_CAPABLE:
        keyboardType = .asciiCapable
    case .NUMBERS_AND_PUNCTUATIONS:
        keyboardType = .numbersAndPunctuation
    case .URL:
        keyboardType = .URL
    case .NUMBER_PAD:
        keyboardType = .numberPad
    case .PHONE_PAD:
        keyboardType = .phonePad
    case .NAME_PHONE_PAD:
        keyboardType = .namePhonePad
    case .EMAIL:
        keyboardType = .emailAddress
    case .DECIMAL_PAD:
        keyboardType = .decimalPad
    case .TWITTER:
        keyboardType = .twitter
    case .WEB_SEARCH:
        keyboardType = .webSearch
    case .ASCII_CAPABLE_NUMPAD:
        if #available(iOS 10.0, *) {
            keyboardType = .asciiCapableNumberPad
        } else {
            keyboardType = .default
        }
    @unknown default:
        keyboardType = .default

    }
    
 
    
    //TODO: Validator
    var c =  MIVModificationConfig(
        editable: config.editable.boolValue,
        insertable: config.insertable.boolValue,
        validator: nil,
        keyboardType:keyboardType)
    
    let v = config.validators?.compactMap({$0})
    if let validators = v {
        c =  MIVModificationConfig(
            editable: config.editable.boolValue,
            insertable: config.insertable.boolValue,
            validator: { string in
                return validators.allSatisfy { validator in
                    validate(validator: validator, value:string)
                }
            },
            keyboardType:keyboardType)
        
    }

    return c
}

func buildClassInfo(classInfo:MBClassInfo) -> ClassInfo {
    
    return ClassInfo.make(
        with: Country(rawValue: UInt(classInfo.country.rawValue))!,
        region: Region(rawValue: UInt(classInfo.region.rawValue))!,
        type: Type(rawValue: UInt(classInfo.type.rawValue))!,
        empty: NSNumber(booleanLiteral: classInfo.empty),
        countryName: classInfo.countryName,
        isoNumericCountryCode: classInfo.isoNumericCountryCode,
        isoAlpha2CountryCode: classInfo.isoAlpha2CountryCode,
        isoAlpha3CountryCode: classInfo.isoAlpha3CountryCode
    )
    
}

func buildDocVerClassInfo(classInfo:MDVClassInfo) -> ClassInfo {
    
    return ClassInfo.make(
        with: Country(rawValue: UInt(classInfo.country.rawValue))!,
        region: Region(rawValue: UInt(classInfo.region.rawValue))!,
        type: Type(rawValue: UInt(classInfo.type.rawValue))!,
        empty: NSNumber(booleanLiteral: classInfo.empty),
        countryName: classInfo.countryName,
        isoNumericCountryCode: classInfo.isoNumericCountryCode,
        isoAlpha2CountryCode: classInfo.isoAlpha2CountryCode,
        isoAlpha3CountryCode: classInfo.isoAlpha3CountryCode
    )
    
}


func validate(validator:FieldValidator, value:String) -> Bool {
    switch validator.conditionName {
    case .starts_With:
        return value.starts(with: validator.stringValue ?? "")
    case .is_Digit:
        return value.isNumeric
    case .min_Length:
        return value.count >= validator.intValue?.intValue ?? 0
    case .required:
        return !value.isEmpty
    case .equal_To:
        return value.caseInsensitiveCompare(validator.stringValue ?? "" ) == .orderedSame
    case .not_Equal_To:
        return !(value.caseInsensitiveCompare(validator.stringValue ?? "" ) == .orderedSame)
        
    }
    
}



