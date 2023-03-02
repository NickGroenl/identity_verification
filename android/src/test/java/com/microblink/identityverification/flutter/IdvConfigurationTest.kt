package com.microblink.identityverification.flutter

import com.microblink.identityverification.flutter.config.DartConfig.*
import com.microblink.identityverification.flutter.parser.BlinkIdScanStepParser
import com.microblink.identityverification.flutter.liveness.FacetecLivenessParser
import com.microblink.identityverification.flutter.liveness.IProovLivenessParser
import com.microblink.identityverification.flutter.parser.DocumentVerificationStepParser
import com.microblink.identityverification.flutter.parser.IdvConfigParser
import com.microblink.identityverification.flutter.parser.VerificationServiceSettingsParser
import io.mockk.mockk
import io.mockk.spyk
import io.mockk.verify
import org.junit.Test
import java.text.SimpleDateFormat
import java.util.*

class IdvConfigurationTest {

    private val blinkIdScanStepParser: BlinkIdScanStepParser = mockk(relaxed = true)
    private val docVerParser: DocumentVerificationStepParser = mockk(relaxed = true)
    private val verificationSettingsParser: VerificationServiceSettingsParser =
        mockk(relaxed = true)
    private val faceTecParser: FacetecLivenessParser = mockk(relaxed = true)
    private val iProovParser: IProovLivenessParser = mockk(relaxed = true)

    private val default =
        IdvConfigParser(
            blinkIdScanStepParser,
            docVerParser,
            faceTecParser,
            iProovParser,
            verificationSettingsParser,
            spyk()
        )


    @Test
    fun `parse calls necessary classes `() {
        val result = default.parseIdvConfiguration(
            IdvConfiguration.Builder()
                .setDateFormat("yyyy/MM/dd")
                .setDisableScreenshots(true)
                .setScanStep(DocumentScanStep.Builder().setScanStep(ScanStep.BlinkId).build())
                .setLivenessStep(LivenessStep.Builder().build())
                .setVerificationServiceSettings(
                    VerificationServiceSettings.Builder().setUrl("https://sample.com").build()
                )
                .build()
        )

        verify {
            blinkIdScanStepParser.parse(any())
            verificationSettingsParser.parse(any())
            faceTecParser.parse(any())
        }


        val dateFormat = SimpleDateFormat("yyyy/MM/dd")
        val dateNow = Date()
        assert(result.dateFormat.format(dateNow) == dateFormat.format(dateNow))
        assert(result.areScreenshotsDisabled)
    }
}