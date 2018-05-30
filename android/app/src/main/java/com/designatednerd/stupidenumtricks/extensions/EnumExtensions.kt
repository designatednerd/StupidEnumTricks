package com.designatednerd.stupidenumtricks.extensions

inline fun <reified T: Enum<T>> T.forIndex(index: Int): T {
    return enumValues<T>()[index]
}

inline fun <reified T: Enum<T>> T.forIndexOrNull(index: Int): T? {
    return enumValues<T>().getOrNull(index)
}

inline fun <reified T: Enum<T>> T.next(): T {
    val currentIndex = this.ordinal
    val nextIndex = currentIndex + 1
    val allValues = enumValues<T>()
    return if (nextIndex >= allValues.size) {
        allValues.first()
    } else {
        allValues[nextIndex]
    }
}