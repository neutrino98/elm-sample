module State exposing (..)

import Types exposing (..)
import Request.Person as PersonRequest exposing (..)
import Task exposing (Task)


init : ( Model, Cmd Msg )
init =
    let
        personsTask =
            PersonRequest.getPersons

        initailModel =
            { plist = []
            , currentPerson = Nothing
            }
    in
    ( initailModel, Task.attempt PersonsLoadedMsg personsTask )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonsLoadedMsg (Ok list) ->
            ( { model | plist = list }, Cmd.none )

        SelectedPersonLoaded (Ok person) ->
            ( { model | currentPerson = Just person }, Cmd.none )

        _ ->
            ( model, Cmd.none )

