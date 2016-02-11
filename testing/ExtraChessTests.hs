module ExtraChessTests where

import Chess
import Testing

extra_pos_tests =
    -- Test legal positions
    assertTrue (isLegalPosition ('h', 4))
    +> assertTrue (isLegalPosition ('a', 1))
    +> assertTrue (isLegalPosition ('h', 8))
    -- Test illegal positions
    +> assertFalse (isLegalPosition ('j', 10))
    +> assertFalse (isLegalPosition ('i', 8))
    +> assertFalse (isLegalPosition ('h', 9))
    +> assertFalse (isLegalPosition ('a', -5))
    +> assertFalse (isLegalPosition ('A', 4))
    +> assertFalse (isLegalPosition ('a', 0))

extra_pawn_tests =
    -- Test legal pawn motion
    assertTrue (isLegalMove White Pawn ('c', 2) ('c', 3))
    +> assertTrue (isLegalMove Black Pawn ('c', 7) ('c', 6))
    +> assertTrue (isLegalMove White Pawn ('c', 2) ('c', 4))
    +> assertTrue (isLegalMove Black Pawn ('b', 7) ('b', 5))
    +> assertTrue (isLegalMove White Pawn ('a', 2) ('a', 3))
    +> assertTrue (isLegalMove White Pawn ('h', 7) ('h', 8))
    -- Test illegal pawn motion
    +> assertFalse (isLegalMove White Pawn ('c', 3) ('c', 5))
    +> assertFalse (isLegalMove White Pawn ('c', 3) ('c', 2))
    +> assertFalse (isLegalMove White Pawn ('f', 4) ('e', 4))
    +> assertFalse (isLegalMove White Pawn ('f', 4) ('g', 4))
    +> assertFalse (isLegalMove White Pawn ('h', 8) ('h', 9))
    +> assertFalse (isLegalMove Black Pawn ('c', 2) ('c', 4))
    +> assertFalse (isLegalMove White Pawn ('h', 8) ('h', 8))

extra_knight_tests =
    -- Test legal knight motion
    assertTrue (isLegalMove White Knight ('b', 1) ('c', 3))
    +> assertTrue (isLegalMove Black Knight ('g', 8) ('f', 6))
    +> assertTrue (isLegalMove White Knight ('b', 1) ('a', 3))
    +> assertTrue (isLegalMove White Knight ('b', 1) ('d', 2))
    +> assertTrue (isLegalMove White Knight ('d', 4) ('b', 3))
    -- Test illegal knight motion
    +> assertFalse (isLegalMove White Knight ('b', 1) ('d', 1))
    +> assertFalse (isLegalMove White Knight ('b', 1) ('b', 3))
    +> assertFalse (isLegalMove White Knight ('a', 1) ('h', 8))
    +> assertFalse (isLegalMove White Knight ('h', 8) ('h', 8))

extra_bishop_tests =
    -- Test legal bishop motion
    assertTrue (isLegalMove White Bishop ('a', 1) ('b', 2))
    +> assertTrue (isLegalMove Black Bishop ('h', 8) ('g', 7))
    +> assertTrue (isLegalMove White Bishop ('a', 1) ('h', 8))
    +> assertTrue (isLegalMove White Bishop ('a', 8) ('h', 1))
    +> assertTrue (isLegalMove White Bishop ('h', 8) ('g', 7))
    +> assertTrue (isLegalMove White Bishop ('c', 4) ('f', 1))
    -- Test illegal bishop motion
    +> assertFalse (isLegalMove White Bishop ('a', 1) ('a', 2))
    +> assertFalse (isLegalMove White Bishop ('a', 1) ('b', 1))
    +> assertFalse (isLegalMove White Bishop ('a', 1) ('b', 3))
    +> assertFalse (isLegalMove White Bishop ('f', 4) ('g', 6))
    +> assertFalse (isLegalMove White Bishop ('h', 8) ('h', 8))

