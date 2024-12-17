type
  Flop*[T] = distinct T
  FlopError* = object of CatchableError
  Floppable* = concept
    proc isNone(x: Flop[Self]): bool
    proc none(_: type Flop[Self]): Flop[Self]

proc isNone*[T](x: Flop[T]): bool =
  {.error: "unimplemented isNone operation".}
template isSome*[T](x: Flop[T]): bool =
  mixin isNone
  not isNone(x)

proc none*[T](_: type T): Flop[T] =
  {.error: "unimplemented none operation".}

proc none*[T](): Flop[T] {.inline.} =
  mixin none
  none(Flop[T])

proc flop*[T](x: T): Flop[T] {.inline.} =
  result = Flop[T](x)

proc some*[T](x: T): Flop[T] {.inline.} =
  mixin isNone
  result = Flop[T](x)
  if isNone(result):
    raise newException(FlopError, "value given to `some` was none value")

proc get*[T](x: Flop[T]): T {.inline.} =
  result = T(x)

proc tryGet*[T](x: Flop[T]): T {.inline.} =
  mixin isNone
  if isNone(x):
    raise newException(FlopError, "could not unwrap none value")
  result = T(x)
