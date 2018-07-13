module Request.Helpers exposing(..)

apiUrl: String -> String 
apiUrl parametrs =
        "https://swapi.co/api" ++ parametrs

