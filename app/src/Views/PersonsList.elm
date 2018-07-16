module Views.PersonsList exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

type Msg 
    = OnClickUser 

{-
renderList: List Person -> Html Msg
renderList persons = 
-}


personsList : List Person -> Html msg 
personsList persons =
    div []
        [ h3 []
            [ text "Persons list: " ]
            {-
                rendering users 
            -}
        ]

