module Test.Main where

import Prelude
import Test.QuickCheck.Laws.Data.Eq
import Test.QuickCheck.Laws.Data.Ord
import Test.QuickCheck.Laws.Data.Semiring
import Test.QuickCheck.Laws.Data.Ring
import Data.HugeNum
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
    , err :: EXCEPTION
    | eff
    )
    Unit
main = do
  log "Checking HugeNum instances...\n"
  checkEq prxHugeNum
  checkOrd prxHugeNum
  checkSemiring prxHugeNum
  checkRing prxHugeNum
