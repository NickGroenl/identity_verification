package com.microblink.identityverification.flutter.parser

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.manager.config.api.service.VerificationServiceSettings

class VerificationServiceSettingsParser :
    DartModelParser<DartConfig.VerificationServiceSettings, VerificationServiceSettings> {
    override fun parse(params: DartConfig.VerificationServiceSettings): VerificationServiceSettings {
        val builder = VerificationServiceSettings.Builder(params.url)
        params.headers?.apply {
            val additionalHeaders = mutableMapOf<String, String>()
            params.headers?.entries?.map {
                additionalHeaders.put(it.key, it.value)
            }
            builder.additionalRequestHeaders(additionalHeaders)
        }

        params.requestTimeout?.apply {

            builder.serviceRequestTimeout(
                VerificationServiceSettings.RequestTimeout(
                    this.connectionTimeout.toInt(),
                    this.writeTimeout.toInt(),
                    this.readTimeout.toInt()
                )
            )
        }

        params.publicKeyPins?.apply {
            builder.publicKeyPins(*this.toTypedArray())
        }

        return builder.build()
    }
}