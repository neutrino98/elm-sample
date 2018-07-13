module Request.Person exposing(getPersonById)

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


getPersons: String -> Task Http.Error List Person
getPersons = 
    let 
        expect = 
            Person.personsDecoder
                |> Http.expectJson
    in 
        apiUrl("/people/")
            |> HttpBuilder.get
            |> HttpBuilder.withExpect expect
            |> HttpBuilder.toRequest
            |> Http.toTask                
