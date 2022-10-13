import std/num/float64

fun encode( s : string, shift : int = 3)
  fun encode-char(c)
    if c < 'a' || c > 'z' return c
    val base = (c - 'a').int
    val rot = (base + shift) % 26
    (rot.char + 'a')
  s.map(encode-char)

fun caesar(s : string ) : string
  s.encode(3)

val english = [8.2,1.5,2.8,4.3,12.7,2.2,
               2.0,6.1,7.0,0.2,0.8,4.0,2.4,
               6.7,7.5,1.9,0.1, 6.0,6.3,9.1,
               2.8,1.0,2.4,0.2,2.0,0.1]

fun percent( n : int, m : int)
  100.0 * (n.float64 / m.float64)

fun rotate( xs: list<a>, n : int) : list<a>
  xs.drop(n) ++ xs.take(n)

fun freqs( s : string) : list<float64>
  val lowers = list('a', 'z')
  val occurs = lowers.map(fn(c) s.count(c.string))
  val total = occurs.sum
  occurs.map(fn(i) percent(i, total))

fun chisqr( xs : list<float64>, ys : list<float64> ) : float64
  zipwith(xs, ys, fn(x, y) ((x - y)^2.0)/y ).sum

fun uncaesar( s : string) : string
  val table = freqs(s)
  val chitab = list(0,25).map fn(n)
                chisqr( table.rotate(n), english )
  val min = chitab.minimum
  val shift = chitab.index-of(fn(f) f == min).negate
  s.encode( shift )

fun test-uncaesar()
  println( uncaesar( "nrnd lv d ixq odqjxdjh" ) )

pub fun main()
  val s = "Koka is a well-typed language"
  println( "plain : " ++ s)
  println( "encoded :" ++ s.caesar)
  println("cracked :" ++ s.caesar.uncaesar)