port module Ports exposing (mathRendered, renderMath)

-- Send math expression to JS for rendering
port renderMath : String -> Cmd msg

-- Receive SVG result from JS
port mathRendered : (String -> msg) -> Sub msg
