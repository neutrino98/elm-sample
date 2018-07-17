module Main exposing (..)

import Html exposing (..)
import State exposing (..)
import Types exposing (..)
import View exposing (..)
import Navigation exposing (Location)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Navigation.program LocationChanged
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
