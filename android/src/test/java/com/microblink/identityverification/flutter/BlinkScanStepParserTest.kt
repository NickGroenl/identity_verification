package com.microblink.identityverification.flutter

import com.microblink.entities.recognizers.blinkid.generic.classinfo.Country
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Region
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Type
import com.microblink.identityverification.blinkid.manager.config.api.BlinkIdDocumentResultListener
import com.microblink.identityverification.blinkid.manager.config.api.BlinkIdScanStep
import com.microblink.identityverification.blinkid.result.api.BlinkIdDocumentResult
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.DocumentFilter
import com.microblink.identityverification.flutter.document.BlinkIdDocumentFilterImpl
import com.microblink.identityverification.flutter.parser.BlinkIdScanStepParser
import com.microblink.identityverification.flutter.parser.DocumentFieldParser
import com.microblink.identityverification.result.api.VerificationFlowHandler
import org.junit.Test

class BlinkScanStepParserTest {


    private val blinkScanStepParser =
        BlinkIdScanStepParser(DocumentFieldParser(), object : BlinkIdDocumentResultListener {
            override fun onResultConfirmed(
                result: BlinkIdDocumentResult,
                flowHandler: VerificationFlowHandler
            ) {

            }
        })

    private val defaultBlinkIdScanStepBuilder = DartConfig.DocumentScanStep.Builder()
        .setAndroidLicenseFileName("")

    @Test
    fun `null license should crash`() {
        runCatching {
            val result = blinkScanStepParser.parse(
                defaultBlinkIdScanStepBuilder.setAndroidLicenseFileName(null).build()
            )
        }.onFailure {
            assert(true) { "Null license should crash" }
        }

    }


    @Test
    fun `parse correct values`() {
        val  result = blinkScanStepParser.parse(
            defaultBlinkIdScanStepBuilder
                .setShowResultHeader(false)
                .setShowDocumentImages(true)
                .setAttachDocumentListener(true)
                .setSkipUnsupportedBack(false)
                .setDocumentFilter(
                    DocumentFilter.Builder()
                        .setAllowScanning(true)
                        .setCountries(
                            listOf(
                                Country.ANGUILLA.ordinal.toLong(),
                                Country.SPAIN.ordinal.toLong()
                            )
                        )
                        .setRegions(
                            listOf(
                                Region.ALASKA.ordinal.toLong(),
                                Region.SONORA.ordinal.toLong()
                            )
                        ).setTypes(
                            listOf(
                                Type.DRIVER_CARD.ordinal.toLong(),
                                Type.TAX_ID.ordinal.toLong()
                            )
                        )
                        .build()
                )
                .build()
        )
        assert(!result.showResultHeader)
        assert(result.showDocumentImages)
        assert(!(result as BlinkIdScanStep).skipUnsupportedBack)
        assert(result.documentResultListener != null)
        assert(result.blinkIdDocumentFilter != null)
        val docFilter = result.blinkIdDocumentFilter as BlinkIdDocumentFilterImpl
        assert(docFilter.isDocumentAllowed(Country.SPAIN, Region.ALASKA, Type.TAX_ID))

    }


}