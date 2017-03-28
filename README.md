# Recursion Problems

## Definitions
Define the following:

- Recursion
  - Recursion describes a method that calls itself.
- Recursive Case
  - A recursive case is the part of the method where recursion occurs.
- Base Case
  - Base case returns a value without making a recursive call. This is what recursive cases should be bringing us closer to.
- Activation Chain/Stack
  - An Activation chain/stack is the entire process of solving the recursive method and getting the appropriate answer.
- Activation Record/Call
  - An activation record/call is each little "bubble" within the activation chain. I take that to mean that an activation record occurs each time a recursive case occurs within an activation chain.
- Infinite Recursion/Stack Overflow/Stack too deep
  - Infinite recursion occurs when the recursive cases are not leading to a base case.
- Tail Recursion
  - Tail recursion occurs when the last computation within a method is a recursive call. All our recursive methods from the homework are examples of Tail recursion.

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
  - stack level too deep
Meaning: The number and all of the numbers before it added together. Example: mystery1(5) = 5 + 4 + 3 + 2 + 1 = 15

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
  - 6
- What is mystery2(9005)?
  - 14
- What is mystery2(-123)?
  - -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
  - Set the following condition: if n==0, return n
Meaning: All of the separate digits of the number added together. Example: mystery2(123) = 1 + 2 + 3 = 6

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
  - stack level too deep (checked my answer and found out I had it wrong. Worked on it until I got the correct answer: 200)

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
  - 100
- What is mystery4(4,3)?
  - 64
- What is mystery4(5,0)?
  - 1
Meaning: b^e Example: mystery4(10,2) = 10^2 = 100

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
  - "**"
- What is mystery5("")?
  - ""
- What is mystery5("Hi, there!")?
  - "**********"
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
  - Use regex to check the char type.
Meaning: All chars in string replaced with *

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
  - I am not sure. :(
Meaning: All words in the string are reversed in order and a space is added in the front
