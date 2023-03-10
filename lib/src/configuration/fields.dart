import 'package:identity_verification_flutter/src/configuration/builders.dart';

class FieldAddress extends DocumentField {
  FieldAddress({super.type = FieldType.ADDRESS, super.modificationConfig});
}

class FieldAdditionalAddressInformation extends DocumentField {
  FieldAdditionalAddressInformation(
      {super.modificationConfig,
      super.type = FieldType.ADDITIONAL_ADDRESS_INFORMATION});
}

class FieldAdditionalNameInformation extends DocumentField {
  FieldAdditionalNameInformation(
      {super.modificationConfig,
      super.type = FieldType.ADDITIONAL_NAME_INFORMATION});
}

class FieldDateOfBirth extends DocumentField {
  FieldDateOfBirth({super.type = FieldType.DATE_OF_BIRTH});
}

class FieldDateOfIssue extends DocumentField {
  FieldDateOfIssue({super.type = FieldType.DATE_OF_ISSUE});
}

class FieldDateOfExpiry extends DocumentField {
  FieldDateOfExpiry({super.type = FieldType.DATE_OF_EXPIRY});
}

class FieldDateOfExpiryPermanent extends DocumentField {
  FieldDateOfExpiryPermanent({super.type = FieldType.DATE_OF_EXPIRY_PERMANENT});
}

class FieldDocumentAdditionalNumber extends DocumentField {
  FieldDocumentAdditionalNumber(
      {super.modificationConfig,
      super.type = FieldType.DOCUMENT_ADDITIONAL_NUMBER});
}

class FieldDocumentNumber extends DocumentField {
  FieldDocumentNumber(
      {super.modificationConfig, super.type = FieldType.DOCUMENT_NUMBER});
}

class FieldEmployer extends DocumentField {
  FieldEmployer({super.modificationConfig, super.type = FieldType.EMPLOYER});
}

class FieldFirstName extends DocumentField {
  FieldFirstName({super.modificationConfig, super.type = FieldType.FIRST_NAME});
}

class FieldFullName extends DocumentField {
  FieldFullName({super.modificationConfig, super.type = FieldType.FULL_NAME});
}

class FieldIssuingAuthority extends DocumentField {
  FieldIssuingAuthority(
      {super.modificationConfig, super.type = FieldType.ISSUING_AUTHORITY});
}

class FieldLastName extends DocumentField {
  FieldLastName({super.modificationConfig, super.type = FieldType.LAST_NAME});
}

class FieldLocalizedName extends DocumentField {
  FieldLocalizedName(
      {super.modificationConfig, super.type = FieldType.LOCALIZED_NAME});
}

class FieldMaritalStatus extends DocumentField {
  FieldMaritalStatus(
      {super.modificationConfig, super.type = FieldType.MARITAL_STATUS});
}

class FieldNationality extends DocumentField {
  FieldNationality(
      {super.modificationConfig, super.type = FieldType.NATIONALITY});
}

class FieldPersonalIdNumber extends DocumentField {
  FieldPersonalIdNumber(
      {super.modificationConfig, super.type = FieldType.PERSONAL_ID_NUMBER});
}

class FieldPlaceOfBirth extends DocumentField {
  FieldPlaceOfBirth(
      {super.modificationConfig, super.type = FieldType.PLACE_OF_BIRTH});
}

class FieldProfession extends DocumentField {
  FieldProfession(
      {super.modificationConfig, super.type = FieldType.PROFESSION});
}

class FieldRace extends DocumentField {
  FieldRace({super.modificationConfig, super.type = FieldType.RACE});
}

class FieldReligion extends DocumentField {
  FieldReligion({super.modificationConfig, super.type = FieldType.RELIGION});
}

class FieldResidentialStatus extends DocumentField {
  FieldResidentialStatus(
      {super.modificationConfig, super.type = FieldType.RESIDENTIAL_STATUS});
}

class FieldSex extends DocumentField {
  FieldSex({super.modificationConfig, super.type = FieldType.SEX});
}
