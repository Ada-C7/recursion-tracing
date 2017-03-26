def mystery1(n)
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end

def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end

def mystery2_new(n)
  if n.abs < 10
    return n
  elsif n > 0
    return (n%10) + mystery2_new(n/10)
  else
    return -(n.abs%10) + mystery2_new((n/10.0).ceil)
  end
end

def mystery3(n)
  if n == 0
    return 100
  elsif n == -1
    return 200
  end
  if n%2 == 0
    return mystery3(n/2)
  else
    return mystery3(n-1)
  end
end

def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end

def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end

def mystery5_new(s)
  if s.length == 0
    return ""
  elsif s[0].match(/[a-z0-9]/)
    return "*" + mystery5_new(s[1..-1])
  else
    return s[0] + mystery5_new(s[1..-1])
  end
end

def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    space = 0
    until space >= s.length || s[space] == " "
      space += 1
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space]
  end
end

def mystery6_new(s)
  if s == nil || s.length == 0
    return ""
  else
    return s[-1] + mystery6_new(s[0...-1])
  end
end
