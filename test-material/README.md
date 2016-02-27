# Haskell Prep Material
## Work in Progress

## Table of Contents
- Test 1
  1. [Baby Steps](#baby-steps)
    - [Arithmetic](#arithmetic)
    - [Boolean](#boolean)
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
We can test equality by use of `==`(equal) and `/=`(not equal).
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
