module Pages.Logo exposing (logoText)

import Element
    exposing
        ( Element
        , centerX
        , column
        , fill
        , image
        , maximum
        , padding
        , paragraph
        , text
        , width
        )
import Element.Font as Font


logoText : String -> Element msg
logoText subtext =
    column [ width fill, padding 30 ]
        [ image
            [ centerX
            , width <| maximum 400 fill
            ]
            { src = "logo.svg"
            , description = "logo"
            }
        , paragraph [ Font.bold, Font.size 18, centerX, padding 30 ] <|
            [ text subtext ]
        ]
