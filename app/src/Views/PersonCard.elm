module Views.PersonCard exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (..)
import Html.Events exposing (onClick, onInput)


personCard : Person -> Person -> Bool -> Html Msg
personCard person inputPerson isLoading =
    let
        body =
            if isLoading then
                loading
            else
                personCardBody person inputPerson
    in
    body


personCardBody : Person -> Person -> Html Msg
personCardBody person inputPerson =
    let 
        id = case getIdFromUrl person.url 2 of 
            Just s -> s
            Nothing -> Debug.crash ""

    in
    table []
        [ tr []
            [ td []
                [ text "Name" ]
            , td []
                [ text person.name ]
            , td []
                [ input [ type_ "text", value inputPerson.name, onInput OnNameInput ]
                []
            , button [onClick (UpdatePersonName id inputPerson.name)]
                [ text "Submit" ]
                ]    
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

