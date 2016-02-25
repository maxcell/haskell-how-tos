-- Test Cases made by kcolley, edited by Prince to match assumptions
-- clarified by Professor

-- To run entire suite:
-- ```
-- $ ghci RegularExpressionsBetterTests
-- RegularExpressionsBetterTests> runTests
-- ```

-- Or can be loaded when you are in ghci by simply:
-- ```
-- Prelude> :l RegularExpressionsBetterTests
-- RegularExpressionsBetterTests> runTests 
-- ```

module RegularExpressionsBetterTests where

import Prelude hiding ((<*>))

import Test.HUnit

import RegularExpressions

-- Test legal numbers
test_number_0 =
  TestCase (assertEqual "number \"4\"" (True) (number "4"))

test_number_1 =
  TestCase (assertEqual "number \"123\"" (True) (number "123"))

test_number_2 =
  TestCase (assertEqual "number \"0\"" (True) (number "0"))

-- Test illegal numbers
test_number_3 =
  TestCase (assertEqual "number \"123abc\"" (False) (number "123abc"))

test_number_4 =
  TestCase (assertEqual "number \"abc123\"" (False) (number "abc123"))

test_number_5 =
  TestCase (assertEqual "number \"0x123\"" (False) (number "0x123"))

test_number_6 =
  TestCase (assertEqual "number \"1e9\"" (False) (number "1e9"))

test_number_7 =
  TestCase (assertEqual "number \"0123\"" (False) (number "0123"))

test_number_8 =
  TestCase (assertEqual "number \"\"" (False) (number ""))


-- Test legal fractional numbers
test_fractional_0 =
  TestCase (assertEqual "fractional \"1.2\"" (True) (fractional "1.2"))

test_fractional_1 =
  TestCase (assertEqual "fractional \"123.456\"" (True) (fractional "123.456"))

test_fractional_2 =
  TestCase (assertEqual "fractional \"10.01\"" (True) (fractional "10.01"))

test_fractional_3 =
  TestCase (assertEqual "fractional \"1.0\"" (True) (fractional "1.0"))

test_fractional_4 =
  TestCase (assertEqual "fractional \"0.1\"" (True) (fractional "0.1"))

-- Test illegal fractional numbers
test_fractional_5 =
  TestCase (assertEqual "fractional \"123\"" (False) (fractional "123"))

test_fractional_6 =
  TestCase (assertEqual "fractional \"123abc.456\"" (False) (fractional "123abc.456"))

test_fractional_7 =
  TestCase (assertEqual "fractional \"123.456xyz\"" (False) (fractional "123.456xyz"))

test_fractional_8 =
  TestCase (assertEqual "fractional \"abc123.456\"" (False) (fractional "abc123.456"))

test_fractional_9 =
  TestCase (assertEqual "fractional \"123.xyz456\"" (False) (fractional "123.xyz456"))

test_fractional_10 =
  TestCase (assertEqual "fractional \"1.2e5\"" (False) (fractional "1.2e5"))

test_fractional_11 =
  TestCase (assertEqual "fractional \"10.00\"" (False) (fractional "10.00"))

test_fractional_12 =
  TestCase (assertEqual "fractional \"10.0010\"" (False) (fractional "10.0010"))

test_fractional_13 =
  TestCase (assertEqual "fractional \"00.01\"" (False) (fractional "00.01"))

test_fractional_14 =
  TestCase (assertEqual "fractional \"0100.01\"" (False) (fractional "0100.01"))

test_fractional_15 =
  TestCase (assertEqual "fractional \".\"" (False) (fractional "."))

test_fractional_16 =
  TestCase (assertEqual "fractional \"0.10\"" (False) (fractional "0.10"))

test_fractional_17 =
  TestCase (assertEqual "fractional \"0.100000\"" (False) (fractional "0.100000"))

test_fractional_18 =
  TestCase (assertEqual "fractional \"0.000000\"" (False) (fractional "0.000000"))

test_fractional_19 =
  TestCase (assertEqual "fractional \"1.00010000\"" (False) (fractional "1.00010000"))

tests = TestList [
    -- Legal Number Tests
    TestLabel "number" test_number_0,
    TestLabel "number" test_number_1,
    TestLabel "number" test_number_2,

    -- Illegal Number Tests
    TestLabel "number" test_number_3,
    TestLabel "number" test_number_4,
    TestLabel "number" test_number_5,
    TestLabel "number" test_number_6,
    TestLabel "number" test_number_7,
    TestLabel "number" test_number_8,

    -- Legal Fractional Tests
    TestLabel "fractional number" test_fractional_0,
    TestLabel "fractional number" test_fractional_1,
    TestLabel "fractional number" test_fractional_2,
    TestLabel "fractional number" test_fractional_3,

    -- Illegal Fractional Tests
    TestLabel "fractional number" test_fractional_4,
    TestLabel "fractional number" test_fractional_5,
    TestLabel "fractional number" test_fractional_6,
    TestLabel "fractional number" test_fractional_7,
    TestLabel "fractional number" test_fractional_8,
    TestLabel "fractional number" test_fractional_9,
    TestLabel "fractional number" test_fractional_10,
    TestLabel "fractional number" test_fractional_11,
    TestLabel "fractional number" test_fractional_12,
    TestLabel "fractional number" test_fractional_13,
    TestLabel "fractional number" test_fractional_14,
    TestLabel "fractional number" test_fractional_15,
    TestLabel "fractional number" test_fractional_16,
    TestLabel "fractional number" test_fractional_17,
    TestLabel "fractional number" test_fractional_18,
    TestLabel "fractional number" test_fractional_19
    ]

runTests = runTestTT tests
