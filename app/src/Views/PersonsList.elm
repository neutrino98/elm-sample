module Views.PersonsList exposing (..)

import Data.Person exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

type Msg 
    = OnClickUser 


renderPerson: Person -> Html msg
renderPerson person = 
    tr [style [ ( "text-align", "center" ) ]]
    [ td []
        [ text person.name ]
    
    , td []
        [ text person.height ]
   
    , td []
        [ text person.mass ]
    
    , td []
        [ text person.gender ]
    
    ]




personsList : List Person -> Html msg 
personsList persons =
    div []
        [ h3 []
            [ text "Persons list:" ]
        , table [ style [ ( "width", "100%" ) ] ]
            ([ tr []
                [ th []
                    [ text "name" ]
                , th []
                    [ text "height" ]
                , th []
                    [ text "mass" ]
                , th []
                    [ text "gender" ]
                
                ] 
            ] ++  List.map renderPerson persons)
        ]



{-
<div>
    <h3>Persons list:</h3>
    <table style="width: 100%">
        <tr>
            <th>name</th>
            <th>height</th>
            <th>mass</th>
            <th>gender</th>
            
        </tr>
    </table>
</div>
-}




    