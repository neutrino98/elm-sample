module Page.Profile exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Types exposing (..)
import Views.PersonCard as PersonCard exposing (..)


view : Person -> Person -> Bool -> Html Msg
view person inputPerson isLoading =
    PersonCard.personCard person inputPerson isLoading
