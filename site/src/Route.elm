module Route exposing (Route(..), toRoute)

import Url exposing (Url)
import Url.Parser exposing (Parser, map, oneOf, parse, s, top)


type Route
    = About
    | Blog


route : Parser (Route -> a) a
route =
    oneOf
        [ map About top
        , map About (s "about")
        , map Blog (s "blog")
        ]


toRoute : Url -> Maybe Route
toRoute url =
    parse route url
