module Main exposing (..)

import Date exposing (..)
import Html exposing (Html, h1, text)
import Plot exposing (..)

-- MODEL

type alias Model =
  {
  }

-- INIT

init : (Model, Cmd Message)
init =
  (Model, Cmd.none)

-- VIEW

view : Model -> Html Message
view model =
  viewSeries
     [ line (List.map (\{ x, y } -> circle x y)) ]
     [ { x = dateToFloat "2018-01-01", y = 1 }
     , { x = dateToFloat "2018-01-02", y = 2 }
     , { x = dateToFloat "2018-01-03", y = 3 }
     , { x = dateToFloat "2018-01-04", y = 4 }
     , { x = dateToFloat "2018-01-05", y = 5 }
     , { x = dateToFloat "2018-01-08", y = 19 }
     ]

dateToFloat : String -> Float
dateToFloat date =
  case Date.fromString date of
    Ok dateObject ->
      Date.toTime dateObject
    Err msg ->
      0

-- MESSAGE

type Message
  = None

-- UPDATE

update : Message -> Model -> (Model, Cmd Message)
update message model =
  (model, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Message
subscriptions model =
  Sub.none

-- MAIN

main : Program Never Model Message
main =
  Html.program
    {
      init = init,
      view = view,
      update = update,
      subscriptions = subscriptions
    }
