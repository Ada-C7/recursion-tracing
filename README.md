# Recursion Problems

## Definitions
Define the following:

- Recursion
- Recursive Case
- Base Case
- Activation Chain/Stack
- Activation Record/Call
- Infinite Recursion/Stack Overflow/Stack too deep
- Tail Recursion

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
m(5) = 5 + m(4) 5 +10 = 15
m(4) – 4 + m(3) 4 + 6 = 10
m(3) = 3 +m(2) 3 +3 = 6
m(2) = 2 + m(1) 2 + 1 = 3
m(1) = 1

= 15

- What is mystery1(10)? 55
m(10) 10 + m(9)  10 + 45 = 55
m(9) 9 + m(8) 9 + 36 = 45
m(8) 8 + m(7) 8 + 28 = 36
m(7) 7 + m(6) 7 + 21 = 28
m(6) 6 + m(5) 6 + 15 = 21
m(5) 5 + m(4) 5 + 10 = 15
m(4) 4 + m(3) 4 + 6 = 10
m(3) 3 + m(2) 3 + 3 = 6
m(2) 2 + m(1) = 2 + 1 = 3
m(1) = 1

- What is mystery1(0)? Infinite

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
m2(123) = 3 + m2(123/10) 3 + 3 = 6
m2(12) = 2 + m2(12/10) 2 + 1 = 3
m2(1) = 1

- What is mystery2(9005)? 14
m2(9005) = 5 + m2(9005/10) 5 + 9 = 14
m2(900) = 0 + m2(900/10) 9
m2(90) = 0 + m2(90/10)  9
m2(9) = 9

- What is mystery2(-123)? -123

- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_

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
m3(1)
m3(0) = 100
- What is mystery3(13)? 100
- What is mystery3(-6)? 200
m(13)
m(12)
m(11)
m(10)
m(9)
m(8)
m(7)
m(6)
m(5)
m(4)
m(3)
m(2) =
m(1) = 100
m(0) = 100
m (-6) = 200


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

- What is mystery6("goodnight moon")? "moon goodnight"
- What is mystery6("Ada Developers Academy")? "Ada Developers Academy"
- What is mystery6("Hi, there!")? "there, Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
