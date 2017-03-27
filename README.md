# Recursion Problems

## Definitions
Define the following:

- Recursion:
      A method that calls itself. (In general, any self-referential process or definition)
- Recursive Case:
      The case in a recursive method, where the recursion happens (ie where the method itself is called.)
- Base Case:
      The case in a recursive method, where no recursion happens.        
      Generally successive iterations of the recursive case bring you closer to the base case, and the base case is where the method evaluation finally terminates.
- Activation Chain/Stack:
      The entire chain of successive iterations of the recursive case and the eventual base case that are evaluated when the method is invoked.
- Activation Record/Call:
      A single evaluation of the recursive case in the process of evaluating a recursive method (ie one step in the activation chain/stack.)
- Infinite Recursion/Stack Overflow/Stack too deep:
      If the recursive case does not bring the method evaluation closer to the base case on successive iterations, then the recursion will continue 'infinitely'. In practice, it will continue until the allotted memory is full, and a 'stack overflow'/'stack too deep' error will be thrown, terminating the process.
- Tail Recursion:
      Tail Recursion is where calculations are made at every step in the recursive case, and the result is then passed to the next call of the method. It is different from traditional recursion where the full chain of recursive calls must be made before the calculations begin.

      In other words, in Traditional Recursion, the full chain of recursive calls are made and held in the stack. Then, once the base case is reached, calculations begin and the results for each record are passed back up the chain.
      In Tail Recursion, however, calculations are made along the way and only the results are passed to successive recursive cases.
      The benefit of Tail Recursion, in languages that support it, is that the compiler does not need to keep track of the entire activation chain/stack. Instead, at each recursive step, it can simply replace the data and reuse the 'current stack frame'.

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

- What is mystery1(5)?   15
- What is mystery1(10)?  55
- What is mystery1(0)?  Infinite Recursion-                           
                        SystemStackError: stack level too deep

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

- What is mystery2(123)?    6
- What is mystery2(9005)?   14
- What is mystery2(-123)?  -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
We could "ignore the negative sign" while we sum the digits and then replace it at the end. This could be done as follows:

def mystery2B(n)
  if n < 10 && n > -10
    return n
  elsif n >= 10
    return (n%10) + mystery2(n/10)
  else m = n.abs
    a = (m%10) + mystery2(m/10)
    return -a
  end
end


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

- What is mystery5("hi")?  **
- What is mystery5("")? ""  (ie, empty string)
- What is mystery5("Hi, there!")? **********

- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
I only found a Regular Expression way to do this. Is there a more standard way to do this, without 'Ruby magic'?

Using Regex:

def mystery5B(s)
  s.gsub!(/[^a-zA-Z]/, '')
    if s.length == 0
      return ""
    else
      return "*" + mystery5(s[1..-1])
    end
end



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
- What is mystery6("Ada Developers Academy")?
- What is mystery6("Hi, there!")?
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
