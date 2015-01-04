require "luaunit"
require "batteries"

function test_map()
  local inp = {1,2,3,4,5}
  local out = {5,10,15,20,25}
  local fnc = function(i) return i*5 end
  assertTrue(cmp(map(fnc, inp), out))
end

function test_filter()
  local inp = {1,2,3,4,5 }
  local out = {2,4}
  local fnc = function(i)
    return i % 2 == 0
  end
  assertTrue(cmp(filter(fnc, inp), out))
end

function test_all()
  assertTrue(all({}))
  assertTrue(all({true}))
  assertTrue(all({"casa", 5, function() end}))

  assertFalse(all({false}))
  assertFalse(all({true, true, false}))
  assertFalse(all({false, "casa", 5, function() end}))
end

function test_any()
  assertTrue(any({true}))
  assertTrue(any({true, true, false}))
  assertTrue(any({"casa", 5, function() end}))
  assertTrue(any({false, "casa", 5, function() end}))

  assertFalse(any({}))
  assertFalse(any({false}))
  assertFalse(any({false, false, false}))
end

function test_len()
  local inp = {1,2,3,4,5}
  assertEquals(len(inp), #inp)
end

function test_reduce()
  local inp = {1,2,3,4,5 }
  local fnc = function(a, b) return a+b end
  assertEquals(reduce(fnc, inp), 15)
end

function test_range()
  local inp = {1,2,3,4,5 }
  assertTrue(cmp(range(5), inp))
end

function test_slice()
  local inp = {1,2,3,4,5 }
  local out = {3,5 }
  assertEquals(slice(inp, 3, 5), {3,4,5})
end

function test_sum()
  local inp = {1,2,3 }
  assertEquals(sum(inp), 6)
end

function test_cmp()
  assertTrue(cmp(1, 1))
  assertFalse(cmp(1, 2))

  assertTrue(cmp({1,2,3}, {1,2,3}))
  assertFalse(cmp({2,3}, {1,2,3}))
end

os.exit(LuaUnit:run())