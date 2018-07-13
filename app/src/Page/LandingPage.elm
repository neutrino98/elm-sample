module Page.LandingPage exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (..)
import Request.Person as Person exposing (..)
import Views.PersonsList as PersonsList exposing (..)
import Task exposing (Task)


--Model--


type alias Model =
    { error : String
    , persons : List Person
    }


init : Task.Task Model Model
init =
    let
        handleLoadError a = Model ( toString a) []
    in
        Task.map (\x -> Model "" x) Person.getPersons
            |> Task.mapError handleLoadError
    -- let
    --     persons =
    --         Person.getPersons |> Task.toResult   
    -- in
    -- case persons of
        
    --     Err a ->
    --         initialModel [] a

    --     Ok persons1 ->
    --         initialModel persons1 ""


initialModel : List Person -> String -> Model
initialModel persons a =
    { persons = persons
    , error = a
    }



--View--


view : Html msg
view =
    PersonsList.personsList []
