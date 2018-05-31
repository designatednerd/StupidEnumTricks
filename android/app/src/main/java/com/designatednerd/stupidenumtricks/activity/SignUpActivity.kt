package com.designatednerd.stupidenumtricks.activity

import android.os.Bundle
import android.support.annotation.StringRes
import android.support.v7.app.AppCompatActivity
import android.text.Editable
import com.designatednerd.stupidenumtricks.R
import com.designatednerd.stupidenumtricks.enumclasses.TextHandler
import com.designatednerd.stupidenumtricks.enumclasses.addTextHandler
import com.designatednerd.stupidenumtricks.extensions.setError
import com.designatednerd.stupidenumtricks.sealedclasses.ValidationResult
import com.designatednerd.stupidenumtricks.sealedclasses.Validator
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_sign_up.*

enum class SignUpInput {
    Email,
    Password,
    PasswordConfirm;

    @StringRes
    fun hintResId(): Int {
        return when (this) {
            Email -> R.string.prompt_email
            Password -> R.string.prompt_password
            PasswordConfirm -> R.string.prompt_password_confirm
        }
    }
}

enum class SignUpButton {
    SignUp;

    @StringRes
    fun titleResId(): Int {
        return when (this) {
            SignUp -> R.string.action_sign_up
        }
    }
}

class SignUpActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_up)

        emailInput.editText?.addTextHandler(TextHandler(
                afterTextChangedHandler = { handleEmailChanged(it) }
        ))

        passwordInput.editText?.addTextHandler(TextHandler(
                afterTextChangedHandler = { handlePasswordChanged(it) }
        ))

        passwordConfirmInput.editText?.addTextHandler(TextHandler(
                afterTextChangedHandler = { handlePasswordConfirmChanged(it) }
        ))

        signUpButton.setOnClickListener { tappedSignUp() }
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

    private fun handlePasswordConfirmChanged(confirm: Editable?) {
        val result = Validator.ConfirmPassword(passwordInput.editText?.text, confirm).validate()
        when (result) {
            is ValidationResult.Success -> passwordConfirmInput.error = null
            is ValidationResult.Error -> passwordConfirmInput.setError(result.errorResId)
        }
    }

    private fun tappedSignUp() {
        handleEmailChanged(emailInput.editText?.text)
        handlePasswordChanged(passwordInput.editText?.text)
        handlePasswordConfirmChanged(passwordConfirmInput.editText?.text)

        if (emailInput.error == null
                && passwordInput.error == null
                && passwordConfirmInput.error == null) {
            println("SIGNED UP!")
        }
    }
}
