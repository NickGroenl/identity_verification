import Foundation
import IdentityVerification

class IdentityVerificationSDK: NSObject {

    var flutterPluginRegistrar: FlutterPluginRegistrar? = nil
    var binaryMessenger: FlutterBinaryMessenger? = nil
    var idvDartApi: IdvDartApi? = nil
    var completion: ((NSNumber, FlutterError?) -> Void)?=nil

    func startIdentityVerification(config:IdvConfiguration) {

        do {
            let serviceSettings = try buildServiceSettings(settings:config.verificationServiceSettings)
            let blinkIDScanStep = try buildDocumentScanStep(scanStep:config.scanStep, blinkIdScanStepdelegate: self, docVerStepDelegate: self)
            let faceTecLiveness = try buildLivenessStep(step:config.livenessStep, faceTecdelegate:self, iproovDelegate: self)
        
        let verificationSteps = [
            blinkIDScanStep,
            faceTecLiveness
        ]
        
        let configurator = MIVIdentityVerificationConfigurator(verificationSteps: verificationSteps, serviceSettings: serviceSettings)
        
        let identityVerification = MIVIdentityVerification(configurator: configurator, delegate: self)
        let viewController = identityVerification.getInitialViewController()
        UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)

        } catch {
            //handle error
            print(error)
        }
    }

}


extension IdentityVerificationSDK: MIVIdentityVerificationDelegate {
    
    func identityVerificationDidFinishSuccessfulVerification(_ identityVerificationViewController: UIViewController) {
        print("identityVerificationDidFinishSuccessfulVerification")
        identityVerificationViewController.dismiss(animated: true, completion: nil)
        let result = VerificationResult.make(with: VerificationType.SUCCESS)
        idvDartApi?.onVerificationResultVerificationResult(result, completion: { error in
            self.completion!(NSNumber(value: true), nil)

        })
    }
    
    func identityVerificationNeedsReview(_ identityVerificationViewController: UIViewController) {
        print("identityVerificationNeedsReview")
        identityVerificationViewController.dismiss(animated: true, completion: nil)
        let result = VerificationResult.make(with: VerificationType.NEEDS_REVIEW)
        idvDartApi?.onVerificationResultVerificationResult(result, completion: { error  in

        })
    }
    
    func identityVerificationDidClose(_ identityVerificationViewController: UIViewController) {
        print("identityVerificationDidClose")
        identityVerificationViewController.dismiss(animated: true, completion: nil)
        let result = VerificationResult.make(with: VerificationType.CANCELLED)
        idvDartApi?.onVerificationResultVerificationResult(result, completion: { error in

        })
    }
    
    func identityVerificationDidInitializeWithSessionId(sessionId: String) {
        print("identityVerificationDidInitializeWithSessionId")
    }
}

extension IdentityVerificationSDK: MIVBlinkIDScanStepDelegate {
    
    func blinkIDScanStepResultsConfirmed(_ blinkIDScanResult: MIVBlinkIDScanResult) {
        let result = buildBlinkIdDocumentResult(result: blinkIDScanResult)
        idvDartApi?.onResultConfirmedDocumentResult(result, completion: { error in
            
        })

         
    }
    
}

extension IdentityVerificationSDK: MIVFaceTecLivenessStepDelegate {
    
    func faceTecLivenessCheckSuccessWithLivenessResult(livenessResult: MIVFaceTecLivenessResult) {
        
        guard let image = UIImage.toByteArray(image: livenessResult.faceImage) else {
            return
        }
        idvDartApi?.onLivenessCheckSuccessImage(image, completion: { error in
            
        })

    }
    
}

extension IdentityVerificationSDK: MIVIProovLivenessStepDelegate {
    
    func iproovLivenessCheckSuccess() {
        print("iproov success")
        idvDartApi?.onLivenessCheckSuccessImage(nil, completion: { error in
            
        })
    }
    
    func iproovLivenessCheckFailure(feedbackCode: String) {
        print("iproov failure \(feedbackCode)")
        idvDartApi?.onLivenessCheckFailureFeebackCode(feedbackCode, completion: { error in
            
        })
    }
    
    func iproovLivenessCheckError(error: Error) {
        print("iproov error \(error.localizedDescription)")
        idvDartApi?.onLivenessCheckErrorError(error.localizedDescription, completion: { error in
            
        })
    }

}

extension IdentityVerificationSDK: MIVDocumentVerificationStepDelegate {
    
    func documentVerificationStepResultsConfirmed(_ documentVerificationResult: MIVDocumentVerificationResult) {
        let result = buildDocumentVerificationResult(result: documentVerificationResult)
        idvDartApi?.onResultConfirmedDocumentResult(result, completion: { error in
            
        })
    }
    

}

