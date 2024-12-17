import ../flop

template baseType(T: typedesc): typedesc =
  when ord(low(T)) < 0:
    int32
  elif sizeof(T) == 8:
    int64
  elif sizeof(T) == 4:
    int32
  elif sizeof(T) == 2:
    uint16
  elif sizeof(T) == 1:
    uint8
  else:
    {.error: "unknown base type of enum " & $T.}

proc isNone*[T: enum](x: Flop[T]): bool {.inline.} =
  when ord(low(T)) > 0:
    result = ord(T(x)) == 0
  else:
    result = ord(T(x)) == ord(high(T)) + 1

proc none*[T: enum](_: type Flop[T]): Flop[T] {.inline.} =
  when ord(low(T)) > 0:
    result = Flop[T](cast[T](0))
  else:
    result = Flop[T](cast[T](baseType(T)(ord(high(T))) + 1))
