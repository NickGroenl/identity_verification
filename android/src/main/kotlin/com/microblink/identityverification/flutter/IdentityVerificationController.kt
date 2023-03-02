package com.microblink.identityverification.flutter

import android.content.Context
import com.microblink.identityverification.IdentityVerificationSDK
import com.microblink.identityverification.blinkid.manager.config.api.BlinkIdDocumentResultListener
import com.microblink.identityverification.docver.manager.config.api.DocumentVerificationResultListener
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.liveness.FacetecLivenessParser
import com.microblink.identityverification.flutter.liveness.IProovLivenessParser
import com.microblink.identityverification.flutter.parser.*
import com.microblink.identityverification.iproov.api.IProovListener
import com.microblink.identityverification.manager.config.api.FaceTecLivenessResultListener

class IdentityVerificationController(
    private val context: Context,
    private val idvSdk: IdentityVerificationSDK.Companion,
    private val verificationFinishListener: IdvVerificationFinishListener,
    private val blinkIdDocumentResultListener: BlinkIdDocumentResultListener,
    private val docVerResultListener: DocumentVerificationResultListener,
    private val faceTecLivenessResultListener: FaceTecLivenessResultListener,
    private val iProovLivenessResultListener: IProovListener
) {

    fun startVerification(config: DartConfig.IdvConfiguration) {

        val documentParser = DocumentFieldParser()
        val blinkIdScanStep = BlinkIdScanStepParser(documentParser, blinkIdDocumentResultListener)
        val docVerScanStepParser = DocumentVerificationStepParser(documentParser, docVerResultListener)
        val facetecLivenessParser = FacetecLivenessParser(faceTecLivenessResultListener)
        val iProovLivenessParser = IProovLivenessParser(iProovLivenessResultListener)
        val verificationServiceSettingsParser = VerificationServiceSettingsParser()

        val idvConfigParser = IdvConfigParser(
            blinkIdScanStep,
            docVerScanStepParser,
            facetecLivenessParser,
            iProovLivenessParser,
            verificationServiceSettingsParser,
            verificationFinishListener
        )

        idvSdk.startVerification(
            context, idvConfigParser.parseIdvConfiguration(config)
        )


    }


}