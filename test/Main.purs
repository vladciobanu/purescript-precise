module Test.Main where

import Prelude
import Test.QuickCheck.Laws.Data.Eq (checkEq)
import Test.QuickCheck.Laws.Data.Ord (checkOrd)
import Test.QuickCheck.Laws.Data.Semiring (checkSemiring)
import Test.QuickCheck.Laws.Data.Ring (checkRing)
import Data.HugeNum (HugeNum)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff.Random (RANDOM)
import Type.Proxy (Proxy(..))

prxHugeNum :: Proxy HugeNum
prxHugeNum = Proxy

main :: forall eff.
  Eff
    ( console :: CONSOLE
    , random :: RANDOM
    , exception :: EXCEPTION
    | eff
    )
    Unit
main = do
  log "Checking HugeNum instances...\n"
  checkEq prxHugeNum
  checkOrd prxHugeNum
  checkSemiring prxHugeNum
  checkRing prxHugeNum
