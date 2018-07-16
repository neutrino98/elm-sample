module State exposing (..)

import Request.Person as PersonRequest exposing (..)
import Task exposing (Task)
import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    let
        personsTask =
            PersonRequest.getPersons

        initailModel =
            { plist = []
            , currentPerson = Nothing
            , error = Nothing
            }
    in
    ( initailModel, Task.attempt PersonsLoaded personsTask )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonsLoaded (Ok list) ->
            ( { model | plist = list }, Cmd.none )

        PersonsLoaded (Err error) ->
            ( { model | error = Just (toString error) }, Cmd.none )

        SelectedPersonLoaded (Ok person) ->
            ( { model | currentPerson = Just person }, Cmd.none )

        SelectedPersonLoaded (Err error) ->
            ( { model | error = Just (toString error) }, Cmd.none )

        OnPersonClick url -> 
            (model, Task.attempt SelectedPersonLoaded (PersonRequest.getPersonById url))
        
        
