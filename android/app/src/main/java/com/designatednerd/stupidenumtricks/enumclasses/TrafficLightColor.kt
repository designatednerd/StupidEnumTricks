package com.designatednerd.stupidenumtricks.enumclasses


enum class TrafficLightColor {
    Red,
    Yellow,
    Green;
}

class TrafficLight {
    var currentColor = TrafficLightColor.Red

    fun printInstructions() {
        when (currentColor) {
            TrafficLightColor.Red ->  println("STOP RIGHT THERE")
            TrafficLightColor.Yellow,
            TrafficLightColor.Green -> println("Go, go, go!")
        }
    }
}