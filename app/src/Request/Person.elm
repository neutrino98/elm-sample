module Request.Person exposing(getPersonById, getPersons)

import Http
import Request.Helpers exposing(apiUrl)
import HttpBuilder
import Task exposing (Task)
import Data.Person as Person exposing (..)


getPersonById: String -> Task Http.Error Person
getPersonById id = 
    let
        expect =
            Person.personDecoder
                |> Http.expectJson
    in
        apiUrl ("/people/" ++ id)
            |> HttpBuilder.get
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
        apiUrl("/people/")
            |> HttpBuilder.get
            |> HttpBuilder.withExpect expect
            |> HttpBuilder.toRequest
            |> Http.toTask                
