import 'package:flutter_test/flutter_test.dart';
import 'package:identity_verification_flutter/identity_verification.dart';

void main() {
  group('Verify conditions', (() {
    test('EqualTo', () {
      final condition = EqualTo(stringValue: '111');
      assert(condition.conditionName == ConditionName.Equal_To);
      assert(condition.stringValue == '111');
    });

    test('NotEmpty', () {
      final condition = Required();
      assert(condition.conditionName == ConditionName.Required);
    });

    test('MinLength', () {
      final condition = MinLength(intValue: 3);
      assert(condition.conditionName == ConditionName.Min_Length);
      assert(condition.intValue == 3);
    });

    test('IsDigit', () {
      final condition = IsDigit();
      assert(condition.conditionName == ConditionName.Is_Digit);
    });

    test('StartsWith', () {
      final condition = StartsWith(stringValue: 'aaa');
      assert(condition.conditionName == ConditionName.Starts_With);
      assert(condition.stringValue == 'aaa');
    });
  }));
}
