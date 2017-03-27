# Recursion Problems

## Definitions
Define the following:

- Recursion:
  is a method where the solution depends on calling the same method.

- Recursive Case
  is the case when the method calls itself. So, it's part of the method where the recursion happens.

- Base Case
  is a case for which the answer is known (and can be expressed without recursion). The base case is what stops the recursion from continuing on forever.


- Activation Chain/Stack
  the stack that holds recursive cases as a result of tracing of a recursive method.   


- Activation Record/Call
  The portion of the stack used for an invocation of a function is called the function’s activation record. Basically every time that method gets called.

- Infinite Recursion/Stack Overflow/Stack too deep
  Infinite recursion happens when a recursive function fails to stop recursing. Basically, when we can't hit the base case and get stack too deep error message and ran out of memory.

- Tail Recursion
  is a form of linear recursion. In tail recursion, the recursive call is the last thing the function does. Often, the value of the recursive call is returned.

## Tracing through a recursive method

### Trace #1
- What is mystery1(5)?
  Answer =1+2+3+4+5 = 15

- What is mystery1(10)?
  Answer = 1+2+3+4+5+6+7+8+9+10 = 55

- What is mystery1(0)?
  This is an infinite recursion

### Trace #2
- What is mystery2(123)?
  Answer = 1 + 2 + 3 =6

- What is mystery2(9005)?
  Answer = 9 + 0 +0 + 5 = 14

- What is mystery2(-123)?
  Answer = -123

- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?
  def mystery2(n)
    

### Trace #3
- What is mystery3(1)?
  Answer = 100

- What is mystery3(13)?
  Answer = 100

- What is mystery3(-6)?
  Answer = 200



### Trace #4
- What is mystery4(10,2)?
 Answer = 1*10*10 = 100

- What is mystery4(4,3)?
  Answer = 1*4*4*4 = 64

- What is mystery4(5,0)?
  Answer = 1


### Trace #5
- What is mystery5("hi")?
  mystery5(“hi”) = “*” + mystery5(“i”)
  mystery5("i”) = “*” + mystery5(“”)
  mystery5(“") = “""
  Answer is “**”

- What is mystery5("")?
  Answer is ""

- What is mystery5("Hi, there!")?
mystery5("Hi, there!”) = “*” + mystery5("i, there!”)
mystery5("i, there!”) = “*” + mystery5(", there!”)
mystery5(", there!”) = “*” + mystery5(“ there!”)
mystery5("there!”) = “*” + mystery5("here!”)
mystery5("here!”)  = “*” + mystery5("ere!”)
mystery5("ere!”) = “*” + mystery5("re!”)
mystery5("re!”) = “*” + mystery5("e!”)
mystery5(“e!”) = “*” + mystery5("!”)
mystery5("!”) = “*” + mystery5(“")
mystery5(“") = "'
 Answer is “**********"

- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

  def mystery5_new(s)
  if s.length == 0
    return ""
  else
    c = ("a".."z").include?(s[0].downcase) ? "*" : s[0]
    return c + mystery5_new(s[1..-1])  
  end  
  end

### Trace #6
- What is mystery6("goodnight moon")?
  mystery6("goodnight moon")= mystery6("goodnight") + " " + "goodnight"
  mystery6("moon") = "" + "" + "moon"
  Answer = "moon goodnight"

- What is mystery6("Ada Developers Academy")?
 mystery6("Ada Developers Academy") = mystery6("Developers Academy") + " " + "Ada"
 mystery6("Developers Academy") = mystery6("Academy") + " " + "Developers"
 mystery6("Academy") = "" + "" + "Academy"
 Answer is "Academy Developers Ada"

- What is mystery6("Hi, there!")?
  mystery6("Hi, there!") =   mystery6("there!") + " " + "Hi"
  mystery6("there!") = "" + " " + "there!"
  Answer = "there! Hi,"

- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?

  def mystery6_new(s)
    if s == nil || s.length == 0
      return ""
    else
      return mystery6_new(s[1..-1]) + s[0]
    end
  end
