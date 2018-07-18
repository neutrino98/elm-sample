module Views.PersonCard exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (..)


personCard : Person -> Bool -> Html Msg
personCard person isLoading =
    let
        body =
            if isLoading then
                loading
            else
                personCardBody person
    in
    body


personCardBody : Person -> Html Msg
personCardBody person =
    table []
        [ tr []
            [ td []
                [ text "Name" ]
            , td []
                [ text person.name ]
            ]
        , tr []
            [ td []
                [ text "Height" ]
            , td []
                [ text person.height ]
            ]
        , tr []
            [ td []
                [ text "Mass" ]
            , td []
                [ text person.mass ]
            ]
        , tr []
            [ td []
                [ text "Gender" ]
            , td []
                [ text person.gender ]
            ]
        ]
