{-

easy-args
Copyright (C) Jonathan Lamothe <jonathan@jlamothe.net>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this program.  If not, see
<https://www.gnu.org/licenses/>.

-}

module ParseArgsSpec (spec) where

import Test.Hspec (Spec, describe, it, shouldBe)

import EasyArgs

spec :: Spec
spec = describe "parseArgs" $ let
  input =
    [ "-abc"
    , "--foo"
    , "-"
    , "--"
    , "foo"
    ]

  expected =
    [ Flag 'a'
    , Flag 'b'
    , Flag 'c'
    , Tag "foo"
    , Dash
    , DoubleDash
    , ArgText "foo"
    ]

  in it ("should be " ++ show expected) $
    parseArgs input `shouldBe` expected

--jl
