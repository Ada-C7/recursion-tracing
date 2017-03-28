# Recursion Problems

## Definitions
Define the following:

- Recursion: A method that calls itself. ("See recursion" - haha)
- Recursive Case: Part of the method where the recursion happens, all the instances we need to loop/de recursion. Need at least one recursive case for it to be a recursion. There can be multiple recursive cases.
- Base Case: Stopping case, when there are no more recursions left to make. Need at least one base case for it to be a recursion. There can be multiple base cases.
- Activation Chain/Stack: All the times the recursion method was called.
- Activation Record/Call: Each instance of the recursion method.
- Infinite Recursion/Stack Overflow/Stack too deep: Method calling another method (could be itself) too many times. Computer has run out of space.
- Tail Recursion: Skipped during lecture. From what I found online, tail recursion is special type of recursion that is faster because it doesn't need to go through the activation chain. The recursive case is the last thing called in the method. Because no further operations are called after the recursive case, it's less the computer needs to keep track of. I believe all of these example exercises are tail recursions because the recursive case is at the end of each method.

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

- What is mystery1(5)? **15**
- What is mystery1(10)? **55***
- What is mystery1(0)? **"Stack Level Too Deep" once the input becomes less than 1 the recursion becomes infinite because the input has nothing to stop the negative numbers from continuing.**

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

- What is mystery2(123)? **6**
- What is mystery2(9005)? **14**
- What is mystery2(-123)? **-123**
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_ I'm not sure I understand the question. We could make negative numbers absolute.

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

- What is mystery3(1)? **100**
- What is mystery3(13)? **100**
- What is mystery3(-6)? **200**
All negative numbers equal 200 and all positive numbers equal 100.

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

- What is mystery4(10,2)? **100**
- What is mystery4(4,3)? **64**
- What is mystery4(5,0)? **1**

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

- What is mystery5("hi")? __**__
- What is mystery5("")? **""**
- What is mystery5("Hi, there!")? __**********__
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_ We could use regex or add an elsif where spaces, numbers, return ""

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

- What is mystery6("goodnight moon")? **" moon goodnight"**
- What is mystery6("Ada Developers Academy")? **" Academy Developers Ada"**
- What is mystery6("Hi, there!")? **" there! Hi,"**
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
