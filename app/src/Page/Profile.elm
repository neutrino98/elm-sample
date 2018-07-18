module Page.Profile exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Types exposing (..)
import Views.PersonCard as PersonCard exposing (..)


view : Person -> Bool -> Html Msg
view person isLoading =
    PersonCard.personCard person isLoading
