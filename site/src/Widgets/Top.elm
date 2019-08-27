module Widgets.Top exposing (topNav)

import Element exposing (Element, centerY, link, padding, spacing, text, wrappedRow)
import Msg exposing (Msg)


topNav : Element Msg
topNav =
    wrappedRow [ spacing 30, padding 30, centerY ]
        [ link []
            { url = "/about"
            , label = text "about"
            }
        , link
            []
            { url = "/blog"
            , label = text "blog"
            }
        ]
