module Utils exposing (..)

import Array exposing (..)
import Html exposing (..)
import Types exposing (..)


getIdFromUrl : String -> Int -> Maybe String
getIdFromUrl str position =
    String.split "/" str
        |> Array.fromList
        |> getItemFromEndArray position


getItemFromEndArray : Int -> Array a -> Maybe a
getItemFromEndArray position arr =
    Array.get (Array.length arr - position) arr


loading : Html Msg
loading =
    h3 []
        [ text "Loading ...." ]
