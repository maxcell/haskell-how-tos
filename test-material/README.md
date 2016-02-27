# Haskell Prep Material
## Work in Progress

## Table of Contents
- Test 1
  1. [Baby Steps](#baby-steps)
    - [Arithmetic](#arithmetic)
    - [Boolean](#boolean)
    - [Beginning With Functions](#beginning-with-functions)
  2. Lists
  3. Need to Know Functions
  4. Lambdas
  5. Abstract Data Types
    - Trees

### Baby Steps
When learning a new language, we should always refer back to what we know. It is
easier to say, "Oh this thing that I know is similar to what I am doing now."
Being able to make these connections are not necessarily correct, but help us
build new associations.

We know that in order to start Haskell's interactive mode in terminal is simply
done by `ghci`.

```haskell
Prelude>
```
I would strongly suggest writing these things out rather than copying/pasting
anything.
1. Since the test will involve handwriting code, and you will need to be able to
know what is available for yourself, the only way is to get better.
2. It will ensure you understand why the code works the way it does by each time
you write it out. The more you write, the easier it is to build memory through
repetition.

#### Arithmetic
We can perform simple arithmetic expressions.
```haskell
Prelude> 2 + 3
5
Prelude> 2/5
0.4
Prelude> 5*(6/3)+2
12.0
-- Note when using negatives, be sure to encapsulate with parentheses
Prelude> 5 + -3 -- Error
Prelude> 5 + (-3)
2
-- **Haskell does not support `%` as a mod BUT `^` is exponent**
Prelude> 4^2
16
```

#### Boolean
We can even do `Boolean` operations.
```haskell
Prelude> True   -- Basic Statement of being True
True
Prelude> False  -- Basic Statement of being False
False
Prelude> True && False -- AND statement (True AND False --> False)
False
Prelude> True || False -- OR statement (True OR False --> True)
True
Prelude> not True     -- NOT (negation) statement (!True --> False)
False
Prelude> not (True || not (False && False))
False
```
We can test equality by use of `==` (equal) and `/=` (not equal).
```haskell
Prelude> 4 == 4
True
Prelude> 5 == 6
False
Prelude> "hello" /= "world"
True
Prelude> "turnip" /= "turnip"
False
```

#### Beginning With Functions
Functions in Haskell are *typically* written in **prefix**
form, meaning the name will come first and then the items we
want to pass in its parameters will follow after (there are
exceptions to this but, generally).

**IMPORTANT: In Haskell, functions are called by writing the
function name, a space and then the parameters, separated by
spaces.**

As [Learn You a Haskell For Great Good!](http://learnyouahaskell.com/starting-out#babys-first-functions)
starts off with is right above that section, `succ`, `max` and `min`.

> The `succ` function takes anything that has a defined successor and returns that successor. As you can see, we just separate the function name from the parameter with a space. Calling a function with several parameters is also simple. The functions `min` and `max` take two things that can be put in an order (like numbers!). `min` returns the one that's lesser and `max` returns the one that's greater.

```haskell
Prelude> succ 9
10
Prelude> min 7 8
7
Prelude> max 9 10
10
Prelude> max 10 (min 20 30) -- We can chain functions like this if we indicate
20                          -- which should execute first or before another
Prelude> succ (max 9 10)    -- Note: max will return 10 and because of the (), we
11                          -- make sure to have it execute first before succ
```

We can write our own functions too!(We will get further into this more later.)
```haskell
-- Open up your favorite text editor and go ahead and write this out in it
-- Save it as firstFunctions.hs and then go to terminal and writ
-- ghci firstFunctions.hs
halveMe x = x / 2
```

Now you will see,
```haskell
*Main>
```

You are working within the `Main` Module, but do not worry to much about this.
Moving forward, let's try out our new function.
```haskell
*Main> halveMe 20
10.0
```

But let's add another function into our `firstFunctions.hs`
```haskell
halveMe x = x / 2
squareMe x = x ^ 2
```

Let's have some real fun, you can easily update your `ghci` with just `:r`, or
you can do the `ghci firstFunctions` or just `ghci` and then `:l firstFunctions`
(As you can see there are a lot of ways of doing the same thing.)
```haskell
*Main> max (succ (halveMe (squareMe 16))) 69
129.0
```
