# Recursion Problems

## Definitions
Define the following:

- Recursion: when a method calls itself.
- Recursive Case: the part of the method where it actually calls itself -- the problem can't be solved immediately, so we've split it into smaller parts.
- Base Case: when the problem can be solved immediately (i.e. we exit the loop of the method calling itself).
- Activation Chain/Stack: the chain of activation records (all the bubbles!).
- Activation Record/Call: when the method calls itself from inside the method (one of the bubbles in our chain!.
- Infinite Recursion/Stack Overflow/Stack too deep: whoops! we never get to the base case, so we loop infinitely.
- Tail Recursion: uh, according to stack overflow, it's a recursive method that updates itself as it goes? so it doesn't need to calculate everything up at the end.

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
- What is mystery1(0)? stack too deep!

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
- What is mystery2(-123)? stack too deep!
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
- What is mystery4(5,0)? 5

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
- What is mystery5("")? ""
- What is mystery5("Hi, there!")? **********
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

- What is mystery6("goodnight moon")? moon goodnight
- What is mystery6("Ada Developers Academy")? Academy Developers Ada
- What is mystery6("Hi, there!")? there, Hi!
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
