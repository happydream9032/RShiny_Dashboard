library(shiny)
library(shinydashboard)

hidden(fluidRow(
  id = "main",
  ui <- dashboardPage(
    dashboardHeader(title = "Dashboard", 
                    tags$li(class = "dropdown", id = "submit_sign_out",style = "font-size : 13px; color: white; margin-top: 15px; margin-right: 10px",class = "pull-right",
                                                 tags$p("Sign Out"))
                    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem(" Home", tabName = "home", icon = icon("home")),
        menuItem(" Internal Analytics", icon = icon("chart-simple"), startExpanded = TRUE,
                 menuSubItem("Sales", tabName = "sales"),
                 menuSubItem("Review", tabName = "review")),
        menuItem(" External Analytics", icon = icon("chart-line"), startExpanded = TRUE,
            menuSubItem("Basic", tabName = "basic"),
            menuSubItem("AI", tabName = "ai")),
        menuItem(" Bot", icon = icon("android"), startExpanded = TRUE,
                 menuSubItem("Jumpers", tabName = "jumpers"),
                 menuSubItem("Toppers", tabName = "toppers"),
                 menuSubItem("Pricers", tabName = "pricers"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "home",
          h2("Home Tab"),
          p("This is the home tab content."),
          column(
            12,
            div(
              style = "padding: 50px",
              DT::DTOutput("user_out"),
            )
          )
        ),
        tabItem(tabName = "sales",
            h2("Internal Sales Analytics"),
            p("This is the internal sales analytics tab content.")
        ),
        tabItem(tabName = "review",
                h2("Internal review Analytics"),
                p("This is the internal review analytics tab content.")
        ),
        tabItem(tabName = "basic",
            h2("External Basic Analytics"),
            tabBox(
              title = NULL, width = 12,
              # The id lets us use input$tabset1 on the server to find the current tab
              id = "tabset1", height = "200px",
              tabPanel("Overview", "Overview tab"),
              tabPanel("Calculator", source("components/pages/external_analytics/basic/calculator/calculator_ui.R")$value)
            )
        ),
        tabItem(tabName = "ai",
                h2("External AI Analytics"),
                tabBox(
                  title = NULL, width = 12,
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "200px",
                  tabPanel("Segments", "Segments tab"),
                  tabPanel("Foo", "Foo tab")
                )
        ),
        tabItem(tabName = "jumpers",
            h2("Jumpers Bot"),
            p("This is the jumpers bot tab content.")
        ),
        tabItem(tabName = "toppers",
                h2("Toppers Bot"),
                p("This is the toppers bot tab content.")
        ),
        tabItem(tabName = "pricers",
                h2("Pricers Bot"),
                p("This is the pricers bot tab content.")
        )
      )
    )
  )
))


