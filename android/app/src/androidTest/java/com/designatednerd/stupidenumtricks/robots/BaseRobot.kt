package com.designatednerd.stupidenumtricks.robots

import android.support.annotation.StringRes
import android.support.test.espresso.Espresso.onView
import android.support.test.espresso.ViewInteraction
import android.support.test.espresso.action.ViewActions
import android.support.test.espresso.assertion.ViewAssertions.doesNotExist
import android.support.test.espresso.assertion.ViewAssertions.matches
import android.support.test.espresso.matcher.ViewMatchers.*


open class BaseRobot {

    fun viewWithHint(@StringRes hintResId: Int): ViewInteraction {
        return onView(withHint(hintResId))
    }

    fun viewWithText(@StringRes textResId: Int): ViewInteraction {
        return onView(withText(textResId))
    }

    fun clickButton(@StringRes titleResId: Int): ViewInteraction {
        return viewWithText(titleResId).click()
    }

    fun enterTextIntoEditTextWithHint(@StringRes hintResId: Int, text: String): ViewInteraction {
        return viewWithHint(hintResId).replaceText(text)
    }

    fun viewVisibleWithText(@StringRes textResId: Int, visible: Boolean): ViewInteraction {
        return viewWithText(textResId).checkVisible(visible)
    }

    fun viewVisibleWithHint(@StringRes hintResId: Int, visible: Boolean): ViewInteraction {
        return viewWithHint(hintResId).checkVisible(visible)
    }
}

fun ViewInteraction.click() = perform(ViewActions.click())

fun ViewInteraction.replaceText(text: String) = perform(ViewActions.replaceText(text))

fun ViewInteraction.checkVisible(visible: Boolean): ViewInteraction {
    return if (visible) {
        check(matches(isCompletelyDisplayed()))
    } else {
        check(doesNotExist())
    }
}

fun ViewInteraction.hasSiblingWithText(@StringRes textResId: Int) = check(matches(hasSibling(withText(textResId))))