module Main exposing (..)

import Html exposing (..)
import State exposing (..)
import Types exposing (..)
import View exposing (..)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
