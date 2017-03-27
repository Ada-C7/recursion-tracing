# Recursion Problems

## Definitions
Define the following:

- Recursion - Recursion occurs when a method calls itself.
- Recursive Case - A recursive case is the part of the method that contains the recursion.
- Base Case - The base case is the part of the method that stops the recursion (and produces an answer I think).
- Activation Chain/Stack - The activation chain are a cascade of steps the recursive method goes through. (They are the 'bubbles' I drew out to get the answers below.)
- Activation Record/Call - The activation record is the memory area in the computer where local data for your current operation is stored.
- Infinite Recursion/Stack Overflow/Stack too deep - This is a recursion that goes on infinitely.
- Tail Recursion - (I know this was not covered, just read about it out of curiosity.) My guess from googling: it is a method that has its recursive component (i.e. the method) in the last line of the block.

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

- What is mystery1(5)? Answer: 15, Reasoning: I am not exactly sure how to describe my answers, but this method is adding n to mystery1(n-1) until n equals 1. Then the method 'goes up' the stack and evaluates the expressions with the integers substituted for mystery1(n-1).
- What is mystery1(10)? Answer: 55, Reasoning: Same as above.
- What is mystery1(0)? Answer: Stack too deep, Reasoning: The method will never hit the base case.

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

- What is mystery2(123)? Answer: 6, Reasoning: This method is adding the modulus of n and the mystery2(n/10) until n is less than 10. If n is less than 10, n will be returned. Then the method 'goes up' the stack and evaluates the expressions with the integers substituted for mystery2(n/10).
- What is mystery2(9005)? Answer: 14, Reasoning: Same as above.
- What is mystery2(-123)? Answer: -123, Reasoning: In this method anything below 10 will be returned as the answer.
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
I

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

- What is mystery3(1)? Answer: 100, Reasoning: Until n equals 0 or -1, n modulus 2 will be evaluated. If the result of n modulus 2 is 0, mystery3(n/2) will be returned. If the result of n modulus 2 is not 0, mystery3(n-1) will be returned. This pattern will continue until n becomes either 0 or -1. In this case, n eventually equals 0 and 100 is returned. (The method DOES NOT 'goes up' the stack.)
- What is mystery3(13)? Answer: 100, Reasoning: Same as above.
- What is mystery3(-6)? Answer: 200, Reasoning: Similar to above except n eventually equals -1 and 200 is returned.

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

- What is mystery4(10,2)? Answer: 100, Unless e equals 0, b will be multiplied by mystery4(b,e-1). Eventually, so long as e is greater than 0, e will become 0 and 1 will be returned. Then the method 'goes up' the stack and evaluates the expressions with the integers substituted for mystery4(b,e-1).
- What is mystery4(4,3)? Answer: 64, Reasoning: Same as above.
- What is mystery4(5,0)? Answer: 1, Reasoning: Since e equals 0, 1 is immediately returned and the method does not 'go up' the stack.

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

- What is mystery5("hi")? Answer: "**", Reasoning: Unless s's length equals 0, an asterisk will be concatenated with mystery5(s[1..-1]). (Is that the way it should be written/explained?) Eventually, s will equal 0 and an empty string will be returned. Then the method 'goes up' the stack and all the mystery5(s[1..-1]) become empty strings, leaving just the asterisks.
- What is mystery5("")? Answer: "", Reasoning: The length of s is 0 so an empty string is immediately returned.
- What is mystery5("Hi, there!")? Answer: "**********" (10 asterisks), Reasoning: Same as the first problem in mystery5.
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
      puts s
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space]
  end
end
```

- What is mystery6("goodnight moon")? Answer: " moon goodnight", This one is confusing. Lets start with the easy part. If s equals nil or s's length is 0, an empty string will be returned. Now the hard part. Until the 'space' variable, which has a starting value of 0, is greater or equal to s's length or s[space] equals " ", the loop will add 1 to the value of space. Eventually, in this case, s[space] will equal " " and mystery6(s[(space+1)..-1]) + " " + s[0...space] will be returned. I had to work though this group of questions a couple of times and then check my answer in pry. (I missed that they would all have a space in front.)
- What is mystery6("Ada Developers Academy")? " Developers Academy Ada", Reasoning: Same as above.
- What is mystery6("Hi, there!")? " there! Hi,", Reasoning: Same as above.
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
