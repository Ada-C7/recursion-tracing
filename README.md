# Recursion Problems

## Definitions
Define the following:

- Recursion
Recursion is where a function calls on itself, the solution to the problem may consist of smaller instances of the same function.

- Recursive Case
The recursive case is an instance where a function will call on itself for the result.
- Base Case
The base case is the lowest level case that the recursive case works towards. If the base case is never reached, the recursion will become an infinite recursion.

- Activation Chain/Stack
The Activation Chain or stack is the series of functions that were required to arrive at the result.

- Activation Record/Call
The activation record is the memory that contains all the information to keep track of the functions being run, these consist of parameters, variables, return values, etc.

- Infinite Recursion/Stack Overflow/Stack too deep
This means that the recursion is calling itself infinitely and a solution can't be reached (or that no solution is possible).

- Tail Recursion
I think that tail recursion means that rather than performing all your recursion calls first before returning back to calculate the results, you first perform all your calculations then move to the next recursive step. In this way, some efficiency is gained as you don't need to go through the activation chain all over again to perform the recursion.

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
- What is mystery1(0)? infinite recursion

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

- What is mystery5("hi")? "**"
- What is mystery5 ""
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

- What is mystery6("goodnight moon")? " moon goodnight"
- What is mystery6("Ada Developers Academy")? " Academy Developers Ada"
- What is mystery6("Hi, there!")? " there Hi,"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