extra_rook_tests =
    -- Test legal rook motion
    assertTrue (isLegalMove White Rook ('a', 1) ('a', 2))
    +> assertTrue (isLegalMove Black Rook ('h', 8) ('h', 7))
    +> assertTrue (isLegalMove White Rook ('a', 1) ('b', 1))
    +> assertTrue (isLegalMove White Rook ('a', 1) ('a', 3))
    +> assertTrue (isLegalMove White Rook ('a', 1) ('a', 8))
    +> assertTrue (isLegalMove White Rook ('b', 3) ('b', 7))
    +> assertTrue (isLegalMove White Rook ('g', 6) ('g', 3))
    +> assertTrue (isLegalMove White Rook ('h', 3) ('a', 3))
    -- Test illegal rook motion
    +> assertFalse (isLegalMove White Rook ('a', 1) ('b', 2))
    +> assertFalse (isLegalMove White Rook ('b', 2) ('c', 8))
    +> assertFalse (isLegalMove White Rook ('a', 1) ('a', 9))
    +> assertFalse (isLegalMove White Rook ('h', 8) ('h', 8))

extra_queen_tests =
    -- Test legal queen motion
    assertTrue (isLegalMove White Queen ('a', 1) ('b', 2))
    +> assertTrue (isLegalMove Black Queen ('h', 8) ('g', 7))
    +> assertTrue (isLegalMove White Queen ('a', 1) ('h', 8))
    +> assertTrue (isLegalMove White Queen ('a', 8) ('h', 1))
    +> assertTrue (isLegalMove White Queen ('h', 8) ('g', 7))
    +> assertTrue (isLegalMove White Queen ('c', 4) ('f', 1))
    +> assertTrue (isLegalMove White Queen ('a', 1) ('a', 2))
    +> assertTrue (isLegalMove Black Queen ('h', 8) ('h', 7))
    +> assertTrue (isLegalMove White Queen ('a', 1) ('b', 1))
    +> assertTrue (isLegalMove White Queen ('a', 1) ('a', 3))
    +> assertTrue (isLegalMove White Queen ('a', 1) ('a', 8))
    +> assertTrue (isLegalMove White Queen ('b', 3) ('b', 7))
    +> assertTrue (isLegalMove White Queen ('g', 6) ('g', 3))
    +> assertTrue (isLegalMove White Queen ('h', 3) ('a', 3))
    -- Test illegal queen motion
    +> assertFalse (isLegalMove White Queen ('a', 1) ('b', 3))
    +> assertFalse (isLegalMove White Queen ('f', 4) ('g', 6))
    +> assertFalse (isLegalMove White Queen ('b', 1) ('a', 3))
    +> assertFalse (isLegalMove White Queen ('f', 6) ('g', 4))
    +> assertFalse (isLegalMove White Queen ('b', 2) ('c', 8))
    +> assertFalse (isLegalMove White Queen ('h', 8) ('h', 8))

extra_king_tests =
    -- Test legal king motion
    assertTrue (isLegalMove White King ('d', 1) ('c', 1))
    +> assertTrue (isLegalMove White King ('d', 1) ('c', 2))
    +> assertTrue (isLegalMove White King ('d', 1) ('d', 2))
    +> assertTrue (isLegalMove White King ('d', 1) ('e', 2))
    +> assertTrue (isLegalMove White King ('d', 1) ('e', 1))
    +> assertTrue (isLegalMove Black King ('e', 8) ('e', 7))
    +> assertTrue (isLegalMove White King ('a', 2) ('b', 1))
    -- Test illegal king motion
    +> assertFalse (isLegalMove White King ('h', 8) ('h', 6))
    +> assertFalse (isLegalMove White King ('h', 8) ('g', 6))
    +> assertFalse (isLegalMove White King ('h', 8) ('f', 7))
    +> assertFalse (isLegalMove White King ('h', 8) ('f', 8))
    +> assertFalse (isLegalMove White King ('d', 2) ('e', 4))
    +> assertFalse (isLegalMove White King ('h', 8) ('h', 8))

main = do
    startTesting "Extra Chess Tests by kcolley"
    putStrLn "Pos:"
    doneTesting extra_pos_tests
    putStrLn "Pawn:"
    doneTesting extra_pawn_tests
    putStrLn "Knight:"
    doneTesting extra_knight_tests
    putStrLn "Bishop:"
    doneTesting extra_bishop_tests
    putStrLn "Rook:"
    doneTesting extra_rook_tests
    putStrLn "Queen:"
    doneTesting extra_queen_tests
    putStrLn "King:"
    doneTesting extra_king_tests
