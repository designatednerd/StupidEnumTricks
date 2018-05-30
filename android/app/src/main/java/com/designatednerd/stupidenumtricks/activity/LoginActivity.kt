package com.designatednerd.stupidenumtricks.activity

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.text.Editable
import com.designatednerd.stupidenumtricks.R
import com.designatednerd.stupidenumtricks.enumclasses.TextHandler
import com.designatednerd.stupidenumtricks.sealedclasses.ValidationResult
import com.designatednerd.stupidenumtricks.sealedclasses.Validator
import com.designatednerd.stupidenumtricks.enumclasses.addTextHandler
import com.designatednerd.stupidenumtricks.extensions.setError
import kotlinx.android.synthetic.main.activity_login.*

class LoginActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        emailInput.editText?.addTextHandler (TextHandler(
                afterTextChangedHandler = { handleEmailChanged(it) }
        ))

        passwordInput.editText?.addTextHandler(TextHandler(
                afterTextChangedHandler = { handlePasswordChanged(it) }
        ))

        signInButton.setOnClickListener { tappedSignIn() }
    }

    private fun handleEmailChanged(email: Editable?) {
        val result = Validator.Email(email).validate()
        when (result) {
            is ValidationResult.Success -> emailInput.error = null
            is ValidationResult.Error -> emailInput.setError(result.errorResId)
        }
    }

    private fun handlePasswordChanged(password: Editable?) {
        val result = Validator.Password(password).validate()
        when (result) {
            is ValidationResult.Success -> passwordInput.error = null
            is ValidationResult.Error -> passwordInput.setError(result.errorResId)
        }
    }

    private fun tappedSignIn() {
        handleEmailChanged(emailInput.editText?.text)
        handlePasswordChanged(passwordInput.editText?.text)

        if (emailInput.error == null
            && passwordInput.error == null) {
            println("SIGNED IN!")
        }
    }
}