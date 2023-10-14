library(shiny)

fluidPage(
  radioButtons("radio", h3("Radio buttons"),
               choices = list("Choice 1" = 1, "Choice 2" = 2,
                              "Choice 3" = 3),selected = 1)
)