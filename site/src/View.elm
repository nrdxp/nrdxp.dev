module View exposing (view)

import Browser exposing (Document)
import Element exposing (column, fill, layout, width)
import Element.Font as Font
import Model exposing (Model)
import Msg exposing (Msg)
import Pages.Logo exposing (logoText)
import Route exposing (toRoute)
import Widgets.Top exposing (topNav)


view : Model -> Document Msg
view model =
    let
        pathName =
            String.dropLeft 1 model.url.path

        currentView =
            case toRoute model.url of
                Nothing ->
                    logoText <| "Sorry, '" ++ pathName ++ "' is not a thing here."

                Just Route.About ->
                    logoText "Under developement; coming soon!"

                Just Route.Blog ->
                    logoText "Tasties coming your way soon!"
    in
    { title = "nrdxp : " ++ pathName
    , body =
        [ layout [ Font.family [ Font.sansSerif ] ] <|
            column [ width fill ] [ topNav, currentView ]
        ]
    }
