inline fun <reified T: Enum<T>> T.next(): T {
  val allValues = enumValues<T>()
  val currentIndex = allValues.indexOf(this)
  val nextIndex = currentIndex + 1
  return if (nextIndex >= allValues.size) {
    allValues[0]
  } else {
    allValues[nextIndex]
  }
}

enum class KeyboardType {
  QWERTY,
  ABCDEF,
  QWERTZ,
  AZERTY,
  Dvorak;

  fun keys(): List<List<String>> {
    return when (this) {
      QWERTY -> listOf(
          listOf("Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"),
          listOf("A", "S", "D", "F", "G", "H", "J", "K", "L"),
          listOf("Z", "X", "C", "V", "B", "N", "M")
      )
      ABCDEF -> listOf(
          listOf("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),
          listOf("K", "L", "M", "N", "O", "P", "Q", "R", "S"),
          listOf("T", "U", "V", "W", "X", "Y", "Z")
      )
      QWERTZ -> listOf(
          listOf("Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P"),
          listOf("A", "S", "D", "F", "G", "H", "J", "K", "L"),
          listOf("Y", "X", "C", "V", "B", "N", "M")
      )
      AZERTY -> listOf(
          listOf("A", "Z", "E", "R", "T", "Y", "U", "I", "O", "P"),
          listOf("Q", "S", "D", "F", "G", "H", "J", "K", "L", "M"),
          listOf("W", "X", "C", "V", "B", "N")
      )
      Dvorak -> listOf(
          listOf("P", "Y", "F", "G", "C", "R", "L"),
          listOf("A", "O", "E", "U", "I", "D", "H", "T", "N", "S"),
          listOf("Q", "J", "K", "X", "B", "M", "W", "V", "Z")
      )
    }
  }
}

fun main(args: Array<String>) {

  for (keyboard in KeyboardType.values()) {
    println("${keyboard.name} is at index ${keyboard.ordinal}")
  }

  val first = KeyboardType.AZERTY

  val next = first.next()
  println("After ${first.name} is ${next.name}")
}