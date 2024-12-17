import ../flop

proc isNone*[T: range](x: Flop[T]): bool {.inline.} =
  when low(T) > 0:
    result = ord(T(x)) == 0
  else:
    result = ord(T(x)) == ord(high(T)) + 1

proc none*[T: range](_: type Flop[T]): Flop[T] {.inline.} =
  when low(T) > 0:
    result = Flop[T](cast[T](0))
  else:
    result = Flop[T](cast[T](ord(high(T)) + 1))
