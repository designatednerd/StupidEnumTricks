package com.designatednerd.stupidenumtricks.activity


import android.support.test.rule.ActivityTestRule
import android.support.test.runner.AndroidJUnit4
import com.designatednerd.stupidenumtricks.robots.LandingScreenRobot
import com.designatednerd.stupidenumtricks.robots.SignInRobot
import com.designatednerd.stupidenumtricks.robots.SignUpRobot
import com.designatednerd.stupidenumtricks.robots.TermsRobot
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class LandingActivityTest internal constructor() {

    private val landingRobot: LandingScreenRobot by lazy { LandingScreenRobot() }

    @Rule
    var mActivityTestRule = ActivityTestRule(MainActivity::class.java)

    @Test
    fun tappingSignInGoesToSignInScreen() {
        landingRobot
                .tapButton(LandingButton.SignIn)
                .validateScreenVisible(false)

        SignInRobot().validateScreenVisible(true)
    }

    @Test
    fun tappingSignUpGoesToSignUpScreen() {
        landingRobot
                .tapButton(LandingButton.SignUp)
                .validateScreenVisible(false)

        SignUpRobot().validateScreenVisible(true)
    }

    @Test
    fun tappingTermsGoesToTermsScreen() {
        landingRobot
                .tapButton(LandingButton.ViewTerms)
                .validateScreenVisible(false)

        TermsRobot().validateScreenVisible(true)
    }
}
