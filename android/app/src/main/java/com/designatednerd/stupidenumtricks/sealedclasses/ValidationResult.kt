package com.designatednerd.stupidenumtricks.sealedclasses

import android.support.annotation.StringRes

sealed class ValidationResult {
    class Success: ValidationResult()
    class Error(@StringRes val errorResId: Int): ValidationResult()
}
