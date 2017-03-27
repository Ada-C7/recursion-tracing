# Recursion Problems

## Definitions
Define the following:

- Recursion
- Recursive Case
- Base Case
- Activation Chain/Stack
- Activation Record/Call
- Infinite Recursion/Stack Overflow/Stack too deep
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

- What is mystery1(5)?
m1(5) = 5 + m1(4)
4     + m(3)
3       +m(2)
2   + m(1)
1

5 + 4 + 3 + 2  + 1 = 15

- What is mystery1(10)?

m(10) = 10 + m1(9)
9     +  m1(8)
8  + m1(7)
7   +  m1(6)
6    + m5
5   + m1(4)
4     + m(3)
3       +m(2)
2   + m(1)
1
= 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 = 55

- What is mystery1(0)?
m1(0)  0 + m1(-1) + m1(-2) .... infinite recursion
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
m2(123) = 3 + m2(12)
2     + m1(1)
1
= 3 + 2 + 1 = 6

- What is mystery2(9005)?
m2(9005) = 5 + m2(900)
= 5 +  0     + m2(90)
= 5 +  0  +      0     + m2(9)
= 5 + 0 + 0 + 9
= 14                            

- What is mystery2(-123)?

m(-123) = -123


- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_

def mystery2(n)
  if n.abs < 10
    return n
  else
    return (n%10) * n / n.abs + mystery2(n/10)
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

- What is mystery3(1)?
m3(1) = m(0)
= 100

- What is mystery3(13)?
m3(13) = m3(12)
= m3(6)
= m3(3)
= m3(2)
= m3(1)
= m3(0)
= 100

- What is mystery3(-6)?
m3(-6) = m(-3)
= m(-4)
= m(-2)
= m(-1)
= 200

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
m4(10,2) = 10 * m4(10, 1)
= 10 * 10 * m4(1)
= 10 * 10 * 1
= 100

- What is mystery4(4,3)?
m4(4,3) = 4 * m4(2)
= 4 * 4 * m4(1)
= 4 * 4 * 4 * m4(0)
= 4 * 4 * 4 * 1
= 64

- What is mystery4(5,0)?
m(5, 0) = 1

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
m5("hi") = '*' '+ m5("i")
= '*' + '*' + m5("")
= '**'

- What is mystery5("")?
= ""

- What is mystery5("Hi, there!")?

m5("Hi, there") = '*********'  I did this by figuring out the pattern

- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
def mystery5(s)
  if s.length == 0 || s == nil
      return ""
  elsif ("a".."z").include? s[0]
      return "*" + mystery5(s[1..-1])
  else
      return s[0] + mystery5(s[1..-1])
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
puts space
puts s
return mystery6(s[(space+1)..-1]) + " " + s[0...space]
end
end
```

- What is mystery6("goodnight moon")?
m6('goodnight moon')    
= m6(s[9..-1] + " " + s[0..7])
= m6('moon') + ' goodnight'
= m6("") " moon" +  ' goodnight'
="" + " moon goodnight"
=" moon goodnight"

- What is mystery6("Ada Developers Academy")?
=m6("Ada Developers Academy")
=m6("Developers Academy") + " Ada"
=m6("Academy") + " Developers + Ada"
=m6("") + " Academy Developers Ada"
=" Academy Developers Ada"

- What is mystery6("Hi, there!")?
=m6("Hi, there!")
=m6("there!") + " Hi,"
= m6("") + " there! Hi,"


- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

def mystery6(s)
if s == nil || s.length == 0
return ""
end
return s[(s.length - 1)] + mystery6(s[0...(s.length-1)])
end
