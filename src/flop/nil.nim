import ../flop

proc isNone*[T: ptr | ref | pointer | cstring | proc | iterator](x: Flop[T]): bool {.inline.} =
  result = T(x).isNil

proc none*[T: ptr | ref | pointer | cstring | proc | iterator](_: type Flop[T]): Flop[T] {.inline.} =
  result = Flop[T](T(nil))
