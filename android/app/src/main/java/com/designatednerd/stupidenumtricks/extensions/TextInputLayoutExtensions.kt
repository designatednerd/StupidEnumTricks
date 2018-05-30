package com.designatednerd.stupidenumtricks.extensions

import android.support.annotation.StringRes
import android.support.design.widget.TextInputLayout

fun TextInputLayout.setError(@StringRes errorResId: Int) {
    this.context.getString(errorResId)
}