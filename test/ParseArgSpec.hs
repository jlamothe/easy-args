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

module ParseArgSpec (spec) where

import Test.Hspec (Spec, context, describe, it, shouldBe)

import EasyArgs

spec :: Spec
spec = describe "parseArg" $ mapM_
  ( \(input, expected) ->
    context (show input) $
      it ("should be " ++ show expected) $
        parseArg input `shouldBe` expected
  )

  --  input,   expected
  [ ( "-",     [Dash]          )
  , ( "--",    [DoubleDash]    )
  , ( "-abc",  abc             )
  , ( "--foo", [Tag "foo"]     )
  , ( "foo",   [ArgText "foo"] )
  ]

  where
    abc = [ Flag 'a', Flag 'b', Flag 'c' ]

--jl
