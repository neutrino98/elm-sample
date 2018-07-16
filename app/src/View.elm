module View exposing (..)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Page.LandingPage as LandingPage
import State exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ LandingPage.view model.plist ]
