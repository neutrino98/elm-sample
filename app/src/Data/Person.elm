module Data.Person exposing (..)

import Json.Decode as Decode exposing (Decoder, list)
import Json.Decode.Pipeline exposing (decode, required)
import Types exposing (..)


personDecoder : Decoder Person
personDecoder =
    decode Person
        |> required "name" Decode.string
        |> required "height" Decode.string
        |> required "mass" Decode.string
        |> required "gender" Decode.string
        |> required "url" Decode.string


personListDecoder : Decoder (List Person)
personListDecoder =
    Decode.field "results" (list personDecoder)
