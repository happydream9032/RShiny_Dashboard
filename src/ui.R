fluidPage(
  shiny::singleton(
    shiny::tags$head(
      tags$link(rel = "stylesheet", href = "styles.css"),
      tags$link(rel = "stylesheet", href = "snackbar.css"),
      tags$script(src="snackbar.js"),
      tags$script(src="https://www.gstatic.com/firebasejs/5.7.0/firebase-app.js"),
      tags$script(src="https://www.gstatic.com/firebasejs/5.7.0/firebase-auth.js"),
      shiny::tags$script(src="sof-auth.js")
    )
  ),

  # load shinyjs on
  shinyjs::useShinyjs(),

  source("components/login/sign-in.R", local = TRUE)$value,
  source("components/login/register.R", local = TRUE)$value,
  source("components/login/verify-email.R", local = TRUE)$value,

  source("components/pages/main.R", local = TRUE)$value,
)

