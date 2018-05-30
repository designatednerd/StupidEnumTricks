package com.designatednerd.stupidenumtricks.sealedclasses

import android.support.annotation.StringRes
import android.text.Editable
import com.designatednerd.stupidenumtricks.R

sealed class Validator {
    abstract fun validate(): ValidationResult

    class Email(val email: Editable?): Validator() {
        override fun validate(): ValidationResult {
            return if (email == null) {
                ValidationResult.Error(R.string.error_field_required)
            } else if (email.isEmpty()) {
                ValidationResult.Error(R.string.error_field_required)
            } else if (!email.contains("@")) {
                ValidationResult.Error(R.string.error_invalid_email)
            } else {
                ValidationResult.Success()
            }
        }
    }

    class Password(val password: Editable?): Validator() {
        val minimumPasswordLength = 6

        override fun validate(): ValidationResult {
            return if (password == null) {
                ValidationResult.Error(R.string.error_field_required)
            } else if (password.length < minimumPasswordLength) {
                ValidationResult.Error(R.string.error_invalid_password)
            } else {
                ValidationResult.Success()
            }
        }
    }

    class ConfirmPassword(
            val originalPassword: Editable?,
            val secondPassword: Editable?
    ): Validator() {
        override fun validate(): ValidationResult {
            val second = secondPassword ?: return ValidationResult.Error(R.string.error_field_required)
            val original = originalPassword ?: return ValidationResult.Error(R.string.error_passwords_dont_match)
            return when (second) {
                original -> ValidationResult.Success()
                else -> ValidationResult.Error(R.string.error_passwords_dont_match)
            }
        }
    }
}


