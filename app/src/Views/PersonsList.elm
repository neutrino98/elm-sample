module Views.PersonsList exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


type Msg
    = OnClickUser


renderPerson : Person -> Html msg
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
        ]


personsList : List Person -> Html msg
personsList persons =
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
                ]
             ]
                ++ List.map renderPerson persons
            )
        ]
