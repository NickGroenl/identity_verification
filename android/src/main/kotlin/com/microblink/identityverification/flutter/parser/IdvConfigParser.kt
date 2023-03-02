package com.microblink.identityverification.flutter.parser

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.Liveness
import com.microblink.identityverification.flutter.config.DartConfig.ScanStep
import com.microblink.identityverification.flutter.liveness.FacetecLivenessParser
import com.microblink.identityverification.flutter.liveness.IProovLivenessParser
import com.microblink.identityverification.manager.config.api.IdentityVerificationConfiguration
import com.microblink.identityverification.manager.config.api.MicroblinkLicenseFile
import com.microblink.identityverification.manager.config.api.VerificationFinishListener
import java.text.SimpleDateFormat
import java.util.*

class IdvConfigParser(
    private val blinkIdScanStepParser: BlinkIdScanStepParser,
    private val documentVerificationScanStep: DocumentVerificationStepParser,
    private val facetecLivenessParser: FacetecLivenessParser,
    private val iProovLivenessParser: IProovLivenessParser,
    private val verificationServiceSettingsParser: VerificationServiceSettingsParser,
    private val verificationFinishListener: VerificationFinishListener
) {

    fun parseIdvConfiguration(idvConfig: DartConfig.IdvConfiguration): IdentityVerificationConfiguration {
        val idvConfigBuilder = IdentityVerificationConfiguration.Builder(verificationFinishListener)


        requireNotNull(idvConfig.scanStep)
        idvConfigBuilder.verificationSteps(

            if (idvConfig.scanStep.scanStep == ScanStep.BlinkId) {
                blinkIdScanStepParser.parse(
                    requireNotNull(idvConfig.scanStep)
                )
            } else {
                documentVerificationScanStep.parse(
                    requireNotNull(idvConfig.scanStep)
                )
            },

            if (idvConfig.livenessStep.liveness == Liveness.Facetec)
                facetecLivenessParser.parse(requireNotNull(idvConfig.livenessStep))
            else
                iProovLivenessParser.parse(requireNotNull(idvConfig.livenessStep))

        )

        idvConfig.dateFormat?.apply {
            idvConfigBuilder.dateFormat(SimpleDateFormat(this, Locale.getDefault()))
        }

        idvConfig.verificationServiceSettings.apply {
            idvConfigBuilder.verificationServiceSettings(
                verificationServiceSettingsParser.parse(this)
            )
        }
        idvConfig.disableScreenshots?.apply {
            idvConfigBuilder.disableScreenshots(this)
        }



        return idvConfigBuilder.build()
    }
}