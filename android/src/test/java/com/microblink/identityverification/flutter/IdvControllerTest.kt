package com.microblink.identityverification.flutter

import com.microblink.identityverification.blinkid.result.api.BlinkIdDocumentResult
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.config.DartConfig.IdvDartApi
import com.microblink.identityverification.flutter.document.BlinkIdDocumentResultListenerImpl
import com.microblink.identityverification.result.api.*
import com.microblink.identityverification.result.api.config.fields.FieldType
import io.mockk.mockk
import io.mockk.verify
import io.mockk.verifyOrder
import org.junit.Test

class IdvControllerTest {


    @Test
    fun `test verification success listener`() {
        val result: DartConfig.Result<Boolean> = mockk(relaxed = true)
        val idvDartApi: IdvDartApi = mockk(relaxed = true)

        val listener =
            IdvVerificationFinishListener(idvDartApi, result)
        listener.onVerificationSuccess()

        verifyOrder {
            idvDartApi.onVerificationResult(match {
                it.verificationType == DartConfig.VerificationType.SUCCESS
            }, any())
            result.success(true)
        }
    }

    @Test
    fun `test verification failed listener`() {
        val result: DartConfig.Result<Boolean> = mockk(relaxed = true)
        val idvDartApi: IdvDartApi = mockk(relaxed = true)

        val listener =
            IdvVerificationFinishListener(idvDartApi, result)
        listener.onVerificationFailed()

        verifyOrder {
            idvDartApi.onVerificationResult(match {
                it.verificationType == DartConfig.VerificationType.FAILED
            }, any())
        }
    }

    @Test
    fun `test verification needs review listener`() {
        val result: DartConfig.Result<Boolean> = mockk(relaxed = true)
        val idvDartApi: IdvDartApi = mockk(relaxed = true)

        val listener =
            IdvVerificationFinishListener(idvDartApi, result)
        listener.onVerificationNeedsReview()

        verifyOrder {
            idvDartApi.onVerificationResult(match {
                it.verificationType == DartConfig.VerificationType.NEEDS_REVIEW
            }, any())
        }
    }

    @Test
    fun `test verification cancelled listener`() {
        val result: DartConfig.Result<Boolean> = mockk(relaxed = true)
        val idvDartApi: IdvDartApi = mockk(relaxed = true)

        val listener =
            IdvVerificationFinishListener(idvDartApi, result)
        listener.onVerificationCanceled()

        verifyOrder {
            idvDartApi.onVerificationResult(match {
                it.verificationType == DartConfig.VerificationType.CANCELLED
            }, any())
        }
    }

    @Test
    fun `test document result listener calls IdvDartApi onResultConfirmed`() {
        val idvDartApi: IdvDartApi = mockk(relaxed = true)

        val documentResultListener = BlinkIdDocumentResultListenerImpl(idvDartApi)

        documentResultListener.onResultConfirmed(
            BlinkIdDocumentResult(
                listOf(
                    EditedStringResultField(FieldType.PROFESSION, "a", "b"),
                    BooleanResultField(FieldType.RACE, false),
                    DateResultField(FieldType.DATE_OF_BIRTH, SimpleDate(13, 12, 1995)),
                    InsertedStringResultField(FieldType.NATIONALITY, insertedValue = "Filipino"),
                    StringResultField(FieldType.ADDRESS, value = "San Jose"),


                    ),
                mockk(relaxed = true),
                mockk(relaxed = true),
                mockk(relaxed = true),
                mockk(relaxed = true),
                mockk(relaxed = true),
                mockk(relaxed = true),
                mockk(relaxed = true),
            ), mockk(relaxed = true)
        )


        verify {
            idvDartApi.onResultConfirmed(match {

                val editedStringResultField = it.resultsFields?.get(0)
                val booleanResultField = it.resultsFields?.get(1)
                val dateResultField = it.resultsFields?.get(2)
                val insertedStringResultField = it.resultsFields?.get(3)
                val stringResultField = it.resultsFields?.get(4)

                editedStringResultField?.resultFieldType == DartConfig.ResultFieldType.EditedStringResult
                        && editedStringResultField.value1 == "a"
                        && editedStringResultField.value2 == "b"
                        && booleanResultField?.resultFieldType == DartConfig.ResultFieldType.BooleanResult
                        && booleanResultField.boolValue == false
                        && dateResultField?.simpleDate?.day == 13L
                        && dateResultField.simpleDate?.month == 12L
                        && dateResultField.simpleDate?.year == 1995L
                        && dateResultField.resultFieldType == DartConfig.ResultFieldType.DateResult
                        && insertedStringResultField?.resultFieldType == DartConfig.ResultFieldType.InsertedStringResult
                        && insertedStringResultField.value1 == "Filipino"
                        && stringResultField?.value1 == "San Jose"
                        && stringResultField.resultFieldType == DartConfig.ResultFieldType.StringResult

            }, any())
        }

    }


}