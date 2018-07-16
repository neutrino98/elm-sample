module Main exposing (..)

import Data.Person exposing (..)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Http exposing (..)
import Page.LandingPage as LandingPage
import Request.Person as PersonRequest exposing (..)
import Task exposing (Task)
import Types exposing(..)

---- MODEL ----


type alias Model =
    { plist : List Person
    }


init : ( Model, Cmd Msg )
init =
    let
        personsTask =
            PersonRequest.getPersons

        initailModel =
            { plist = []
            }
    in
    ( initailModel, Task.attempt PersonsLoadedMsg personsTask )


---- UPDATE ----

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonsLoadedMsg (Ok list) ->
            ( { model | plist = list }, Cmd.none )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ LandingPage.view model.plist]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
