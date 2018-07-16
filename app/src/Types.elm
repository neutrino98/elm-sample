module Types exposing (..)

import Http exposing (..)


type alias Model =
    { plist : List Person
    , currentPerson : Maybe Person
    , error: Maybe String
    }


type alias Person =
    { name : String
    , height : String
    , mass : String
    , gender : String
    , url : String
    }


type Msg
    = PersonsLoaded (Result Http.Error (List Person))
    | SelectedPersonLoaded (Result Http.Error Person)
    | OnPersonClick String
