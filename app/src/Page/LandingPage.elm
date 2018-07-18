module Page.LandingPage exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Types exposing (..)
import Views.PersonsList as PersonsList exposing (..)


view : List Person -> Bool -> Html Msg
view persons isLoading =
    PersonsList.personsList persons isLoading
