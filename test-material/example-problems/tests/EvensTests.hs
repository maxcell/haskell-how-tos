-- Tests for Problem 1 written by Maxcell Prince Wilson
module EvensTests where

import Test.HUnit

import Evens


test_case_0 =
  TestCase (assertEqual "List 0 [1,2,3,4]" ([1,3]) (evenIndexes [1,2,3,4]))

test_case_1 =
  TestCase (assertEqual "List 1 [2]" ([2]) (evenIndexes [2]))

test_case_2 =
  TestCase (assertEqual "List 2 []" ([]) (evenIndexes []))

test_case_3 =
  TestCase (assertEqual "List 3 [1,3..20]" ([1,5,9,13,17]) (evenIndexes [1,3..20]))

test_case_4 =
  TestCase (assertEqual "List 4 [0..100]" ([0,2..100]) (evenIndexes [0..100]))


tests = TestList [
    TestLabel "evens" test_case_0,
    TestLabel "evens" test_case_1,
    TestLabel "evens" test_case_2,
    TestLabel "evens" test_case_3,
    TestLabel "evens" test_case_4
    ]

runTests = runTestTT tests
