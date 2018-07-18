module Types exposing (..)

import Http exposing (..)
import Navigation exposing (Location)


type alias Model =
    { plist : List Person
    , currentPerson : Person
    , error : Maybe String
    , currentRoute : Route
    , loading : Bool
    , inputPerson: Person
    }


type alias Person =
    { name : String
    , height : String
    , mass : String
    , gender : String
    , url : String
    }


type PersonId = 
    String


type Msg
    = PersonsFetch
    | PersonsLoaded (Result Http.Error (List Person))
    | SelectedPersonLoaded (Result Http.Error Person)
    | OnPersonClick String
    | LocationChanged Location
    | UpdatePersonName String String
    | UpdatePersonHeight String String
    | UpdatePersonMass String String 
    | UpdatePersonGender String String
    | OnNameInput String 
    | OnHeightInput String 
    | OnMassInput String 
    | OnGenderInput String 


--| Loading


type Route
    = LandingPageRoute
    | PersonRoute String
    | NotFoundRoute
