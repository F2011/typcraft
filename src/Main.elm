module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Json.Encode
import Ports


type alias Model =
    { expression : String
    , svg : String
    }


type Msg
    = ExpressionChanged String
    | SvgRendered String


init : () -> ( Model, Cmd Msg )
init _ =
    let
        initialExpr =
            "F_g = (G m_1 m_2) / (r^2)"
    in
    ( { expression = initialExpr, svg = "" }
    , Ports.renderMath initialExpr
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ExpressionChanged newExpr ->
            ( { model | expression = newExpr }
            , Ports.renderMath newExpr
            )

        SvgRendered svgContent ->
            ( { model | svg = svgContent }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ style "font-family" "system-ui, sans-serif"
        , style "max-width" "800px"
        , style "margin" "2rem auto"
        , style "padding" "1rem"
        ]
        [ h1 [ style "margin-bottom" "1rem" ] [ text "typcraft" ]
        , div [ style "margin-bottom" "1rem" ]
            [ label [ style "display" "block", style "margin-bottom" "0.5rem" ]
                [ text "Typst math expression:" ]
            , input
                [ type_ "text"
                , value model.expression
                , onInput ExpressionChanged
                , style "width" "100%"
                , style "padding" "0.5rem"
                , style "font-size" "1rem"
                , style "font-family" "monospace"
                , style "box-sizing" "border-box"
                ]
                []
            ]
        , div [ style "margin-top" "1rem" ]
            [ label [ style "display" "block", style "margin-bottom" "0.5rem" ]
                [ text "Rendered output:" ]
            , div
                [ style "border" "1px solid #000"
                , style "padding" "1rem"
                , style "min-height" "100px"
                , style "background" "#ffffff"
                , style "display" "flex"
                , style "align-items" "center"
                , style "justify-content" "center"
                , id "svg-output"
                ]
                []
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.mathRendered SvgRendered


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
