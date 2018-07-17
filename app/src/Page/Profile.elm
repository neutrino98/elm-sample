module Page.Profile exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Types exposing (..)
import Views.PersonCard as PersonCard exposing (..)


view: Person -> Html Msg
view person = 
    PersonCard.personCard person    