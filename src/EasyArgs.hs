{-|

Module      : EasyArgs
Description : Parses arguments
Copyright   : (C) Jonathan Lamothe
License     : LGPL-3
Maintainer  : jonathan@jlamothe.net
Stability   : experimental
Portability : POSIX

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

module EasyArgs (Arg (..), parseArg, parseArgs) where

-- | Defines an argument type
data Arg
  = Dash
  -- ^ Represents a single dash i.e.: @"-"@
  | DoubleDash
  -- ^ Represents a double dash i.e.: @"--"@
  | Flag Char
  -- ^ Represents a single character flag, e.g.: @"-a"@
  | Tag String
  -- ^ Represents a multi-character tag, e.g.: @"--foo"@
  | ArgText String
  -- ^ Represents a non-dashed argument, e.g.: @"foo"@
  deriving (Eq, Show)

-- | Parses a single argument string to a list of 'Arg's
parseArg :: String -> [Arg]
parseArg "-"           = [Dash]
parseArg "--"          = [DoubleDash]
parseArg ('-':'-':str) = [Tag str]
parseArg ('-':str)     = map Flag str
parseArg str           = [ArgText str]

-- | Parses a list of argument strings to a list of 'Arg's
parseArgs :: [String] -> [Arg]
parseArgs = concatMap parseArg

--jl
