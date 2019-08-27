module Model exposing (Model)

import Browser.Navigation as Nav
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url
    , flags : ()
    }
