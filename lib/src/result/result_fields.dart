import 'package:identity_verification_flutter/identity_verification.dart';
import 'package:identity_verification_flutter/src/configuration/builders.dart';

abstract class DocumentResultField {
  final FieldType fieldType;

  DocumentResultField(this.fieldType);

  String getDisplayString() {
    var text = "";
    if (this is BooleanResultField) {
      text = (this as BooleanResultField).value.toString();
    } else if (this is StringResultField) {
      text = (this as StringResultField).value.toString();
    } else if (this is InsertedStringResultField) {
      text = (this as InsertedStringResultField).value.toString();
    } else if (this is EditedStringResultField) {
      text = (this as EditedStringResultField).editedValue.toString();
    } else if (this is DateResultField) {
      text = (this as DateResultField).value.toIso8601String();
    }

    return text;
  }
}

class BooleanResultField extends DocumentResultField {
  final bool value;

  BooleanResultField(this.value, FieldType fieldType) : super(fieldType);
}

class StringResultField extends DocumentResultField {
  final String value;

  StringResultField(this.value, FieldType fieldType) : super(fieldType);
}

class EditedStringResultField extends DocumentResultField {
  final String originalValue;
  final String editedValue;

  EditedStringResultField(
      this.originalValue, this.editedValue, FieldType fieldType)
      : super(fieldType);
}

class InsertedStringResultField extends DocumentResultField {
  final String value;

  InsertedStringResultField(this.value, FieldType fieldType) : super(fieldType);
}

class DateResultField extends DocumentResultField {
  final DateTime value;

  DateResultField(this.value, FieldType fieldType) : super(fieldType);
}
