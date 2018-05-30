package com.designatednerd.stupidenumtricks.enumclasses

import android.support.annotation.IntegerRes
import com.designatednerd.stupidenumtricks.R


enum class Color {
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet;

    companion object {
        @IntegerRes fun resIdForName(name: String): Int? {
            return when (name) {
                Red.name -> R.color.red
                Orange.name -> R.color.orange
                Yellow.name -> R.color.yellow
                Green.name -> R.color.green
                Blue.name -> R.color.blue
                Violet.name -> R.color.violet
                else -> null
            }
        }
    }
}
