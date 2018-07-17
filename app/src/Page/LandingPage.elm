module Page.LandingPage exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Views.PersonsList as PersonsList exposing (..)
import Types exposing(..)


view : List Person -> Html Msg
view persons =
    PersonsList.personsList persons
