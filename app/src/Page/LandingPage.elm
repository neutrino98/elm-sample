module Page.LandingPage exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (..)
import Request.Person as Person exposing (..)
import Task exposing (Task)
import Views.PersonsList as PersonsList exposing (..)
import Types exposing(..)

--Model--


type alias Model =
    { error : String
    , persons : List Person
    }


init : Task.Task Model Model
init =
    let
        handleLoadError a =
            Model (toString a) []

        persons =
            Person.getPersons
    in
    Task.map (\x -> Model "" x) persons
        |> Task.mapError handleLoadError


initialModel : List Person -> String -> Model
initialModel persons a =
    { persons = persons
    , error = a
    }



--View--


view : List Person -> Html Msg
view persons =
    PersonsList.personsList persons
