import ../flop

template defineNilFlop*(constraint: untyped) =
  proc isNone*[T: constraint](x: Flop[T]): bool {.inline.} =
    result = T(x).isNil

  proc none*[T: constraint](_: type Flop[T]): Flop[T] {.inline.} =
    result = Flop[T](T(nil))

template defineAnyNilFlop*() =
  defineNilFlop(ptr | ref | pointer | cstring | proc | iterator)
