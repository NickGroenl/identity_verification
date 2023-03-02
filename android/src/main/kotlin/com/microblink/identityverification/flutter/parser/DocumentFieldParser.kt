package com.microblink.identityverification.flutter.parser

import com.microblink.identityverification.flutter.IdvFieldValidator
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.result.api.config.fields.*
import com.microblink.identityverification.result.api.config.fields.defaultModificationConfig as DefaultModificationConfig

class DocumentFieldParser : DartModelParser<DartConfig.DocumentField, DocumentField> {

    fun parseModificationConfig(param: DartConfig.ModificationConfig?): ModificationConfig? {

        return param?.run {
            ModificationConfig(
                insertable = this.insertable,
                editable = this.editable,
                validator = IdvFieldValidator(param.validators)
            )
        }
    }

    fun parseDocumentField(field: DartConfig.DocumentField): DocumentField {

        val modificationConfig = parseModificationConfig(field.modificationConfig)
        return when (field.type) {
            DartConfig.FieldType.FIRST_NAME -> {
                FieldFirstName(modificationConfig ?: DefaultModificationConfig)
            }
            DartConfig.FieldType.LAST_NAME -> {
                FieldLastName(modificationConfig ?: DefaultModificationConfig)
            }
            DartConfig.FieldType.FULL_NAME -> FieldFullName(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.LOCALIZED_NAME -> FieldLocalizedName(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.ADDITIONAL_NAME_INFORMATION -> FieldAdditionalNameInformation(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.DATE_OF_BIRTH -> FieldDateOfBirth()
            DartConfig.FieldType.PLACE_OF_BIRTH -> FieldPlaceOfBirth(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.DATE_OF_ISSUE -> FieldDateOfIssue()
            DartConfig.FieldType.DATE_OF_EXPIRY -> FieldDateOfExpiry()
            DartConfig.FieldType.DATE_OF_EXPIRY_PERMANENT -> FieldDateOfExpiryPermanent()
            DartConfig.FieldType.DOCUMENT_NUMBER -> FieldDocumentNumber(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.PERSONAL_ID_NUMBER -> FieldPersonalIdNumber(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.DOCUMENT_ADDITIONAL_NUMBER -> FieldDocumentAdditionalNumber(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.ADDRESS -> FieldAddress(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.RESIDENTIAL_STATUS -> FieldResidentialStatus(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.ADDITIONAL_ADDRESS_INFORMATION -> FieldAdditionalAddressInformation(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.NATIONALITY -> FieldNationality(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.ISSUING_AUTHORITY -> FieldIssuingAuthority(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.SEX -> FieldSex(modificationConfig ?: DefaultModificationConfig)
            DartConfig.FieldType.MARITAL_STATUS -> FieldMaritalStatus(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.RACE -> FieldRace(modificationConfig ?: DefaultModificationConfig)
            DartConfig.FieldType.RELIGION -> FieldReligion(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.PROFESSION -> FieldProfession(
                modificationConfig ?: DefaultModificationConfig
            )
            DartConfig.FieldType.EMPLOYER -> FieldEmployer(
                modificationConfig ?: DefaultModificationConfig
            )
        }

    }

    override fun parse(params: DartConfig.DocumentField): DocumentField {
        return parseDocumentField(params)
    }

}

