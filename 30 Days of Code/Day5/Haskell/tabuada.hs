{-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where

import Control.Monad()
import Data.Array()
import Data.Bits()
import Data.List()
import Data.Set()
import Data.Text
import Debug.Trace()
import System.Environment()
import System.IO()
import System.IO.Unsafe()



lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack
rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

main :: IO()
main = do
    nTemp <- getLine
    let n = read $ lstrip $ rstrip nTemp :: Int
    let i = 1 :: Int
    putStrLn (show n ++ " x " ++ show i ++ " = " ++ show (n*i))
    putStrLn (show n ++ " x " ++ show (i+1) ++ " = " ++ show (n*(i+1)))
    putStrLn (show n ++ " x " ++ show (i+2) ++ " = " ++ show (n*(i+2)))
    putStrLn (show n ++ " x " ++ show (i+3) ++ " = " ++ show (n*(i+3)))
    putStrLn (show n ++ " x " ++ show (i+4) ++ " = " ++ show (n*(i+4)))
    putStrLn (show n ++ " x " ++ show (i+5) ++ " = " ++ show (n*(i+5)))
    putStrLn (show n ++ " x " ++ show (i+6) ++ " = " ++ show (n*(i+6)))
    putStrLn (show n ++ " x " ++ show (i+7) ++ " = " ++ show (n*(i+7)))
    putStrLn (show n ++ " x " ++ show (i+8) ++ " = " ++ show (n*(i+8)))
    putStrLn (show n ++ " x " ++ show (i+9) ++ " = " ++ show (n*(i+9)))