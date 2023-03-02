package com.microblink.identityverification.flutter

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.IdvDartApi
import com.microblink.identityverification.manager.config.api.VerificationFinishListener

class IdvVerificationFinishListener(
    private val idvDartApi: IdvDartApi,
    private val result: DartConfig.Result<Boolean>
) :
    VerificationFinishListener {

    override fun onVerificationCanceled() {
        idvDartApi.onVerificationResult(
            DartConfig.VerificationResult.Builder()
                .setVerificationType(DartConfig.VerificationType.CANCELLED).build(), NoReply()
        )
    }

    override fun onVerificationFailed() {
        idvDartApi.onVerificationResult(
            DartConfig.VerificationResult.Builder()
                .setVerificationType(DartConfig.VerificationType.FAILED).build(), NoReply()
        )
    }

    override fun onVerificationNeedsReview() {
        idvDartApi.onVerificationResult(
            DartConfig.VerificationResult.Builder()
                .setVerificationType(DartConfig.VerificationType.NEEDS_REVIEW).build(),
            NoReply()
        )
    }

    override fun onVerificationSuccess() {
        idvDartApi.onVerificationResult(
            DartConfig.VerificationResult.Builder()
                .setVerificationType(DartConfig.VerificationType.SUCCESS).build(), NoReply()
        )
        result.success(true)
    }
}