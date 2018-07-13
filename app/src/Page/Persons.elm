module Page.Persons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Data.Person exposing (..)
import Views.PersonsList as PersonsList exposing (..)

--Model--

type alias Model = 
    {
        persons: Persons
    }


initialModel: Model
initialModel = 
    {
        persons: []
    }

--View--


view: Model -> Html msg 
view = 
    PersonsList.personsList []

