module Request.Person exposing(getPersonById, getPersons)

import Http
import HttpBuilder
import Task exposing (Task)
import Data.Person as Person exposing (..)
import Types exposing (..)

getPersonById: String -> Task Http.Error Person
getPersonById url = 
    let
        expect =
            Person.personDecoder
                |> Http.expectJson
    in
        HttpBuilder.get url   
            |> HttpBuilder.withExpect expect
            |> HttpBuilder.toRequest
            |> Http.toTask


getPersons: Task Http.Error (List Person)
getPersons = 
    let 
        expect = 
            Person.personListDecoder
                |> Http.expectJson
    in 
            HttpBuilder.get "https://swapi.co/api/people/"
            |> HttpBuilder.withExpect expect
            |> HttpBuilder.toRequest
            |> Http.toTask                
