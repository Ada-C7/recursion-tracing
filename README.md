# Recursion Problems

## Definitions
Define the following: 

- Recursion
- When the result of a method dependes on the result of the same method but called with a smaller case. You know you have a recrusive method if the method calls its self 
- Recursive Case
- The expression of code where the method is calling its self
- Base Case
- the expression of code where the recursion stops 
- Activation Chain/Stack
- A recurive method has to keep track of each instance the method is being called - the function does this with stack that holds each instantiation. 
- Activation Record/Call
- An activation record is an individual "item" in the activation stack
- Infinite Recursion/Stack Overflow/Stack too deep
- When the recrusive method will never reach the base case - it will go one forever/computer will error cause it doesn't have enough memory to keep track of all the times the method has been called. - IE the Activation Stack is too large for the computers memory
- Tail Recursion
- normally every recurive call has to complete before the method begins to do work to find the result - in tail recursion the end result is being updated with each new instantiation

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
- 15

- What is mystery1(10)? 
- 55
- What is mystery1(0)?
- infinite recursion - will never reach base-case
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
-6
- What is mystery2(9005)?
- 14
- What is mystery2(-123)?
- -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
 - Depends on if we want -123 to be -1 + 2 + 3 or - (1 + 2 + 3). Either case we need to add a condition that checks to see if the integer passed is negative - if true, than decided if we should take the absolute value - run the method and at the end make it negative again

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
- 100
- What is mystery3(13)?
- 100
- What is mystery3(-6)?
- 200

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
- 10^ 2 = 100
- What is mystery4(4,3)?
- 4^3 = 64
- What is mystery4(5,0)?
- 5^0 = 1
- NOTE: I did trace the recursions and at the end noticed the pattern of b^e :)

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
      "**"
- What is mystery5("")?
        ""
      
- What is mystery5("Hi, there!")?
      "**********" (10 - * characters)
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
    Add a condition that checks each value by index. if it's a alpha character, then the values only becomes a *

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

- What is mystery6("goodnight moon")?
- " moon goodnight"
- What is mystery6("Ada Developers Academy")?
- " Academy Developers Ada"
- What is mystery6("Hi, there!")?
- " there! Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
