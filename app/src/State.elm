module State exposing (..)

import Navigation exposing (Location)
import Request.Person as PersonRequest exposing (..)
import Routing exposing (..)
import Task exposing (Task)
import Types exposing (..)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.extractRoute location
    in
    ( initialModel currentRoute, Task.attempt PersonsLoaded PersonRequest.getPersons )


emptyPerson : Person
emptyPerson =
    Person "" "" "" "" ""


initialModel : Route -> Model
initialModel route =
    { plist = []
    , currentPerson = emptyPerson
    , error = Nothing
    , currentRoute = route
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonsFetch ->
            ( { model | plist = [] }, Task.attempt PersonsLoaded PersonRequest.getPersons )

        PersonsLoaded (Ok list) ->
            ( { model | plist = list }, Cmd.none )

        PersonsLoaded (Err error) ->
            ( { model | error = Just (toString error) }, Cmd.none )

        SelectedPersonLoaded (Ok person) ->
            ( { model | currentPerson = person }, Cmd.none )

        SelectedPersonLoaded (Err error) ->
            ( { model | error = Just (toString error) }, Cmd.none )

        OnPersonClick url ->
            ( model, Task.attempt SelectedPersonLoaded (PersonRequest.getPersonById url) )

        LocationChanged location ->
            ( { model
                | currentRoute = Routing.extractRoute location
              }
            , Cmd.none
            )
