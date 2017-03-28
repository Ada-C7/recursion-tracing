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

- What is mystery1(5)?
= 5 + mystery 4 =  15
m(4) = 4 + m(3) = 10
m(3) = 3 + m(2) = 6
m(2) = 2 + m(1) = 3
m(1) = 1
- What is mystery1(10)?
  m(10)  = 10 + mystery 9=  55
m(9) = 9  + m(8) = 45
m(8) = 8 + m(7) = 36
m(7) =7 + m(6) = 28
m(6) = 6 + m(5) = 21
m(5) = 5 + mystery 4 =  15
m(4) = 4 + m(3) = 10
m(3) = 3 + m(2) = 6
m(2) = 2 + m(1) = 3
m(1) = 1
- What is mystery1(0)?
infinite recursion, stack too deep (never reaches end)
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

- What is mystery2(123)?
mystery2(123) = (3) + mystery2(12) = 5
m2(12) = 1 + m2(1) = 2
m2(1) = 1
- What is mystery2(9005)?
mystery2(9005) = 5 + m2(900) = 14
m2(900) = 0 + m2(90) = 9
m2(90) = 0+ m2(9) = 9
m2(9) =9
- What is mystery2(-123)?
mystery2(-123) = -123
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

- What is mystery3(1)?
m3(1) = m3(0) = 100
m3(0) = 100
- What is mystery3(13)?
m3(13) = m3(12) =100
m3(12) = m(6) =100
m(6) = m(3) =100
m(3) = m(2) =100
m(2) = m(1) =100
m(1) = m(0) = 100
m(0) = 100
- What is mystery3(-6)?
m(-6) = m(-3) = 200
m(-3) = m(-4)= 200
m(-4) = m(-2) =200
m(-2) = m(-1) = 200
m(-1) = 200

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

- What is mystery4(10,2)?
m(10,2) = 10 * m(10, 1) =100
m(10,1) = 10 * m(10, 0) = 10
m(10,0) =1
- What is mystery4(4,3)?
m(4,3) = 4 * m(4, 2) = 64
m(4,2) = 4 * m(4,1) = 16
m(4,1) = 4 * m(4,0) = 4
m(4,0) = 1
- What is mystery4(5,0)?
m(5,0) = 1

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

- What is mystery5("hi")?
m(hi) = * + m(h) = "**"
m(h) = * + “”= “*"
m(“”) = “"
- What is mystery5("")?
m(“”) = (“”)
- What is mystery5("Hi, there!")?
m(hi, there!)  “**********"
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

### Trace #6 #Will come back to this one =)
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

- What is mystery6("goodnight moon")?
- What is mystery6("Ada Developers Academy")?
- What is mystery6("Hi, there!")?
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
