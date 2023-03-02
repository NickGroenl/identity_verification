package com.microblink.identityverification.flutter.parser

import com.microblink.identityverification.docver.manager.config.api.DocumentVerificationResultListener
import com.microblink.identityverification.docver.manager.config.api.DocumentVerificationScanStep
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.document.DocumentVerificationFilterImpl
import com.microblink.identityverification.manager.config.api.DocumentScanStep
import com.microblink.identityverification.manager.config.api.MicroblinkLicenseFile

class DocumentVerificationStepParser(
    private val documentFieldParser: DocumentFieldParser,
    private val documentResultListener: DocumentVerificationResultListener
) : DartModelParser<DartConfig.DocumentScanStep, DocumentScanStep> {

    override fun parse(params: DartConfig.DocumentScanStep): DocumentScanStep {
        requireNotNull(params.androidLicenseFileName) {
            "androidLicensePackageName must be set"
        }

        val license = MicroblinkLicenseFile(params.androidLicenseFileName!!)
        val builder =  DocumentVerificationScanStep.Builder(license)

        params.showResultHeader?.apply {
            builder.showResultHeader(this)

        }
        params.showDocumentImages?.apply {
            builder.showDocumentImages(this)
        }

        params.skipUnsupportedBack?.apply {
            builder.skipUnsupportedBack(this)
        }

        params.documentFields?.apply {
            builder.documentFields(map {
                documentFieldParser.parse(it)
            }.toTypedArray())
        }
        params.hiddenDocumentFields?.apply {
            builder.documentFields(map {
                documentFieldParser.parse(it)
            }.toTypedArray())
        }
        params.attachDocumentListener?.apply {
            builder.documentResultListener(documentResultListener)
        }
        params.documentFilter?.apply {
            builder.documentFilter(
                DocumentVerificationFilterImpl(
                    countries = this.countries,
                    regions = this.regions,
                    types = this.types,
                    allowScanning = this.allowScanning
                ),
            )
        }


        return builder.build()
    }

}