# Recursion Problems

## Definitions
Define the following:

- Recursion: The act when a method calls itself, or two methods call each other.
- Recursive Case: The case within the method that calls itself again.
- Base Case: The non-recursive case the method hits to get out of the recursion loop.
- Activation Chain/Stack: The chain of the recursive method getting called over and over and what it returns.
- Activation Record/Call: Each time the recursive method gets called within the chain.
- Infinite Recursion/Stack Overflow/Stack too deep: When the recursion runs over and over and never hits a base case.
- Tail Recursion: we did not cover.

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
- What is mystery1(0)? Stack too deep!

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
- It looks like this method is created in order to add all the digits together of each number.  Meaning a number entered 123 should result in 6.  To account for negative numbers, we could create an earlier if statement:

if n < 0 && n >= -10
  return n
else
  return (n%10) - mystery2(n/10)
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

The point of this method seems to be to return 100 if a number is positive and 200 if negative.

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

This recursive method is returning the number b multiplied by itself e times.

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

 What is mystery5("hi")? "**" **
- What is mystery5("")? ""
- What is mystery5("Hi, there!")? = "**********"
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
This method is creating a string of stars * that replace every character in the string.

You could add a statement: if s[0].include?(a..z) or [a-zA-Z] before running the return statement to make sure the space has a letter.  Otherwise you could have it return a space " " + mystery5(s[1..-1]).  Although this is using ruby magic and I'm not sure how to do it without.  I'd love to know!

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
- What is mystery6("Hi, there!")? " there Hi"

This method reverses the order of words.

- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

At first this seemed impossible but I realized it was actually simpler than the first recursive method!  Cool!  You could rewrite the method this way, and it will reverse the string by letter instead of by word:
```
def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    return mystery6(s[1..-1]) + s[0]
  end
end
```
