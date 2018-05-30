package com.designatednerd.stupidenumtricks.robots

import com.designatednerd.stupidenumtricks.activity.LandingButton

class LandingScreenRobot: BaseRobot() {

    fun tapButton(button: LandingButton) = apply {clickButton(button.titleId())  }

    fun validateScreenVisible(visible: Boolean) = apply {
        for (button in LandingButton.values()) {
            viewVisibleWithText(button.titleId(), false)
        }
    }
}