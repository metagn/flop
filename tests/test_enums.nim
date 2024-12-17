import flop, flop/enums

type Foo = enum a, b, c

var x = none(Flop[Foo])
doAssert isNone(x)
x = some(a)
doAssert isSome(x)
doAssert get(x) == a
x = some(b)
doAssert isSome(x)
doAssert get(x) == b
x = some(c)
doAssert isSome(x)
doAssert get(x) == c
