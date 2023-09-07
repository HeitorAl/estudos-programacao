{-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Data.Text
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

--
-- Complete the 'solve' function below.
--
-- The function accepts following parameters:
--  1. DOUBLE meal_cost
--  2. INTEGER tip_percent
--  3. INTEGER tax_percent
--

solve meal_cost tip_percent tax_percent = do
    -- Write your code here
    let tip = (fromIntegral tip_percent)/100.0 * meal_cost :: Double
    let tax = (fromIntegral tax_percent)/100.0 * meal_cost :: Double
    let total_cost = meal_cost + tip + tax :: Double
    
    putStrLn "Esse e o valor total da sua refeicao"
    print (round total_cost)
lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack
rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

main :: IO()
main = do
    putStrLn "Qual o valor bruto da sua refeicao?"
    meal_costTemp <- getLine
    let meal_cost = read $ lstrip $ rstrip meal_costTemp :: Double

    putStrLn "Qual o valor percentual da gorjeta?"
    tip_percentTemp <- getLine
    let tip_percent = read $ lstrip $ rstrip tip_percentTemp :: Int

    putStrLn "Qual o valor percentual do imposto sobre a refeicao?"
    tax_percentTemp <- getLine
    let tax_percent = read $ lstrip $ rstrip tax_percentTemp :: Int

    solve meal_cost tip_percent tax_percent
