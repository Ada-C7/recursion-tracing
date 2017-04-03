# Recursion Problems

## Definitions
Define the following:

- Recursion - Recursion is when a method is called within itself
- Recursive Case - A Recursive case is a specific operation in the method where the recursion is happing.
- Base Case - A base case is the stopping operation of the method that does not use recursion to produce an answer.
- Activation Chain/Stack - The process of finding the output, recording and reassigning the value for each parameter
- Activation Record/Call - For the lack of a better explanation, a bubble.
- Infinite Recursion/Stack Overflow/Stack too -  deep - This is when there is no stopping point and/or no possibility of hitting the base case.
- Tail Recursion -  Tail Recursion is when recursion is called in the last operation of the method.

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

- What is mystery1(5)? _15_
- What is mystery1(10)? _55_
- What is mystery1(0)? _Infinite Recursion / Stack Overflow_

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

- What is mystery2(123)? _6_
- What is mystery2(9005)? _14_
- What is mystery2(-123)? _-123_
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

- What is mystery3(1)? _100_
- What is mystery3(13)? _100_
- What is mystery3(-6)? _200_

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

- What is mystery4(10,2)? _100_
- What is mystery4(4,3)? _64_
- What is mystery4(5,0)? _1_

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

- What is mystery5("hi")? _"**"_
- What is mystery5("")? _""_
- What is mystery5("Hi, there!")? _"*********"_
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

- What is mystery6("goodnight moon")? _" moon goodnight"_
- What is mystery6("Ada Developers Academy")? _" Academy Developers Ada"_
- What is mystery6("Hi, there!")? _" there! Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
