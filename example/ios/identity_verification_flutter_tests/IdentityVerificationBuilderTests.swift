//
//  IdentityVerificationBuilderTests.swift
//  identity_verification_flutter_tests
//
//  Created by Belinda Natividad on 7/28/22.
//

import XCTest
@testable import identity_verification_flutter
@testable import IdentityVerification


class IdentityVerificationBuilderTests: XCTestCase, MIVBlinkIDScanStepDelegate, MIVFaceTecLivenessStepDelegate, MIVDocumentVerificationStepDelegate, MIVIProovLivenessStepDelegate {

    var idvSdk: IdentityVerificationSDK!

     override func setUp() {
        idvSdk = IdentityVerificationSDK()
    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testBuildServiceSettings() throws {
        let verificationServiceSettings = VerificationServiceSettings.make(
            withUrl: "https://www.example3.com",
            requestTimeout: RequestTimeout.make(
                withConnectionTimeout: 12,
                writeTimeout: 14,
                readTimeout: 1,
                timeoutIntervalForRequest: 1,
                timeoutIntervalForResource: 1),
            headers: ["header1": "value12", "header2":"value23"],
            publicKeyPins: ["pin1", "pin2"],
            isUsingSelfSignedCertificate: NSNumber(booleanLiteral: false))
        
        let result = try? buildServiceSettings(settings: verificationServiceSettings)
        
        XCTAssert(result?.baseURL != nil)
        XCTAssert(result?.requestTimeout.timeoutIntervalForRequest == 1)
        XCTAssert(result?.requestTimeout.timeoutIntervalForResource == 1)

    }
    
    func testBuildIDScanStep() {
        let scanStep = DocumentScanStep.make(
            with: ScanStep.blinkId,
            androidLicenseFileName: nil,
            iOSLicense: "abcd1234",
            showDocumentImages: true,
            documentFields: [],
            hiddenDocumentFields: nil,
            attachDocumentListener: nil,
            documentFilter: nil,
            skipUnsupportedBack: nil,
            showResultHeader: nil)
        
        let result = try? buildDocumentScanStep(scanStep:scanStep, blinkIdScanStepdelegate: self, docVerStepDelegate: self)
        
        XCTAssert(scanStep.scanStep == ScanStep.blinkId)
    }
    
    func testBuildFaceTecLivenessStep() {
        let step = LivenessStep.makeWithInitialize(inProduction: NSNumber(booleanLiteral: false), liveness: Liveness.facetec, options: nil)
        
        let result = try? buildLivenessStep(step: step, faceTecdelegate:self, iproovDelegate: self)
        
        XCTAssert(step.liveness == Liveness.facetec)
    }
    
    
    func testBuildDocumentFilter() {
        let filter = DocumentFilter.make(withCountries: [5,8], regions: [1,2], types: [1,5], allowScanning: true)
        
        let result = buildDocumentFilter(documentFilter: filter)
        
        XCTAssert(result.allowScanning == true)
        XCTAssert(result.documentCountries.count == 2)
        XCTAssert(result.documentCountries.contains(where: {$0.country.rawValue == 5}) == true)
        XCTAssert(result.documentCountries.contains(where: {$0.country.rawValue == 8}) == true)
        XCTAssert(result.documentRegions.count == 2)
        XCTAssert(result.documentRegions.contains(where: {$0.region.rawValue == 1}) == true)
        XCTAssert(result.documentRegions.contains(where: {$0.region.rawValue == 2}) == true)
        XCTAssert(result.documentTypes.count == 2)
        XCTAssert(result.documentTypes.contains(where: {$0.type.rawValue == 1}) == true)
        XCTAssert(result.documentTypes.contains(where: {$0.type.rawValue == 5}) == true)
        
    }
    
    func testBuildDocumentField() {
        let config = ModificationConfig.make(withEditable: NSNumber(value:true), insertable:  NSNumber(value:true), validators:nil, keyboardType: .DEFAULT)
        
        let field = DocumentField.make(with: .FIRST_NAME, modificationConfig:config)
        
        let result = try? buildDocumentField(field: field)
        
        XCTAssert(result?.fieldType == .firstName)
    }
    
    func testBuildModificationConfig() {
        let config = ModificationConfig.make(withEditable: NSNumber(value:true), insertable:  NSNumber(value:true), validators:nil, keyboardType: .DEFAULT)
        
        let result = buildModificationConfig(config: config)
        
        XCTAssert(result?.editable == true)
        XCTAssert(result?.insertable == true)
    }
    
    func identityVerificationDidFinishSuccessfulVerification(_ identityVerificationViewController: UIViewController) {
    }
    
    func identityVerificationNeedsReview(_ identityVerificationViewController: UIViewController) {
    }
    
    func identityVerificationDidClose(_ identityVerificationViewController: UIViewController) {
    }
    
    func identityVerificationDidInitializeWithSessionId(sessionId: String) {
    }
    
    func blinkIDScanStepResultsConfirmed(_ blinkIDScanResult: MIVBlinkIDScanResult) {
    }
    
    func iproovLivenessCheckSuccess() {
    }
    
    func iproovLivenessCheckFailure(feedbackCode: String) {
    }
    
    func iproovLivenessCheckError(error: Error) {
    }
    
    func faceTecLivenessCheckSuccessWithLivenessResult(livenessResult: MIVFaceTecLivenessResult) {
    }
    
    func documentVerificationStepResultsConfirmed(_ documentVerificationResult: MIVDocumentVerificationResult) {
    }
    

}
