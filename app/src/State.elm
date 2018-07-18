module State exposing (..)

import Navigation exposing (Location)
import Request.Person as PersonRequest exposing (..)
import Routing exposing (..)
import Task exposing (Task)
import Types exposing (..)
import Utils exposing (..)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.extractRoute location
        cmd = case currentRoute of 
                LandingPageRoute -> 
                    Task.attempt PersonsLoaded PersonRequest.getPersons
                PersonRoute str -> 
                    Task.attempt SelectedPersonLoaded (PersonRequest.getPersonById ("https://swapi.co/api/people/" ++ str))
                NotFoundRoute -> 
                    Cmd.none    
    in
    ( initialModel currentRoute, cmd)


emptyPerson : Person
emptyPerson =
    Person "" "" "" "" ""


initialModel : Route -> Model
initialModel route =
    { plist = []
    , currentPerson = emptyPerson
    , error = Nothing
    , currentRoute = route
    , loading = True
    , inputPerson = emptyPerson
    }

updatePersonField : String -> String -> (String -> Person -> Person) -> Model -> (Model, Cmd Msg)
updatePersonField id newValue updateFunction model =
    let 
        getPersonId person =
            case getIdFromUrl person.url 2 of 
                Just s ->
                    s 
                Nothing ->
                          Debug.crash "!!!"

        updatePerson person =
            if id == getPersonId person then 
               updateFunction newValue person
            else person
    in
    ({ model | currentPerson = updatePerson model.currentPerson }, Cmd.none) 


setName : String -> Person -> Person
setName newName person = 
    ({ person | name = newName })


setHeight : String -> Person -> Person
setHeight newHeight person = 
    ({ person | height = newHeight })


setMass : String -> Person -> Person 
setMass newMass person = 
    ({ person | mass = newMass })


setGender : String -> Person -> Person
setGender newGender person = 
    ({ person | gender = newGender })

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PersonsFetch ->
            ( { model | plist = [] }, Task.attempt PersonsLoaded PersonRequest.getPersons )

        PersonsLoaded (Ok list) ->
            ( { model | plist = list, loading = False }, Cmd.none )

        PersonsLoaded (Err error) ->
            ( { model | error = Just (toString error), loading = False }, Cmd.none )

        SelectedPersonLoaded (Ok person) ->
            ( { model | currentPerson = person, loading = False }, Cmd.none )

        SelectedPersonLoaded (Err error) ->
            ( { model | error = Just (toString error), loading = False }, Cmd.none )

        OnPersonClick url ->
            let
                id =
                    case getIdFromUrl url 2 of
                        Nothing ->
                            Debug.crash "!!!"

                        Just s ->
                            s
            in
            ( { model
                | loading = True
              }
            , Cmd.batch
                [ Task.attempt SelectedPersonLoaded (PersonRequest.getPersonById url)
                , Navigation.newUrl ("/people/" ++ id)
                ]
            )

        LocationChanged location ->
            let
                nextRoute =
                    Routing.extractRoute location

                str =
                    getIdFromUrl model.currentPerson.url 2

                command =
                    case nextRoute of
                        LandingPageRoute -> 
                            Task.attempt PersonsLoaded PersonRequest.getPersons    

                        _ ->
                            Cmd.none

                сurrPerson = 
                    if nextRoute == LandingPageRoute then
                        emptyPerson
                    else
                        model.currentPerson
            in
            ( { model
                | currentRoute = nextRoute
                , currentPerson = сurrPerson                    
                , loading = True        
              }
            , command
            )

        UpdatePersonName personId newName -> 
            updatePersonField personId newName setName model

        UpdatePersonHeight personId newHeight -> 
            updatePersonField personId newHeight setHeight model

        UpdatePersonGender personId newGender -> 
            updatePersonField personId newGender setGender model

        UpdatePersonMass personId newMass -> 
            updatePersonField personId newMass setMass model

        OnNameInput name -> 
            let
                person = model.inputPerson
                iu = { person | name = name}
            in
            ({ model | inputPerson = iu }, Cmd.none )

        OnHeightInput height -> 
            let 
                person = model.inputPerson
                iu = { person | height = height}
            in                                               
            ({ model | inputPerson = iu }, Cmd.none )

        OnMassInput mass ->
            let
                person = model.inputPerson
                iu = { person | mass = mass}
            in 
            ({ model | inputPerson = iu }, Cmd.none )

        OnGenderInput gender ->
            let
                person = model.inputPerson
                iu = { person | gender = gender}
            in  
            ({ model | inputPerson = iu }, Cmd.none )
        
        
        -- _ -> 
        --    (model, Cmd.none)        