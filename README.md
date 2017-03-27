# Recursion Problems

## Definitions
Define the following:

- Recursion: a method that calls itself in the method
- Recursive Case: where in the method it's called, which will bring us closer to the base case
- Base Case: the stopping case to end recursion. The input is produced without recurring
- Activation Chain/Stack: All of the calls to the recursive method
- Activation Record/Call: Every time the recursive method is run
- Infinite Recursion/Stack Overflow/Stack too deep: The recursion never stops; base case is never reached
- Tail Recursion

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
  m1(5) = 5 + m1(4)
  m1(4) = 4 + m1(3)
  m1(3) = 3 + m1(2)
  m1(2) = 2 + m1(1)
  m1(1) = 1
  1 => 3 (2+1) => 6 (3+3) => 10 (4 + 6) => 15 (5+10)
- What is mystery1(10)? 55
  m1(10) = 10 + m1(9)
  m1(9) = 9 + m1(8)
  m1(8) = 8 + m1(7)
  m1(7) = 7 + m1(6)
  m1(6) = 6 + m1(5)
  m1(5) = 5 + m1(4)
  m1(4) = 4 + m1(3)
  m1(3) = 3 + m1(2)
  m1(2) = 2 + m1(1)
  m1(1) = 1
  1 => 3 (2+1) => 6 (3+3) => 10 (4 + 6) => 15 (5+10) => 21 (6+15) => 28 (7+21) => 36 (8+28) => 45 (9+36) => 55 (10+45)
- What is mystery1(0)? Stack too deep

  Sum of all numbers up to and including n
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
  m2(123) = 3 + m2(12)
  m2(12) = 2 + m2(1)
  m2(1) = 1
  1 => 3 (2+1) => 6 (3+3)
- What is mystery2(9005)? 14
  m2(9005) = 5 + m2(900)
  m2(900) = 0 + m2(90)
  m2(90) = 0 + m2(9)
  m2(9) = 9
  9 => 9 (0+9) => 9 (0+9) => 14 (5+9)
- What is mystery2(-123)?
  m2(-123) = -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
  Maybe we can specify the absolute value of n?

  Sum of the digits in n

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
  m3(1) = m3(0)
  m3(0) = 100
  100 => 100
- What is mystery3(13)? 100
  m3(13) = m3(12)
  m3(12) = m3(6)
  m3(6) = m3(3)
  m3(3) = m3(2)
  m3(2) = m3(1)
  m3(1) = m3(0)
  m3(0) = 100
  100 => 100 => 100 => 100 => 100 => 100 => 100 => 100
- What is mystery3(-6)? 200
  m3(-6) = m3(-3)
  m3(-3) = m3(-4)
  m3(-4) = m3(-2)
  m3(-2) = m3(-1)
  m3(-1) = 200
  200 => 200 => 200 => 200 => 200 => 200

  returns 100 if n is positive, 200 if n is negative
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
  m4(10,2) = 10 * m4(10,1)
  m4(10,1) = 10 * m4(10,0)
  m4(0) = 1
  1 => 10 (10*1) => 100 (10*10)
- What is mystery4(4,3)? 64
  m4(4,3) = 4 * m4(4,2)
  m4(4,2) = 4 * m4(4,1)
  m4(4,1) = 4 * m4(4,0)
  m4(4,0) = 1
  1 => 4 (4*1) => 16 (4*4) => 64 (4*16)
- What is mystery4(5,0)?
  m4(5,0) = 1

  b to the power of e

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
  m5("hi") = "*" + m5("i")
  m5("i") = "*" m5("")
  m5("") = ""
  "" => "*" ("*" + "") => "**" ("*" + "*")
- What is mystery5("")? ""
  m5("") = ""
- What is mystery5("Hi, there!")? "**********"
  m5("Hi, there!") = "*" + m5("i, there!")
  m5("i, there!") = "*" + m5(", there!")
  m5(", there!") = "*" + m5(" there!")
  m5(" there!") = "*" + m5("there!")
  m5("there!") = "*" + m5("here!")
  m5("here!") = "*" + m5("ere!")
  m5("ere!") = "*" + m5("re!")
  m5("re!") = "*" + m5("e!")
  m5("e!") = "*" + m5("!")
  m5("!") = "*" + m5("")
  m5("") = ""
  "" => "*" ("*" + "") => "**" ("*" + "*") => "***" ("*" + "**") => "****" ("*" + "***"), etc.
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

  Replace characters with * (AKA censoring word)
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
  m6("goodnight moon") = m6("moon") + " " + "goodnight"
  iteration table: iteration | space
                      1           1
                      2           2
                      3           3
                      4           4
                      5           5
                      6           6
                      7           7
                      8           8
                      9           9
  m6("moon") = "" + " " + "moon"
  iteration table: iteration | space
                      1           1
                      2           2
                      3           3
                      4           4
- What is mystery6("Ada Developers Academy")? " Academy Developers Ada"
  m6("Ada Developers Academy") = m6("Developers Academy") + " " + "Ada"
  iteration table: iteration | space
                      1           1
                      2           2
                      3           3
  m6("Developers Academy") = m6("Academy") + " " + "Developers"
  iteration table: iteration | space
                      1           1
                      2           2
                      3           3
                      4           4
                      5           5
                      6           6
                      7           7
                      8           8
                      9           9
                      10          10
  m6("Academy") = m6("") + " " + "Academy"
- What is mystery6("Hi, there!")? " there! Hi,"
  m6("Hi, there!") = m6("there!") + " " + "Hi,"
  m6("there!") = m6("") + " " + "there!"
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
