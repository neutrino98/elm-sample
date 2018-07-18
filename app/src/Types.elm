module Types exposing (..)

import Http exposing (..)
import Navigation exposing (Location)


type alias Model =
    { plist : List Person
    , currentPerson : Person
    , error : Maybe String
    , currentRoute : Route
    , loading : Bool
    }


type alias Person =
    { name : String
    , height : String
    , mass : String
    , gender : String
    , url : String
    }


type Msg
    = PersonsFetch
    | PersonsLoaded (Result Http.Error (List Person))
    | SelectedPersonLoaded (Result Http.Error Person)
    | OnPersonClick String
    | LocationChanged Location



--| Loading


type Route
    = LandingPageRoute
    | PersonRoute String
    | NotFoundRoute
