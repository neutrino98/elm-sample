module Main exposing (..)

import Data.Person exposing (..)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Http exposing (..)
import Page.LandingPage as LandingPage
import Types exposing (..)
import State exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ LandingPage.view model.plist ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
