module Main exposing (..)

import Html exposing (..)
import Navigation exposing (Location)
import State exposing (..)
import Types exposing (..)
import View exposing (..)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Navigation.program LocationChanged
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
