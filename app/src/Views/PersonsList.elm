module Views.PersonsList exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


personsList : Persons -> Html msg
personsList persons =
    div []
        [ h3 []
            [ text "Persons list" ]
        ]
