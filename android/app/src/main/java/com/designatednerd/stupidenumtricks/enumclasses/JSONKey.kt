package com.designatednerd.stupidenumtricks.enumclasses

import android.annotation.SuppressLint


//TODO: Figure out what the actual lint is for this
@SuppressLint("Enum entry naming conventions")
enum class JSONKey {
    user_name,
    email_address,
    latitude,
    longitude;
}