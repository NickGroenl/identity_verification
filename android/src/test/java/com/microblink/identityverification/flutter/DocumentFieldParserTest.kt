package com.microblink.identityverification.flutter

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.parser.DocumentFieldParser
import com.microblink.identityverification.result.api.config.fields.*
import org.junit.Test

@Suppress("SameParameterValue")
class DocumentFieldParserTest {

    private val documentFieldParser = DocumentFieldParser()

    @Test
    fun `parse modification config`() {
        val result = documentFieldParser.parseModificationConfig(
            DartConfig.ModificationConfig.Builder()
                .setEditable(true)
                .setInsertable(false)
                .setValidators(
                    listOf(
                        DartConfig.FieldValidator.Builder()
                            .setConditionName(DartConfig.ConditionName.Min_Length)
                            .setIntValue(3).build()
                    )
                )
                .build()
        )


        assert(result?.editable == true)
        assert(result?.insertable == false)
        val idvFieldValidator = result?.validator as IdvFieldValidator
        assert(idvFieldValidator.validateValue("aaa"))

    }



    private fun createDocumentField(fieldType: DartConfig.FieldType): DartConfig.DocumentField {
        return DartConfig.DocumentField.Builder()
            .setType(fieldType)
            .build()
    }

    @Test
    fun `parse first name document field`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.FIRST_NAME)
        )

        assert(result is FieldFirstName)
    }

    @Test
    fun `parse last name`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.LAST_NAME)
        )
        assert(result is FieldLastName)
    }

    @Test
    fun `parse full name`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.FULL_NAME)
        )
        assert(result is FieldFullName)
    }

    @Test
    fun `parse localized name`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.LOCALIZED_NAME)
        )
        assert(result is FieldLocalizedName)
    }

    @Test
    fun `parse additional name info`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.ADDITIONAL_NAME_INFORMATION)
        )
        assert(result is FieldAdditionalNameInformation)
    }

    @Test
    fun `parse date of birth`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.DATE_OF_BIRTH)
        )
        assert(result is FieldDateOfBirth)
    }

    @Test
    fun `parse place of birth`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.PLACE_OF_BIRTH)
        )
        assert(result is FieldPlaceOfBirth)
    }

    @Test
    fun `parse date of issue `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.DATE_OF_ISSUE)
        )
        assert(result is FieldDateOfIssue)
    }

    @Test
    fun `parse date of expiry `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.DATE_OF_EXPIRY)
        )
        assert(result is FieldDateOfExpiry)
    }

    @Test
    fun `parse document number `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.DOCUMENT_NUMBER)
        )
        assert(result is FieldDocumentNumber)
    }


    @Test
    fun `parse personal id number `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.PERSONAL_ID_NUMBER)
        )
        assert(result is FieldPersonalIdNumber)
    }

    @Test
    fun `parse document additional number `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.DOCUMENT_ADDITIONAL_NUMBER)
        )
        assert(result is FieldDocumentAdditionalNumber)
    }

    @Test
    fun `parse address `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.ADDRESS)
        )
        assert(result is FieldAddress)
    }

    @Test
    fun `parse residential status `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.RESIDENTIAL_STATUS)
        )
        assert(result is FieldResidentialStatus)
    }

    @Test
    fun `parse additional address information `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.ADDITIONAL_ADDRESS_INFORMATION)
        )
        assert(result is FieldAdditionalAddressInformation)
    }

    @Test
    fun `parse nationality`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.NATIONALITY)
        )
        assert(result is FieldNationality)
    }

    @Test
    fun `parse issuing authority `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.ISSUING_AUTHORITY)
        )
        assert(result is FieldIssuingAuthority)
    }

    @Test
    fun `parse sex `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.SEX)
        )
        assert(result is FieldSex)
    }

    @Test
    fun `parse marital status `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.MARITAL_STATUS)
        )
        assert(result is FieldMaritalStatus)
    }

    @Test
    fun `parse race `() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.RACE)
        )
        assert(result is FieldRace)
    }

    @Test
    fun `parse religion`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.RELIGION)
        )
        assert(result is FieldReligion)
    }

    @Test
    fun `parse profession`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.PROFESSION)
        )
        assert(result is FieldProfession)
    }

    @Test
    fun `parse employer`() {
        val result = documentFieldParser.parseDocumentField(
            createDocumentField(DartConfig.FieldType.EMPLOYER)
        )
        assert(result is FieldEmployer)
    }
}