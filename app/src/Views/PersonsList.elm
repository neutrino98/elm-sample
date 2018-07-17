module Views.PersonsList exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http exposing (..)
import Types exposing (..)
import Utils exposing (..)

renderPerson : Person -> Html Msg
renderPerson person =
    tr [ class "person-list-table-body" ]
        [ td []
            [ text person.name ]
        , td []
            [ text person.height ]
        , td []
            [ text person.mass ]
        , td []
            [ text person.gender ]
        , td []
             [ button [ onClick (OnPersonClick person.url) ]
                    [ text "View profile" ]
                ]     
        ]


personsList : ( List Person ) -> Bool -> Html Msg
personsList persons isLoading =
    let
        body = if isLoading then [ loading ] else List.map renderPerson persons
    in 
    div []
        [ h3 [ class "person-list-header" ]
            [ text "Persons list" ]
        , table [ class "person-list-table" ]
            ([ tr [ class "person-list-table-header" ]
                [ th []
                    [ text "name" ]
                , th []
                    [ text "height" ]
                , th []
                    [ text "mass" ]
                , th []
                    [ text "gender" ]
                , th []
                    [ text "profile" ]    
                ]
             ]
                ++ body
            )
        ]

