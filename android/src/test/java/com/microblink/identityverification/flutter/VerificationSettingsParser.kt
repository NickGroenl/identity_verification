package com.microblink.identityverification.flutter

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.VerificationServiceSettings
import com.microblink.identityverification.flutter.parser.VerificationServiceSettingsParser
import org.junit.Test

class VerificationSettingsParser {

    private val verificationSettingsParser = VerificationServiceSettingsParser()
    private val default = VerificationServiceSettings.Builder()


    @Test
    fun `parse correct values`() {
        val result =
            verificationSettingsParser.parse(
                default.setUrl("https://www.example3.com")
                    .setPublicKeyPins(listOf("pin1", "pin2"))
                    .setRequestTimeout(
                        DartConfig.RequestTimeout.Builder().setReadTimeout(11)
                            .setConnectionTimeout(12)
                            .setWriteTimeout(14)
                            .setTimeoutIntervalForRequest(1.0)
                            .setTimeoutIntervalForResource(1.0)
                            .build()
                    )
                    .setHeaders(mapOf("header1" to "value12", "header2" to "value23"))
                    .build()
            )

        assert(result.publicKeyPins.contentEquals(arrayOf("pin1", "pin2")))
        assert(result.additionalRequestHeaders == mapOf("header1" to "value12", "header2" to "value23"))
        assert(result.requestTimeout.readTimeoutMillis == 11)
        assert(result.requestTimeout.connectionTimeoutMillis == 12)
        assert(result.requestTimeout.writeTimeoutMillis == 14)

    }

}