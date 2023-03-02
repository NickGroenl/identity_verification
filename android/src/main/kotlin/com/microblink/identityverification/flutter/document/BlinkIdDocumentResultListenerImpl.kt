package com.microblink.identityverification.flutter.document

import com.microblink.entities.recognizers.blinkid.generic.imageanalysis.ImageAnalysisResult
import com.microblink.identityverification.blinkid.manager.config.api.BlinkIdDocumentResultListener
import com.microblink.identityverification.blinkid.result.api.BlinkIdDocumentResult
import com.microblink.identityverification.flutter.NoReply
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.DocumentResult
import com.microblink.identityverification.flutter.config.DartConfig.IdvDartApi
import com.microblink.identityverification.flutter.extension.toByteArray
import com.microblink.identityverification.flutter.extension.toDartType
import com.microblink.identityverification.result.api.*

class BlinkIdDocumentResultListenerImpl(private val idvDartApi: IdvDartApi) :
    BlinkIdDocumentResultListener {

    private fun getDartImageAnalysisResult(it: ImageAnalysisResult) =
        DartConfig.ImageAnalysisResult.Builder()
            .setIsBlurred(it.isBlurred)
            .setDocumentImageColorStatus(DartConfig.DocumentImageColorStatus.values()[it.documentImageColorStatus.ordinal])
            .setDocumentImageMoireStatus(DartConfig.ImageAnalysisDetectionStatus.values()[it.documentImageMoireStatus.ordinal])
            .setFaceDetectionStatus(DartConfig.ImageAnalysisDetectionStatus.values()[it.faceDetectionStatus.ordinal])
            .setMrzDetectionStatus(DartConfig.ImageAnalysisDetectionStatus.values()[it.mrzDetectionStatus.ordinal])
            .setBarcodeDetectionStatus(DartConfig.ImageAnalysisDetectionStatus.values()[it.barcodeDetectionStatus.ordinal])
            .build()


    override fun onResultConfirmed(
        result: BlinkIdDocumentResult,
        flowHandler: VerificationFlowHandler
    ) {

        val dartDocResult = DocumentResult.Builder()

        dartDocResult.setResultsFields(result.resultFields.map {
            it.toDartResultField()
        })

        result.documentClassInfo?.apply {
            dartDocResult.setClassInfo(
                DartConfig.ClassInfo.Builder()
                    .setType(DartConfig.Type.values()[region.ordinal])
                    .setCountry(DartConfig.Country.values()[region.ordinal])
                    .setRegion(DartConfig.Region.values()[region.ordinal])
                    .build()
            )
        }

        result.faceImage?.let {
            dartDocResult.setFaceImage(it.toByteArray())
        }

        result.frontSideDocumentImage?.let {
            dartDocResult.setFrontSideDocumentImage(it.toByteArray())
        }
        result.backSideDocumentImage?.let {
            dartDocResult.setFrontSideDocumentImage(it.toByteArray())
        }
        result.frontImageAnalysisResult?.let {
            dartDocResult.setFrontImageAnalysisResult(
                getDartImageAnalysisResult(it)
            )
        }
        result.backImageAnalysisResult?.let {
            dartDocResult.setFrontImageAnalysisResult(
                getDartImageAnalysisResult(it)
            )
        }

        idvDartApi.onResultConfirmed(
            dartDocResult.build(),
            NoReply()
        )

    }


    private fun ResultField.toDartResultField(): DartConfig.ResultField {
        return when (this) {
            is StringResultField -> DartConfig.ResultField.Builder()
                .setResultFieldType(DartConfig.ResultFieldType.StringResult)
                .setType(type.toDartType())
                .setValue1(value).build()
            is InsertedStringResultField -> DartConfig.ResultField.Builder()
                .setResultFieldType(DartConfig.ResultFieldType.InsertedStringResult)
                .setType(type.toDartType())
                .setValue1(insertedValue)
                .build()
            is EditedStringResultField -> DartConfig.ResultField.Builder()
                .setResultFieldType(DartConfig.ResultFieldType.EditedStringResult)
                .setType(type.toDartType())
                .setValue1(initialValue)
                .setValue2(editedValue)
                .build()
            is DateResultField -> DartConfig.ResultField.Builder()
                .setResultFieldType(DartConfig.ResultFieldType.DateResult)
                .setType(type.toDartType()).setSimpleDate(
                    DartConfig.SimpleDate.Builder()
                        .setDay(date.day.toLong())
                        .setMonth(date.month.toLong())
                        .setYear(date.year.toLong())
                        .build()
                )
                .build()
            is BooleanResultField -> DartConfig.ResultField.Builder()
                .setResultFieldType(DartConfig.ResultFieldType.BooleanResult)
                .setType(type.toDartType())
                .setBoolValue(value)
                .build()
        }
    }
}
