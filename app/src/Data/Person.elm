module Data.Person exposing (..)

import Json.Decode as Decode exposing (Decoder, list)
import Json.Decode.Pipeline exposing (decode, required)


type alias Person =
    { name : String
    , height : String
    , mass : String
    , gender : String
    }


personDecoder : Decoder Person
personDecoder =
    decode Person
        |> required "name" Decode.string
        |> required "height" Decode.string
        |> required "mass" Decode.string
        |> required "gender" Decode.string


personListDecoder : Decoder (List Person)
personListDecoder =
    Decode.field "results" (list personDecoder)