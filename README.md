# Recursion Problems

## Definitions
Define the following:

- Recursion: A function that calls itself repeatedly until reaching a base case.
- Recursive Case: When the recursive case is met, the function will call itself.
- Base Case: When the base case is met, the function will not call itself. This ends the recursive loop.
- Activation Chain/Stack: The stack that holds each iteration of the recursive function.
- Activation Record/Call: An individual call of the recursive function.
- Infinite Recursion/Stack Overflow/Stack too deep: The function will never reach the base case, which causes an infinite loop.
- Tail Recursion: A recursive function where the recursive call is the last thing to be called.

## Tracing through a recursive method

### Trace #1
```
def mystery1(n)
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end
```

- What is mystery1(5)? 15
- What is mystery1(10)? 55
- What is mystery1(0)? Stack Overflow

### Trace #2
```
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end
```

- What is mystery2(123)? 6
- What is mystery2(9005)? 14
- What is mystery2(-123)? -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
  + This probably isn't the most efficient way, but here's what I got to work (returns -6 for mystery2(-123) and 6 for mystery2(123)):
  ```ruby
    def mystery2(n)
      multiplier = n >= 0 ? 1 : -1
      if n.abs < 10
        return n
      else
        return (n.abs % 10) * multiplier + mystery7((n.abs/10) * multiplier)
      end
    end
  ```

### Trace #3
```
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
```

- What is mystery3(1)? 100
- What is mystery3(13)? 100
- What is mystery3(-6)? 200

### Trace #4
```
def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end
```

- What is mystery4(10,2)? 100
- What is mystery4(4,3)? 64
- What is mystery4(5,0)? 1

### Trace #5
```
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end
```

- What is mystery5("hi")? "**"
- What is mystery5("")? ""
- What is mystery5("Hi, there!")? "**********"
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
  ```ruby
  def mystery5(s)
    if s.length == 0
      return ""
    elsif s[0].match(/[a-zA-Z]/)
      return "*" + mystery5(s[1..-1])
    else
      return mystery5(s[1..-1])
    end
  end
  ```

### Trace #6
```
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
```

- What is mystery6("goodnight moon")? " moon goodnight"
- What is mystery6("Ada Developers Academy")? " Academy Developers Ada"
- What is mystery6("Hi, there!")? " there! Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
```
def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    return s[-1] + mystery6(s[0..-2])
  end
end
```
