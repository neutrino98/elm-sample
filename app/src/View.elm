module View exposing (..)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Page.LandingPage as LandingPage
import Page.Profile as Profile
import State exposing (..)
import Types exposing (..)
import Routing exposing (..)
import Utils exposing (..)

view : Model -> Html Msg
view model =
    let
        id = 
            case getIdFromUrl model.currentPerson.url 2 of
                Nothing -> ""
                Just s -> s 

        view =
            case model.currentRoute of
                LandingPageRoute ->  
                    LandingPage.view model.plist
                
                PersonRoute id -> 
                    Profile.view model.currentPerson
                
                NotFoundRoute -> 
                    notFoundView                        
    in 
    div []
        [ view ]


notFoundView : Html msg
notFoundView =
    Html.h3 [] [ text "Oops!" ]