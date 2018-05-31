package com.designatednerd.stupidenumtricks.robots

import android.support.annotation.StringRes
import com.designatednerd.stupidenumtricks.activity.SignUpButton
import com.designatednerd.stupidenumtricks.activity.SignUpInput


class SignUpRobot: BaseRobot() {

    fun enterTextInto(input: SignUpInput, text: String) = apply {
        enterTextIntoEditTextWithHint(input.hintResId(), text)
    }

    fun tapButton(button: SignUpButton) = apply { clickButton(button.titleResId()) }

    fun validateScreenVisible(visible: Boolean) = apply {
        for (input in SignUpInput.values()) {
            viewVisibleWithHint(input.hintResId(), visible)
        }
    }

    fun checkErrorShowing(@StringRes errorResId: Int) = apply {
        viewVisibleWithText(errorResId, true)
    }

    fun checkInputShowingError(input: SignUpInput, errorResId: Int) = apply {
        viewWithHint(input.hintResId()).hasSiblingWithText(errorResId)
    }
}