# Recursion Problems

## Definitions
Define the following: 

- Recursion: a function that calls itself (see recursion)
- Recursive Case: The function that is called within itself, should bring you closer to the base case.
- Base Case: the base case is what stops the recursion from infinite recursion
- Activation Chain/Stack - This still isn't clear to me
- Activation Record/Call - This still isn't clear to me
- Infinite Recursion/Stack Overflow/Stack too deep: Recursion that would go on forever
- Tail Recursion: With each evaluation of the recursive call, the running total is updated. 

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
- What is mystery1(0)? Infinite recursion

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

- What is mystery5("hi")? **
- What is mystery5("")? 
- What is mystery5("Hi, there!")? ********
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
- What is mystery6("Ada Developers Academy")? "Academy Ada Developers"
- What is mystery6("Hi, there!")? "there! Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
