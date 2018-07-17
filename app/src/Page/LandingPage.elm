module Page.LandingPage exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Views.PersonsList as PersonsList exposing (..)
import Types exposing(..)


view : List Person -> Bool -> Html Msg
view persons isLoading =
    PersonsList.personsList persons isLoading 
