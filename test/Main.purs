module Test.Main where

import Prelude

import Data.HugeNum (HugeNum)
import Effect (Effect)
import Effect.Console (log)
import Test.QuickCheck.Laws.Data.Eq (checkEq)
import Test.QuickCheck.Laws.Data.Ord (checkOrd)
import Test.QuickCheck.Laws.Data.Ring (checkRing)
import Test.QuickCheck.Laws.Data.Semiring (checkSemiring)
import Type.Proxy (Proxy(..))

prxHugeNum :: Proxy HugeNum
prxHugeNum = Proxy

main :: Effect Unit
main = do
  log "Checking HugeNum instances...\n"
  checkEq prxHugeNum
  checkOrd prxHugeNum
  checkSemiring prxHugeNum
  checkRing prxHugeNum
