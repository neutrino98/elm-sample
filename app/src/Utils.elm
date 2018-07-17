module Utils exposing (..)

import Array exposing (..)

getIdFromUrl : String -> Int -> Maybe String
getIdFromUrl str position = 
    String.split "/" str 
        |> Array.fromList
        |> getItemFromEndArray position


getItemFromEndArray: Int -> Array a -> Maybe a
getItemFromEndArray position arr = 
    Array.get (Array.length(arr) - position) arr
    