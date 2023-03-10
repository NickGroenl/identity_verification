import 'package:identity_verification_flutter/src/configuration/builders.dart';

class EqualTo extends FieldValidator {
  EqualTo({required super.stringValue, super.ignoreCase})
      : super(conditionName: ConditionName.Equal_To);
}

class NotEqualTo extends FieldValidator {
  NotEqualTo({required super.stringValue, super.ignoreCase})
      : super(conditionName: ConditionName.Not_Equal_To);
}

class StartsWith extends FieldValidator {
  StartsWith({required super.stringValue, super.ignoreCase = true})
      : super(conditionName: ConditionName.Starts_With);
}

class Required extends FieldValidator {
  Required() : super(conditionName: ConditionName.Required);
}

class MinLength extends FieldValidator {
  MinLength({super.intValue}) : super(conditionName: ConditionName.Min_Length);
}

class IsDigit extends FieldValidator {
  IsDigit() : super(conditionName: ConditionName.Is_Digit);
}
