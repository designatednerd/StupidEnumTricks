package com.designatednerd.stupidenumtricks.enumclasses

import android.text.Editable
import android.text.TextWatcher
import android.widget.TextView

class TextHandler(
        private val afterTextChangedHandler: ((s: Editable?) -> Unit)? = null,
        private val beforeTextChangedHandler: ((s: CharSequence?, start: Int, count: Int, after: Int) -> Unit)? = null,
        private val onTextChangedHandler: ((s: CharSequence?, start: Int, before: Int, count: Int) -> Unit)? = null
): TextWatcher {


    override fun afterTextChanged(s: Editable?) {
        afterTextChangedHandler?.invoke(s)
    }

    override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
        beforeTextChangedHandler?.invoke(s, start, count, after)
    }

    override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
        onTextChangedHandler?.invoke(s, start, before, count)
    }
}

fun TextView.addTextHandler(handler: TextHandler) {
    this.addTextChangedListener(handler)
}