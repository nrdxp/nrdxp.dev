module Main exposing (main)

import Browser exposing (application)
import Browser.Navigation as Nav
import Model exposing (Model)
import Msg exposing (Msg)
import Route exposing (Route(..))
import Url exposing (Url)
import Url.Builder exposing (Root(..), custom)
import View exposing (view)



---- Initial Model ----


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    case url.path of
        -- always redirect root directory to homepage
        -- keep the fragment but drop any queries
        "/" ->
            ( Model key url flags
            , Nav.replaceUrl key
                (custom Absolute [ "about" ] [] url.fragment)
            )

        _ ->
            ( Model key url flags, Cmd.none )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        Msg.UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )



---- PROGRAM ----


main : Program () Model Msg
main =
    application
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = Msg.UrlChanged
        , onUrlRequest = Msg.LinkClicked
        }
