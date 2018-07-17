module PersonCard exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)

personCard : Person -> Html Msg
personCard person = 
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

