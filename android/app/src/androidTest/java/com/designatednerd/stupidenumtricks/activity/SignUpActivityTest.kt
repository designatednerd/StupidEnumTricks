package com.designatednerd.stupidenumtricks.activity

import android.support.test.rule.ActivityTestRule
import android.support.test.runner.AndroidJUnit4
import com.designatednerd.stupidenumtricks.R
import com.designatednerd.stupidenumtricks.robots.AdorableCatRobot
import com.designatednerd.stupidenumtricks.robots.SignUpRobot
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith


@RunWith(AndroidJUnit4::class)
class SignUpActivityTest {

    private val signUpRobot: SignUpRobot by lazy { SignUpRobot() }

    @Rule
    var mActivityTestRule = ActivityTestRule(SignUpActivity::class.java)

    @Test
    fun invalidInputShowsErrors() {
        signUpRobot
                .enterTextInto(SignUpInput.Email, "notanemail")
                .enterTextInto(SignUpInput.Password, "short")
                .enterTextInto(SignUpInput.PasswordConfirm, "nopenotit")
                .tapButton(SignUpButton.SignUp)
                .checkInputShowingError(SignUpInput.Email, R.string.error_invalid_email)
                .checkInputShowingError(SignUpInput.Password, R.string.error_invalid_password)
                .checkInputShowingError(SignUpInput.PasswordConfirm, R.string.error_passwords_dont_match)
    }

    @Test
    fun noInputShowsErrors() {
        signUpRobot
                .tapButton(SignUpButton.SignUp)
                .checkInputShowingError(SignUpInput.Email, R.string.error_field_required)
    }

    @Test
    fun testValidInputKicksToCats() {
        signUpRobot
                .enterTextInto(SignUpInput.Email, "totes@legit.biz")
                .enterTextInto(SignUpInput.Password, "password")
                .enterTextInto(SignUpInput.PasswordConfirm, "password")
                .tapButton(SignUpButton.SignUp)

        AdorableCatRobot().validateScreenVisible(true)
    }
}

