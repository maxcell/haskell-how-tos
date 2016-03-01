# Example Problems

These are problems that I have come across, changed a little bit, so that
we can have a good list of potential questions that could be asked and be
prepared to answer for the exam! Feel free to contribute to this test
pool in any way you can!

## Table of Contents
- [Problem 1](#problem-1)


### Problem 1
[*Source*](https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list) - 
Using the given function signature, write a function that takes in a
list of `N` integers and return a new list leaving only the **even**-indexed
elements.

For example, given the list, `[3,2,5,10,2]`, we expect to see `[3,5,2]`.
```haskell
evenIndexes :: [Int] -> [Int]
```

If you want to check your work head over to `tests/`, write your code in
`Evens.hs` and then go ahead and `:l EvensTests` and run `runTests`.
**Only prerequisite is to have HUnit installed**. Otherwise, you can head over
to `solutions/` and see my two versions of solutions for `Evens.hs`.
