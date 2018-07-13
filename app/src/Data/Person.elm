module Data.Person exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (decode, required)


type alias Person =
    { name : String
    , height : Float
    , mass : Float
    , gender : String
    }


type Persons
    = List Person


personsDecoder : Decoder (List Person)
personsDecoder =
    decode Persons
        |> required "results" personDecoder


personDecoder : Decoder Person
personDecoder =
    decode Person
        |> required "name" Decode.string
        |> required "height" Decode.float
        |> required "mass" Decode.float
        |> required "gender" Decode.string
