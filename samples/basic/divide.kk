fun divide( x : int, y : int) : int
  if (y == 0) then throw("ゼロ徐算です")
  x / y

fun main()
  println( divide(9, 3) )
  println( divide(10, 3) )
  println( divide(5, 0) )