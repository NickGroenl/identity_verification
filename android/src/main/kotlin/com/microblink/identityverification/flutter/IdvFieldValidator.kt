package com.microblink.identityverification.flutter

import android.text.TextUtils
import com.microblink.identityverification.result.api.config.fields.validation.Validator
import com.microblink.identityverification.flutter.config.DartConfig

class IdvFieldValidator(private val validators: List<DartConfig.FieldValidator>?) : Validator {

    override fun validateValue(value: String): Boolean {
        return validators?.all {
            validate(it, value)
        } ?: true
    }

    private fun validate(
        it: DartConfig.FieldValidator, value: String
    ): Boolean {
        return when (it.conditionName) {
            DartConfig.ConditionName.Required -> {
                value.isNotEmpty()
            }
            DartConfig.ConditionName.Starts_With -> {
                value.startsWith(it.stringValue!!, ignoreCase = it.ignoreCase ?: true)
            }
            DartConfig.ConditionName.Is_Digit -> {
                TextUtils.isDigitsOnly(value)
            }
            DartConfig.ConditionName.Min_Length -> {
                value.length >= it.intValue!!
            }
            DartConfig.ConditionName.Equal_To -> {
                value.equals(it.stringValue, ignoreCase = it.ignoreCase ?: true)

            }
            DartConfig.ConditionName.Not_Equal_To -> {
                !value.equals(it.stringValue, ignoreCase = it.ignoreCase ?: true)

            }
        }
    }


}