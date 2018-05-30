package com.designatednerd.stupidenumtricks.robots

import android.support.annotation.StringRes
import android.support.test.espresso.Espresso.onView
import android.support.test.espresso.ViewInteraction
import android.support.test.espresso.action.ViewActions.click
import android.support.test.espresso.action.ViewActions.replaceText
import android.support.test.espresso.assertion.ViewAssertions.doesNotExist
import android.support.test.espresso.assertion.ViewAssertions.matches
import android.support.test.espresso.matcher.ViewMatchers.*


open class BaseRobot {

    fun clickButton(@StringRes titleResId: Int): ViewInteraction {
        return onView(withText(titleResId))
                .perform(click())
    }

    fun enterTextIntoEditTextWithHint(@StringRes hintResId: Int, text: String): ViewInteraction {
        return onView(withHint(hintResId)).perform(replaceText(text))
    }

    fun viewVisibleWithText(@StringRes textResId: Int, visible: Boolean): ViewInteraction {
        return if (visible) {
            onView(withText(textResId)).check(matches(isCompletelyDisplayed()))

        } else {
            onView(withText(textResId)).check(doesNotExist())
        }
    }
}
