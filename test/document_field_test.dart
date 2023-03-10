import 'package:flutter_test/flutter_test.dart';
import 'package:identity_verification_flutter/identity_verification.dart';

void main() {
  group('Verify field type', (() {
    test('address', () {
      final field = FieldAddress();
      assert(field.type == FieldType.ADDRESS);
    });

    test('additional address', () {
      final field = FieldAdditionalAddressInformation();
      assert(field.type == FieldType.ADDITIONAL_ADDRESS_INFORMATION);
    });

    test('additional name', () {
      final field = FieldAdditionalNameInformation();
      assert(field.type == FieldType.ADDITIONAL_NAME_INFORMATION);
    });

    test('dob', () {
      final field = FieldDateOfBirth();
      assert(field.type == FieldType.DATE_OF_BIRTH);
    });

    test('date of expiry', () {
      final field = FieldDateOfExpiry();
      assert(field.type == FieldType.DATE_OF_EXPIRY);
    });

    test('date of expiry permanent', () {
      final field = FieldDateOfExpiryPermanent();
      assert(field.type == FieldType.DATE_OF_EXPIRY_PERMANENT);
    });

    test('date of issue', () {
      final field = FieldDateOfIssue();
      assert(field.type == FieldType.DATE_OF_ISSUE);
    });

    test('doc additional number', () {
      final field = FieldDocumentAdditionalNumber();
      assert(field.type == FieldType.DOCUMENT_ADDITIONAL_NUMBER);
    });

    test('doc number', () {
      final field = FieldDocumentNumber();
      assert(field.type == FieldType.DOCUMENT_NUMBER);
    });

    test('employer', () {
      final field = FieldEmployer();
      assert(field.type == FieldType.EMPLOYER);
    });

    test('first name', () {
      final field = FieldFirstName();
      assert(field.type == FieldType.FIRST_NAME);
    });

    test('fullname', () {
      final field = FieldFullName();
      assert(field.type == FieldType.FULL_NAME);
    });

    test('issuing authority', () {
      final field = FieldIssuingAuthority();
      assert(field.type == FieldType.ISSUING_AUTHORITY);
    });

    test('last name', () {
      final field = FieldLastName();
      assert(field.type == FieldType.LAST_NAME);
    });

    test('localized name', () {
      final field = FieldLocalizedName();
      assert(field.type == FieldType.LOCALIZED_NAME);
    });

    test('marital status', () {
      final field = FieldMaritalStatus();
      assert(field.type == FieldType.MARITAL_STATUS);
    });

    test('nationality', () {
      final field = FieldNationality();
      assert(field.type == FieldType.NATIONALITY);
    });

    test('personal id number', () {
      final field = FieldPersonalIdNumber();
      assert(field.type == FieldType.PERSONAL_ID_NUMBER);
    });

    test('place of birth', () {
      final field = FieldPlaceOfBirth();
      assert(field.type == FieldType.PLACE_OF_BIRTH);
    });

    test('profession', () {
      final field = FieldProfession();
      assert(field.type == FieldType.PROFESSION);
    });

    test('race', () {
      final field = FieldRace();
      assert(field.type == FieldType.RACE);
    });

    test('religion', () {
      final field = FieldReligion();
      assert(field.type == FieldType.RELIGION);
    });

    test('residential status', () {
      final field = FieldResidentialStatus();
      assert(field.type == FieldType.RESIDENTIAL_STATUS);
    });

    test('sex', () {
      final field = FieldSex();
      assert(field.type == FieldType.SEX);
    });
  }));
}
