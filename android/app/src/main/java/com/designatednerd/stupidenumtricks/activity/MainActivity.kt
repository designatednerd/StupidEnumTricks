package com.designatednerd.stupidenumtricks.activity

import android.os.Bundle
import android.support.annotation.StringRes
import android.support.v7.app.AppCompatActivity
import com.designatednerd.stupidenumtricks.R
import kotlinx.android.synthetic.main.activity_main.*


enum class LandingButton {
    SignIn,
    SignUp,
    ViewTerms;

    @StringRes
    fun titleId(): Int {
        return when (this) {
            SignIn -> R.string.action_sign_in
            SignUp -> R.string.action_sign_up
            ViewTerms -> R.string.action_view_terms
        }
    }

//    fun onClickListener(activity: Activity): (View) -> Unit {
//        return when (this) {
//            SignIn -> { _ -> activity.startActivity<LoginActivity>() }
//            SignUp -> { _ -> activity.startActivity<SignUpActivity>() }
//            ViewTerms -> { _ -> activity.startActivity<SignUpActivity>() }
//        }
//    }
}

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)

        signInButton.setOnClickListener { startActivity<LoginActivity>() }
        signUpButton.setOnClickListener { startActivity<SignUpActivity>() }
        termsButton.setOnClickListener { startActivity<ViewTermsActivity>() }
    }
}
