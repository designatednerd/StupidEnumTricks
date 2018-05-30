package com.designatednerd.stupidenumtricks.activity

import android.app.Activity
import android.content.Intent


inline fun <reified T: Activity> Activity.startActivity() {
    val intent = Intent(this, T::class.java)
    startActivity(intent)
}