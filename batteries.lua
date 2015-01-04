map = function(fnc, arg)
    local tmp = {}
    for _,v in ipairs(arg) do
        tmp[_] = fnc(v)
    end
    return tmp
end

filter = function(fnc, arg)
    local tmp = {}
    for k,v in pairs(arg) do
        if fnc(v) then
            tmp[#tmp+1] = v
        end
    end
    return tmp
end

all = function(arg)
    for _, v in ipairs(arg) do
        if not v then
            return false
        end
    end
    return true
end

any = function(arg)
    for _, v in ipairs(arg) do
        if v then
            return true
        end
    end
    return false
end

len = function(arg)
  return #arg
end

reduce = function(fnc, arg)
  local index = 1
  local size = #arg
  local acum = arg[index]

  while index < size do
    acum = fnc(acum, arg[index+1])
    index = index + 1
  end
  return acum
end

range = function(arg)
  local cc = 1
  local tmp = {}
  while not (cc > arg) do
    tmp[cc] = cc
    cc = cc+1
  end
  return tmp
end

slice = function(arg, start, stop)
  local tmp = {}
  for i=start,stop do
    tmp[#tmp+1] = arg[i]
  end
  return tmp
end

sum = function(arg)
  local acum = 0
  for _, v in ipairs(arg) do
    acum = acum + v
  end
  return acum
end

cmp = function(a, b)
  if type(a) ~= type(b) then
    return false
  end

  if type(a) == "table" then
    local r = true
    for k,v in pairs(a) do
      if b[k] ~= v then
        r = false
      end
    end
    for k,v in pairs(b) do
      if a[k] ~= v then
        r = false
      end
    end
    return r
  end

  return a == b
end