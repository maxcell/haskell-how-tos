# Haskell Prep Material (WIP)

## Table of Contents
- Test 1
  1. [Baby Steps](#baby-steps)
    - [Arithmetic](#arithmetic)
    - [Boolean](#boolean)
    - [Beginning With Functions](#beginning-with-functions)
  2. [Lists](#lists)
    - [Grabbing values from Index](#grabbing-values-from-index)
    - [Adding onto Lists](#adding-onto-lists)
    - [Comparing Lists](#comparing-lists)
    - [List Functions](#list-functions)
    - [Ranges](#ranges)
      - [Cooler List Functions](#cooler-list-functions)
  3. [List Comprehensions](#list-comprehensions)
  4. [Need to Know Functions(WIP)](#need-to-know-functions)
  5. [Lambdas](#lambdas)
  6. Abstract Data Types
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

We can write our own functions too! (We will get further into this more later)
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

### Lists
Lists are a **homogenous** data structure. It will contain several pieces of
data, however they must be of the same type.

Note: Let allows us to define a name (or a definition) within the interactive mode.
It has use elsewhere but this is an easy way for us to play around still while being in interactive. Otherwise, we would need to write this in a separate file and load it.
```haskell
Prelude> let listOfNumbers = [1, 7, 2, 4, 10, 19]
Prelude> listOfNumbers
[1,7,2,4,10,19]
```

Strings are actually lists of `Char`
```haskell
Prelude> let myName = "Prince Wilson"
Prelude> myName
"Prince Wilson"
Prelude> :t myName
[Char]
```

You can also have lists of lists:
```haskell
Prelude> let b = [[1,2,3], [4,5,6], [7,8,9]]
Prelude> b
[[1,2,3],[4,5,6],[7,8,9]]
```

#### Grabbing values from Index
If we want to get something in a specific index, we can use `<list> !! <index>`
```haskell
Prelude> let listOfNumbers = [1, 7, 2, 4, 10, 19]
Prelude> listOfNumbers !! 4
10
```

#### Adding onto Lists
You can add things onto a list either by `:` or `++`, however, these do two
different things.

`:` will either take a single data entry or a list of the same data entries and
will prepend it onto another list.
```haskell
Prelude> 1:[]
[1]
Prelude> 1:2:3:4:[]
[1,2,3,4]
Prelude> [1,2,3]:[4,5,6]:[7,8,9]:[]
[[1,2,3],[4,5,6],[7,8,9]]
```

`++` takes two lists and combines them. Specifically, it
**traverses** the list on the *left* and then adds on the contents of the list
on the right side. The reason why this is important to note is because, let's
you have a huge list on the left, then this would take a significant amount of time. Not only that, the `++` requires that both operands are **lists**.
```haskell
Prelude> let listOfNumbers = [1, 7, 2, 4, 10, 19]
Prelude> listOfNumbers ++ [1]
[1,7,2,4,10,19,1]
Prelude> let name = [ "Robert" , "Charles" ]
Prelude> let fullName = name ++ ["Williamson"]
Prelude> fullName
["Robert","Charles","Williamson"]
```

#### Comparing Lists
You can use equality operators to see whether or not lists are `>`, `<`, `>=`,
`<=`, `==`, or `/=`. This only works with content that can actually compared.
They are compared in *lexicographical* order. First, the heads are compared and if they are equal second element is compared, and following down till the end.
```haskell
Prelude> [1,2,3] < [1,3,2]
True
Prelude> [1,2,3] /= [1,2,3]
False
Prelude> [1,2,3] >= [1,1,4]
True
```

#### List Functions
Here, we will have a small subset of the laundry list of functions that [Learn You a Haskell For Great Good!](http://learnyouahaskell.com/starting-out#babys-first-functions) has
mentioned about lists!

Let's just say we have a list `[1,2,3,4,5,6]` through all of these examples.

`head` - takes a list and returns its head. (i.e. the list's first element)
```haskell
Prelude> head [1,2,3,4,5,6]
1
```
`last` - takes a list and returns the last element.
```haskell
Prelude> last [1,2,3,4,5,6]
6
```
`init` - takes a list and returns everything but the last element.
```haskell
Prelude> init [1,2,3,4,5,6]
[1,2,3,4,5]
```
`tail` - takes a list and returns its tail. (i.e. takes all of the list but the head)
```haskell
Prelude> tail [1,2,3,4,5,6]
[2,3,4,5,6]
```
`length` - *surprise*, takes a list and returns the length of it.
```haskell
Prelude> length [1,2,3,4,5,6]
6
```
`maximum` - returns the maximum from the list.
```haskell
Prelude> maximum [1,2,3,4,5,6]
6
```
`minimum` - returns the minimum from the list.
```haskell
Prelude> minimum [1,2,3,4,5,6]
1
```
`sum` - computes the sum from a list of numbers.
```haskell
Prelude> sum [1,2,3,4,5,6]
21
```
`product` - computes the product from a list of numbers.
```haskell
Prelude> product [1,2,3,4,5,6]
720
```

#### Ranges
As you can see before, writing out lists that have either an
ascending/descending order is repetitive and time consuming. That's why Haskell
is lovely and allows you to just say what the beginning and end is (along with
what kind of pattern you want) and it can fill the inbetween.

```haskell
Prelude> [1..15]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
Prelude> [2,4..20]
[2,4,6,8,10,12,14,16,18,20]
Prelude> [1,3..20]
[1,3,5,7,9,11,13,15,17,19]
Prelude> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"
```


##### Cooler List Functions
To make some more cool lists you can utilize even more list functions.
```haskell
Prelude> take 10 [3,9..]
[3,9,15,21,27,33,39,45,51,57]
```
```haskell
Prelude> take 8 (cycle [0,1])
[0,1,0,1,0,1,0,1]
```
```haskell
Prelude> take 6 (repeat 10)
[10,10,10,10,10,10]
```

However, with repeat, you could actually even shorten it more
```haskell
Prelude> replicate 6 10
[10,10,10,10,10,10]
```

### List Comprehensions
A comprehension is a way for you to create a more specific set out of a general
set. Thus a list comprehension allows you to, in a sense, pick and choose a set
of elements from a list(s) through the use of predicates, or conditions.

A basic list comprehension for a set (list) that contains the first ten even
number is
```haskell
Prelude> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
```
where x is selected from the list [1..10], or a list that contains all the number
from 1 to 10. And for every element within that list (which is bound to x), you
double that element's value.

Using the previous example, you can also add in predicates (conditions) to further
narrow down your result. For example,
```haskell
Prelude> [x*2 | x <- [1..10], x*2 >= 10]
[10,12,14,16,18,20]
```
will do the same thing as the previous comprehension, except that this time you
are telling Haskell to only get the even numbers greater than or equal to 10.

You can also include more than one predicate. If you want all the numbers from 1
to 10 that are not 7, 8, 9 (because we don't want seven to eat nine), you'd do
```haskell
Prelude> [x | x <- [1..10], x /= 7, x /= 8, x /= 9]
[1,2,3,4,5,6,10]
```

Not only can you have more than one predicate, you can also draw from multiple
lists at the same time.
```haskell
Prelude> [x+y | x <- [10,20,30], y <- [30,20,10], x /= 20, y /= 20]
[40,20,60,40]
```
What you see there is all the possible combination of x + y where x and y cannot
be 20. *[10 + 30, 10 + 10, 30 + 30, 30 + 10]*

Just one more, you're nearly done. Let's try creating a list comprehension that
can separate a string of digits at the decimal point (taken from HW2).
```haskell
Prelude> let regex = "12.45"
Prelude> [splitAt i regex | i <- [0..(length regex - 1)], regex !! i == '.']
[("12", ".45")]
```
Awesome! Now you can do whatever you want with that result. You know, like taking
the head of the resulting array, which results in a tuple, which you can then take
the fst and snd value of the tuple, discard the decimal point by taking the tail of
the snd tuple, reversing the value, and then checking them both for superfluous 0's
and.......oops, I digress.


### Need to Know Functions

`zip` - takes two lists and zips (interleave) them together. Basically, the two lists
are combined into one with alternating elements from each list. Also, it is important
to remember that zip truncates the longer list to match the length of the shorter one.
```haskell
Prelude> zip [1,2,3] ['a','b']
[(1,'a'),(2,'b')]
```
Let's implement `zip` so we can see how it really works underneath.
```haskell
zip' :: [a] -> [b] -> [(a,b)]
-- Note that this function definition is telling us that the two input lists can be
-- either of the same type or different types. This is important because if you declare
-- that both lists are of type a, you won't be able to zip a list of int and a list of
-- char together.
```
```haskell
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
-- Here we are saying that as long as there is an empty list, zip' will always return
-- an empty list. This part here is the sole reason why the function zip "truncates" the
-- longer list, because once you reach the end of the shorter list, you are zipping a 
-- non-empty list with an empty list, which will always give you an empty list as a result.
```
```haskell
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys
-- Simple algorith. Taking out the first element from both lists, put them together in
-- a tuple, and prepending it to the list that will be recursively created from the rest
-- of the lists.
```

`zipWith` - takes in a function and two lists, and outputting a list of the result
after applying the function to the two input lists. This works in almost the exact
same way as the zip function, except for the additional input function that is applied
to both lists.
```haskell
Prelude> zipWith (+) [1,2,3] [4,5,6,7]
[5,7,9]
```
zipWith added the corresponding elements together and outputed one result list *[1+4,2+5,3+6]*
Let's also implement zipWith to see how it works.
```haskell
zipWith' (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- (a -> b -> c) in the first line is a function input that takes in a and b and returns
-- c. In thise case, f took in x and y, which are the first element in both list, and
-- performed function f on them, which in this case is the addition operation.
```

`map` - takes a function and a list, applies the function to every element within the list,
and produce a new result list.
```haskell
Prelude> map (+3) [1,2,3,4]
[4,5,6,7]
```
How does the function map works?
```haskell
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
-- Pretty simple. Similar to zipWith', map' takes in a function that takes in a and return b,
-- and map' itself uses that function on list of type a to return list of type b, which means
-- the resulting list is of whatever type the function f returns.
```

`filter` - takes a predicate and a list and returns the list of only the elements that
satisfy the predicate. Before I synonymized predicate to condition, which is technically
still true, but the actual Haskell definition for predicate is a function that tells whether
something is true or not, so basically a function that returns a boolean value. The main thing
here is that do not assume that predicates are only comparison conditions such as (<, >, etc.).
Because predicates are functions, any function that returns a boolean value is a predicate.
```haskell
Prelude> filter (>5) [1..10]
[6,7,8,9,10]
Prelude> filter even [1..10]
[2,4,6,8,10]
```
Of course, let's also take a look at the inner working of filter.
```haskell
filter' (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
  | p x       = x : filter' p xs
  | otherwise = filter' p xs
-- For the last pattern match, unlike with the previous functions that takes in a function,
-- you would first have to check if the element x satisfy the predicate p, and if it does, then
-- include x in the resulting list. Otherwise, discard x and continues.
```

### Lambdas
