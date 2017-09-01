source("global.R")


## ########################################################################## ##
##                                 UI                                         ##
## ########################################################################## ##
ui <- dashboardPage(
  title = "LED 2017 - RLumShiny",
  
  ## ------------------------------------------------------------------------ ##
  ##                             HEADER
  ## ------------------------------------------------------------------------ ##
  dashboardHeader(title = div("", img(src = "img/LED2017_Logo_alpha.png", height = "50px", width = "83px")),
                  tags$li(a(p("RLumShiny - A graphical user interface for the R Package ’Luminescence’", class = "header-title",
                              style = "margin-top:  5px; margin-bottom: 0px; margin-right: 30px;"),
                            style = "padding-top: 10px; padding-bottom: 10px; font-size: 20px;"),
                          class = "dropdown"),
                  tags$li(a(href = "http://www.geographie.uni-koeln.de/",
                            img(src = "img/UoC_Logo_short.png", height = "30px", width = "30px"),
                            style = "padding-top: 10px; padding-bottom: 0px;"),
                          class = "dropdown"),
                  tags$li(class = "dropdown",
                          actionLink("aboutBtn", "", icon = icon("info-circle", class = "info-icon")))),
  
  ## ------------------------------------------------------------------------ ##
  ##                             SIDEBAR
  ## ------------------------------------------------------------------------ ##
  dashboardSidebar(
    sidebarMenu(id = "tabs",
                
                ## SIDEBAR MENU TABS
                ## -------------------------------------------------------------
                sidebarMenu(
                  id = "sidebar", 
                  br(),
                  div(align = "center", p("Main")), 
                  menuItem("Introduction", 
                           icon = icon("play"), tabName = "intro", startExpanded = TRUE,
                           menuSubItem(HTML("The p<b>R</b>oblem"), icon = icon("question-circle-o"), tabName = "intro_1"),
                           menuSubItem("A solution", icon = icon("lightbulb-o"), tabName = "intro_2")),
                  
                  menuItem("The 'shiny' framework", icon = icon("star"), tabName = "shiny", startExpanded = TRUE,
                           menuSubItem("Hello Shiny!",  tabName = "shiny_1"),
                           menuSubItem("Widgets", tabName = "shiny_2"),
                           menuSubItem("Deploying apps", tabName = "shiny_3")),
                  
                  
                  menuItem(HTML("<span class='highlight-sidebar'>GUI</span> - <span class='sidebar-small'>'RLumShiny' package</span>"), icon = icon("television"), tabName = "shinylum",
                           startExpanded = TRUE,
                           menuSubItem("Motivation & Content", tabName = "shinylum_1"),
                           menuSubItem("Extending 'shiny'", tabName = "shinylum_2"),
                           menuSubItem("Applications", tabName = "shinylum_3")),
                  menuItem("References", icon = icon("book"), tabName = "references"), 
                  
                  tags$hr(id = "qr_hr"),
                  
                  div(align = "center", p("Supplement")),
                  
                  menuItem(HTML("<span class='highlight-sidebar'>CLI</span> - <span class='sidebar-small'>'Luminescence' package</span>"), icon = icon("terminal"), tabName = "lum",
                           startExpanded = FALSE,
                           menuSubItem("Why another R package?", tabName = "lum_1"),
                           menuSubItem("Current content", tabName = "lum_2"),
                           menuSubItem("Reception", tabName = "lum_3")),
                  
                  menuItem("Get started!", icon = icon("rocket"), tabName = "getstarted")
                )
                ## SIDEBAR MISC INFORMATION
                ## -------------------------------------------------------------
                
                # tags$hr(id = "qr_hr"),
                
                
                
                # tags$p(id = "qr_presentation_text", align = "center",
                #        HTML("Watch this presentation on </br> your smartphone or tablet!")),
                # tags$p(id = "qr_presentation", align = "center",
                #        tags$img(src = "img/qr_presentation_tablet.png", style = "width:100%;", border = 0)
                # )
    )
  ),
  
  ## ------------------------------------------------------------------------ ##
  ##                             BODY
  ## ------------------------------------------------------------------------ ##
  dashboardBody(
    
    # add favicon
    tags$head(tags$link(rel="icon", type="image/ico", href="favicon.ico")),
    
    ## Include JS and CSS 
    useShinyjs(),
    extendShinyjs("www/js/keyevents.js"),
    tags$header( 
      tags$script(src = "js/fullscreen.js"),
      tags$script("$(function(){ $('.nav-tabs').addClass('nav-justified') });"),
      # remove this class again for panels with too many tabs
      tags$script("$(function(){ $('#shinylum_3').removeClass('nav-justified') });"),
      tags$script("$(function(){ $('#lum_1').removeClass('nav-justified') });"),
      tags$script("$(function(){ $('#shiny_1').removeClass('nav-justified') });"),
      tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
    ),
    tabItems(
      
      ## INTRODUCTION
      ## ---------------------------------------------------------------------------
      
      ## SLIDE  1 (intro, the pRoblem)
      ## ----------------
      tabItem("intro_1",
              tabBox(width = 12,
                     id = "intro_1", selected = "intro_1_tab1",
                     
                     tabPanel(tags$em(tags$b("RLumShiny")), 
                              value = "intro_1_tab1",
                              div(align = "center",
                                  tags$hr(),
                                  tags$p(id = "title", title),
                                  tags$p(id = "authors", authors),
                                  tags$hr()
                              ),
                              div(align = "center",
                                  do.call(HTML, affils)
                              ),
                              tags$hr(),
                              div(align = "center",
                                  tags$img(src = "img/interface-layout.png", style = "width:60%;", border = 0),
                                  div(align = "right", "Burow et al. (2016)")
                              )
                     ),
                     
                     tabPanel(HTML(paste("Working with", tags$b("R"), "- ", tags$u("Expectation", style = "color:green;"))),
                              value = "intro_1_tab2",
                              fluidRow(width = 12,
                                       column(width = 1,
                                              actionButton("problem1", "", icon = icon("info-circle"), class = "info-btn")),
                                       column(width = 11,
                                              div(align = "left", 
                                                  header_quote("Working with the command-line interface (CLI) of R can be tedious at best and overwhelming at worst.", "An anonymous use<b>R</b>", 
                                                               align = "right")
                                              )
                                       )
                              ),
                              tags$img(src = "img/expectation.gif", style = "width:100%;", border = 0)
                     ),
                     
                     tabPanel(HTML(paste("Working with", tags$b("R"), "- ", tags$u("Reality", style = "color:darkred;"))),
                              value = "intro_1_tab3",
                              fluidRow(width = 12,
                                       column(width = 1,
                                              actionButton("problem2", "", icon = icon("info-circle"), class = "info-btn")),
                                       column(width = 11,
                                              div(align = "left", 
                              header_quote("Working with the command-line interface (CLI) of R can be tedious at best and overwhelming at worst.", "An anonymous use<b>R</b>", 
                                           align = "right")
                                              )
                                       )
                              ),
                              tags$img(src = "img/reality.gif", style = "width:100%;", border = 0)
                     )
              )
      ),
      
      ## SLIDE  2 (intro, a solution)
      ## ----------------
      tabItem("intro_2",
              fluidRow(
                box(width = 12, solidHeader = FALSE,
                    title = NULL,
                    # header
                    fluidRow(width = 12,
                             column(width = 1,
                                    actionButton("solution", "", icon = icon("info-circle"), class = "info-btn")),
                             column(width = 11,
                                    div(align = "left", 
                    header_quote("For users with little or no experience with command-lines (CLI) a graphical user 
                                        interface (GUI) offers intuitive access that counteracts the perceived steep learning 
                                        curve of a CLI", "Burow et al. (2016)")
                                    )
                             )
                    ),
                    # left side
                    box(width = 6, status = "warning", solidHeader = FALSE, collapsible = TRUE, collapsed = FALSE,
                        title = tagList(icon("bar-chart"), HTML("&nbsp;&nbsp;Creating a plot: a common task in <b>R</b>")),
                        actionLink("intro_2_task", "Show text"),
                        htmlOutput("intro_2_task"),
                        plotOutput("solution_plot")),
                    
                    # right side
                    #  - tab 1
                    tabBox(id = "intro_2", selected = "intro_2_tab1",
                           tabPanel(title = tagList(icon("terminal"), HTML("&nbsp;&nbsp;CLI")), width = 6,
                                    value = "intro_2_tab1",
                                    actionLink("intro_2_code", "Show text"),
                                    htmlOutput("intro_2_code"),
                                    htmlOutput("solution_plot_code")),
                           
                           #  - tab 2
                           tabPanel(title = tagList(icon("television"), HTML("&nbsp;&nbsp;GUI")), width = 6,
                                    value = "intro_2_tab2",
                                    actionLink("intro_2_shiny1", "Show text"),
                                    htmlOutput("intro_2_shiny1"),
                                    fluidRow(width = 12,
                                             column(width = 3,
                                                    checkboxInput("solution_rotate", "Rotate", FALSE)),
                                             column(width = 3, 
                                                    checkboxInput("solution_kde", "KDE", TRUE)),
                                             column(width = 3,
                                                    checkboxInput("solution_hist", "Histogram", FALSE)),
                                             column(width = 3, 
                                                    checkboxInput("solution_dots", "Dots", FALSE))
                                    ),
                                    sliderInput("solution_ratio", "Plot ratio", min = 0, max = 1, value = 0.75),
                                    sliderInput("solution_cex", "Scaling", min = 0, max = 1, value = 0.95),
                                    actionLink("intro_2_shiny2", "Show text"),
                                    htmlOutput("intro_2_shiny2")
                           ))
                )
                
                
              )
              
      ),
      ## SHINY FRAMEWORK
      ## ---------------------------------------------------------------------------
      
      ## SLIDE  1 (shiny, hello shiny)
      ## ----------------
      tabItem("shiny_1",
              fluidRow(
                tabBox(id = "shiny_1", selected = "shiny_1_tab1",
                       title = actionButton("hello_shiny_modal", "", icon = icon("info-circle"), class = "info-btn"),
                       width = 6,
                       tabPanel("Ui.R", value = "shiny_1_tab1", htmlOutput("helloshiny_code_ui")),
                       tabPanel("Server.R", value = "shiny_1_tab2", htmlOutput("helloshiny_code_server"))
                ),
                box(width = 6, status = "success", solidHeader = FALSE,
                    title = "Hello Shiny!",
                    plotOutput("helloshiny"),
                    sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30, animate = TRUE)
                )
              )
      ),#shiny_1
      
      ## SLIDE  2 (shiny, widgets)
      ## ----------------
      tabItem("shiny_2",
              fluidRow(
                column(width = 6,
                       box(width = 12, status = "warning", solidHeader = FALSE, collapsible = TRUE,
                           title = tags$b("Input Widgets"),
                           actionLink("shiny_2_widgets", "Show text"),
                           htmlOutput("shiny_2_widgets"),
                           fluidRow(width = 12,
                                    column(6,
                                           actionButton("actionBtn", "Do NOT press!", class = "btn btn-danger",
                                                        style = "color: white;", width = "100%")
                                    ),
                                    column(6,
                                           checkboxInput("checkbox", "Check this out!", value = FALSE)
                                    )
                           ),
                           fluidRow(width = 12,
                                    column(6, 
                                           checkboxGroupInput("checkboxGroup", "Check us out!", 
                                                              selected = c("Blue", "Green", "Red"),
                                                              choices = list("Choice 1" = "Blue", 
                                                                             "Choice 2" = "Green",
                                                                             "Choice 3" = "Red"))
                                    ),
                                    column(6, 
                                           dateInput("dateInput", "Date input"))
                           ),
                           fluidRow(width = 12,
                                    column(6, 
                                           dateRangeInput("dateRange", "Date range") 
                                    ),
                                    column(6, 
                                           fileInput("fileInput", "File input"))
                           ),
                           fluidRow(width = 12,
                                    column(6,
                                           numericInput("numericInput", "Numeric input", value = 42) 
                                    ),
                                    column(6, 
                                           radioButtons("radioButtons", "Radio buttons", 
                                                        choices = list("Choice 1" = 1,
                                                                       "Choice 2" = 2,
                                                                       "Choice 3" = 3)))
                           ),
                           fluidRow(width = 12,
                                    column(6, 
                                           selectInput("selectBox", "Select input", 
                                                       choices = list("Choice 1" = 16,
                                                                      "Choice 2" = 1)) 
                                    ),
                                    column(6, 
                                           sliderInput("slider", "Slider", 
                                                       min = 1, max = 10, value = 2, step = 1))
                           ),
                           fluidRow(width = 12,
                                    column(6, 
                                           sliderInput("sliderRange", "Slider range", 
                                                       min = 0, max = 100, value = c(0, 100), step = 5)
                                    ),
                                    column(6, 
                                           textInput("textInput", "Text input", placeholder = "Enter text...")
                                    )
                           )
                       )
                ),
                
                # right side
                column(width = 6,
                       tabBox(width = 12,
                              title = NULL,
                              id = "shiny_2",
                              selected = "shiny_2_tab1",
                              # right side
                              #  - tab 1
                              tabPanel(title = tagList(icon("line-chart"), HTML("&nbsp;&nbsp;Plot")),
                                       value = "shiny_2_tab1",
                                       plotOutput("widget_plot")),
                              # right side
                              #  - tab 1
                              tabPanel(title = tagList(icon("terminal"), HTML("&nbsp;&nbsp;Console")),
                                       value = "shiny_2_tab2",
                                       fluidRow(width = 12, 
                                                column(width = 2, "Action button"),
                                                column(width = 10, verbatimTextOutput("widget_code_actionBtn"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Checkbox"),
                                                column(width = 10, verbatimTextOutput("widget_code_checkbox"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Checkbox group"),
                                                column(width = 10, verbatimTextOutput("widget_code_checkboxGroup"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Date input"),
                                                column(width = 10, verbatimTextOutput("widget_code_dateInput"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Date range"),
                                                column(width = 10, verbatimTextOutput("widget_code_dateRange"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "File input"),
                                                column(width = 10, verbatimTextOutput("widget_code_fileInput"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Numeric input"),
                                                column(width = 10, verbatimTextOutput("widget_code_numericInput"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Radio buttons"),
                                                column(width = 10, verbatimTextOutput("widget_code_radioButtons"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Select box"),
                                                column(width = 10, verbatimTextOutput("widget_code_selectBox"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Slider"),
                                                column(width = 10, verbatimTextOutput("widget_code_slider"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "Slider range"),
                                                column(width = 10, verbatimTextOutput("widget_code_sliderRange"))
                                       ),
                                       fluidRow(width = 12, 
                                                column(width = 2, "textInput"),
                                                column(width = 10, verbatimTextOutput("widget_code_textInput"))
                                       )
                              )
                       )
                )
              )
      ),#shiny2
      
      ## SLIDE  3 (shiny, deploy)
      ## ----------------
      tabItem("shiny_3",
              box(title = NULL, width = 12,
                  fluidRow(width = 12,
                           column(width = 1,
                                  actionButton("info_deploy", "", icon = icon("info-circle"), class = "info-btn")),
                           column(width = 11,
                                  div(align = "left", 
                                      header_quote("Sharing shiny applications is simple and there are multiple ways to do so!", "An enthuastic sales representative", 
                                                   align = "right")
                                  )
                           )
                  ),
                  
                  tabBox(width = 12, title = NULL,
                         id = "shiny_3", selected = "shiny_3_tab1",
                         tabPanel(title = tagList(icon("cloud"), "Service provider"),
                                  value = "shiny_3_tab1",
                                  actionLink("shiny_3_deploy1", "Show text"),
                                  htmlOutput("shiny_3_deploy1"),
                                  tags$img(src = "img/deploy_shiny_shinyapps.io.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel(title = tagList(icon("cloud"), "Shiny Server"),
                                  value = "shiny_3_tab2",
                                  actionLink("shiny_3_deploy2", "Show text"),
                                  htmlOutput("shiny_3_deploy2"),
                                  tags$img(src = "img/deploy_shiny_shiny-server.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel(title = tagList(icon("desktop"), "Run locally"),
                                  value = "shiny_3_tab3",
                                  actionLink("shiny_3_deploy3", "Show text"),
                                  htmlOutput("shiny_3_deploy3"),
                                  tags$img(src = "img/deploy_shiny_local.png", style = "width:100%;", border = 0)
                         )
                  )
              )
      ),#shiny_3
      
      ## RLUMSHINY
      ## ---------------------------------------------------------------------------
      
      ## SLIDE 1 (rlumshiny, motivation & content)
      ## ----------------
      tabItem("shinylum_1",
              fluidRow(width = 12,
                       column(width = 4,
                              div(align = "center", HTML("<h2>&zwnj;</h2>")),
                              hr(),
                              box(width = 12, status = "primary", solidHeader = TRUE, collapsible = FALSE,
                                  title = HTML("Motivation"),
                                  tags$p(style = "font-size: 20pt;",
                                         tags$ul(class = "lumlu",
                                                 tags$li(class = "lumli", HTML("Make <code>Luminescence</code> more accessible</br></br>")),
                                                 tags$li(class = "lumli", HTML("Streamline common tasks </br>(eg. plotting data)</br></br>")),
                                                 tags$li(class = "lumli", HTML("Lay the foundation for a common analysis platform </br>(see Shiny-Server)</br></br>"))
                                         )
                                  ),
                                  actionLink("shinylum_1_motivation", "Show text"),
                                  htmlOutput("shinylum_1_motivation")
                              )
                       ),
                       column(width = 8,
                              div(align = "center", HTML("<h2>Current content of <code>RLumShiny</code> (v0.2.1)</h2>")),
                              hr(),
                              tabBox(title = NULL,
                                     width = 12, id = "shinylum_1", selected = "shinylum_1_tab1",
                                     tabPanel("Applications",
                                              value = "shinylum_1_tab1",
                                              actionLink("shinylum_1_apps", "Show text"),
                                              htmlOutput("shinylum_1_apps"),
                                              dataTableOutput("rlumshiny_app")),
                                     tabPanel("Functions",
                                              value = "shinylum_1_tab2",
                                              actionLink("shinylum_1_funs", "Show text"),
                                              htmlOutput("shinylum_1_funs"),
                                              dataTableOutput("rlumshiny_fun")
                                     ))
                       )
              )
      ),
      
      ## SLIDE 2 (rlumshiny, extending shiny)
      ## ----------------
      tabItem("shinylum_2",
              
              box(width = 12, solidHeader = FALSE,
                  title = NULL,
                  fluidRow(width = 12,
                           column(width = 1,
                                  actionButton("extending_shiny", "", icon = icon("info-circle"), class = "info-btn")),
                           column(width = 11,
                                  div(align = "left", 
                  header_quote("[...] 'shiny' is based on  modern programming and markup languages, which allows
                                easy integration of existing JavaScript libraries, thus greatly
                                increasing the capabilities of 'shiny' and <b>R</b> itself.", "Burow et al. (2016)")
                                  )
                           )
                  ),
                  box(width = 4, status = "primary", solidHeader = FALSE, collapsible = TRUE, collapsed = FALSE,
                      title = "RLumShiny::jscolorInput()",
                      tags$p(HTML(paste(
                        "<code>jscolorInput(inputId, label, value, position = 'bottom',
                        color = 'transparent', mode = 'HSV', slider = TRUE, close = FALSE)</code>",
                        "</br></br>Binding to the JavaScript library jscolor (<a href = '#'>http://jscolor.com/</a>)
                         to create a JSColor (Javascript/HTML Color Picker) widget."
                      ))),
                      jscolorInput("jscolorInput"),
                      verbatimTextOutput("jscolorInput"),
                      plotOutput("jscolor_plot", height = "150px")
                  ),
                  box(width = 4, status = "primary", solidHeader = FALSE, collapsible = TRUE, collapsed = FALSE,
                      title = "RLumShiny::popover()",
                      tags$p(HTML(paste(
                        "<code>popover(title, content, header = NULL, html = TRUE,
                        class = 'btn btn-default', placement = c('right', 'top', 'left',
                        'bottom'), trigger = c('click', 'hover', 'focus', 'manual'))</code>",
                        "</br></br>Create a bootstrap button with popover, i.e. a small overlays of content for housing secondary information."
                      ))),
                      popover("Click me!", content = HTML("Some amazing content."), html = TRUE, header = "Great success!")
                  ),
                  box(width = 4, status = "primary", solidHeader = FALSE, collapsible = TRUE, collapsed = FALSE,
                      title = "RLumShiny::tooltip()",
                      tags$p(HTML(paste(
                        "<code>tooltip(refId, text, attr = NULL, animation = TRUE, delay = 100, html = TRUE, placement = 'auto', trigger = 'hover')</code>",
                        "</br></br>Create bootstrap tooltips for any HTML element to be used in shiny applications."
                      )
                      )),
                      actionButton("tooltipBtn", "Click me too!"),
                      tooltip("tooltipBtn", text = "Even greater success!", trigger = "click")
                  )
              )
      ),
      
      ## SLIDE 3 (rlumshiny, applications)
      ## ----------------
      tabItem("shinylum_3",
              checkboxInput("online", "Show online applications", FALSE),
              tabBox(title = NULL,
                     id = "shinylum_3", selected = "shinylum_3_tab1",
                     width = 12,
                     tabPanel("Abanico Plot",
                              value = "shinylum_3_tab1",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_AbanicoPlot()</code>"
                              )),
                              uiOutput("abanico")),
                     tabPanel("Histogram",
                              value = "shinylum_3_tab2",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_Histogram()</code>"
                              )),
                              uiOutput("histogram")),
                     tabPanel("KDE",
                              value = c("shinylum_3_tab3"),
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_KDE()</code>"
                              )),
                              uiOutput("kde")),
                     tabPanel("Radial Plot",
                              value = "shinylum_3_tab4",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_RadialPlot()</code>"
                              )),
                              uiOutput("radialplot")),
                     tabPanel("Dose Recovery",
                              value = "shinylum_3_tab5",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_DRTResults()</code>"
                              )),
                              uiOutput("doserecovery")),
                     tabPanel("Cosmic Dose Rate",
                              value = c("shinylum_3_tab6"),
                              tags$p(HTML(
                                "Application for: <code>Luminescence::calc_CosmicDoseRate()</code>"
                              )),
                              uiOutput("cosmic")),
                     tabPanel("Curve Transform.",
                              value = "shinylum_3_tab7",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::CW2pHMi()</code>, <code>CW2pLM()</code>, <code>CW2pLMi()</code>, <code>CW2pPMi()</code>"
                              )),
                              uiOutput("transformCW")),
                     tabPanel("Filter Combinations",
                              value = "shinylum_3_tab8",
                              tags$p(HTML(
                                "Application for: <code>Luminescence::plot_FilterCombinations()</code>"
                              )),
                              uiOutput("filter")),
                     tabPanel("Fast Ratio",
                              value = c("shinylum_3_tab9"),
                              tags$p(HTML(
                                "Application for: <code>Luminescence::calc_FastRatio()</code>"
                              )),
                              uiOutput("fastratio")),
                     tabPanel("Fading Correction",
                              value = c("shinylum_3_tab10"),
                              tags$p(HTML(
                                "Application for: <code>Luminescence::analyse_FadingMeasurement()</code>, <code>calc_FadingCorr()</code>"
                              )),
                              uiOutput("fading"))
              )
      ),#shinylum_3
      
      ## RLUMSHINY
      ## ---------------------------------------------------------------------------
      tabItem("references",
              box(title = NULL, width = 12,
                  dataTableOutput("references"))
      ),
      
      ## RLUMSHINY
      ## ---------------------------------------------------------------------------
      tabItem("lum_1",
              box(width = 12, solidHeader = FALSE,
                  title = NULL,
                  header_quote("<b>R</b> allows the creation of complex and transparent data analysis 
                               routines for experimental protocols that are not available in existing software.", 
                               "Kreutzer et al. (2012)"),        
                  box(width = 6, status = "warning", solidHeader = TRUE, collapsible = TRUE,
                      title = "Why?",
                      tags$p(HTML(
                        "<blockquote class = 'blockquote-reverse'>
                        For routine luminescence dating applications the commonly used [measurement devices] 
                        are bundled with analysis software, such as Viewer or Analyst. These software 
                        solutions are appropriate for most of the regular dating and publication jobs, 
                        and enable assessment of luminescence characteristics and provide basic statistical 
                        data treatment. However, for further statistical analysis and data treatments, 
                        this software may reach its limits. In such cases, open programming languages 
                        are a more appropriate approach.
                        <footer>modified after Kreutzer et al. (2012)</footer>
                        </blockquote>"
                      ))),
                  tabBox(width = 6, title = "Impressions",
                         id = "lum_1",
                         tabPanel("Analyst #1",
                                  tags$p(HTML("Reference: Duller 2015")),
                                  tags$img(src = "img/analyst_1.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel("Analyst #2",
                                  tags$p(HTML("Reference: Duller 2015")),
                                  tags$img(src = "img/analyst_2.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel("Analyst #3",
                                  tags$p(HTML("Reference: Duller 2015")),
                                  tags$img(src = "img/analyst_3.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel("Radial Plot",
                                  tags$p(HTML("Reference: Olley & Reed 2003")),
                                  tags$img(src = "img/radial-plot.png", style = "width:100%;", border = 0)
                         ),
                         tabPanel("RadialPlotter",
                                  tags$p(HTML("Reference: Vermeesch 2009")),
                                  tags$img(src = "img/radialplotter.png", style = "width:100%;", border = 0)
                         )
                  )
              )
              
      ),
      tabItem("lum_2",
              box(width = 4, status = "warning", solidHeader = TRUE, collapsible = TRUE,
                  title = HTML("A potpourri of functions"),
                  tags$p(HTML("Since its release in 2012 the functionality of the <b>R</b> package <code>Luminescence</code> drastically increased.
                              What started with a handful of functions to apply a very specific type of signal
                              analysis and to plot the data is now a collection of >100 functions for all sorts
                              of (non-)specialised tasks.")),
                  plotOutput("rlum_fun_history_plot")
              ),
              box(width = 8, status = "primary", solidHeader = FALSE,
                  title = HTML("Current content of <code>Luminescence</code> (v0.8.0)"),
                  dataTableOutput("lum_functions"))
      ),
      tabItem("lum_3",
              box(width = 4, status = "warning", solidHeader = TRUE, collapsible = TRUE,
                  title = HTML("Statistics"),
                  tags$p(HTML("It is generally hard to measure and keep track of the distribution and reception of
                              the <b>R</b> package <code>Luminescence</code> (or <code>RLumShiny</code>). The official <b>CRAN</b> download statistics,
                              however, may provide at least some indication on how many and where people are using
                              our package. The data you see on the right-hand side are generated from the raw <b>CRAN</b> logs.")),
                  radioButtons("cran_package", "R package", 
                               choices = list("Luminescence" = "luminescence",
                                              "RLumShiny" = "rlumshiny")),
                  radioButtons("cran_category", "Statistic",
                               choices = list("Date" = "date",
                                              "Country" = "country",
                                              "OS" = "os",
                                              "R Version" = "r_version",
                                              "Architecture" = "arch"))),
              box(width = 8, status = "primary", solidheader = TRUE, collapsible = TRUE,
                  title = NULL,
                  plotOutput("cran_plot"))
      ),
      
      
      ## GET STARTED
      ## ---------------------------------------------------------------------------
      tabItem("getstarted",
              box(title = tags$b("A collection of useful resources"), width = 12,
                  tabBox(title = NULL, width = 8,
                         tabPanel(title = HTML("<code>shiny</code>"),
                                  info_table_shiny()
                         ),
                         tabPanel(title = HTML("<code>Luminescence</code>"),
                                  info_table_lum()
                         ),
                         tabPanel(title = HTML("<code>RLumShiny</code>"),
                                  info_table_rlumshiny())
                  ),
                  box(title = HTML("This presentation"), width = 4, status = "warning",
                      solidHeader = TRUE, collapsible = TRUE, collapsed = FALSE,
                      tags$p("The code of this presentation is freely available on", icon("github"),"GitHub"),
                      tags$img(src = "img/qr_github.png", style = "width:100%;", border = 0),
                      div(align = "center", tags$a(id = "github", href = "https://github.com/tzerk/LED2017-RLumShiny", "https://github.com/tzerk/LED2017-RLumShiny")))
              )
      )
      
    ), #tabItems()
    
    ## FOOTER
    ## ---------------------------------------------------------------------------
    tags$div(class = "sticky-footer",
             tags$p(align = "right",
                    HTML("Copyright &copy; 2017 Christoph Burow |  This presentation is provided 'as is' without express or implied warranty.&nbsp;&nbsp;")
             )
    )
  )
)




## ########################################################################## ##
##                                 SERVER                                     ##
## ########################################################################## ##
server <- function(input, output, session) {
  
  values <- reactiveValues(tabs = c("intro_1", "intro_2", 
                                    "shiny_1", "shiny_2", "shiny_3", 
                                    # "lum_1", "lum_2", "lum_3", # 
                                    "shinylum_1", "shinylum_2", "shinylum_3",
                                    "references"), 
                           current_tab = "intro_1",
                           online = TRUE,
                           modal = FALSE,
                           extending_shiny_modal = FALSE)
  
  ## TAB SWITCH HANDLER
  ## ---------------------------------------------------------------------------
  validTabs <- list(
    intro_1 = c("intro_1_tab1", "intro_1_tab2", "intro_1_tab3"),
    intro_2 = c("intro_2_tab1", "intro_2_tab2"),
    
    shiny_1 = c("shiny_1_tab1", "shiny_1_tab2"),
    shiny_2 = c("shiny_2_tab1", "shiny_2_tab2"),
    shiny_3 = c("shiny_3_tab1", "shiny_3_tab2", "shiny_3_tab3"),
    
    shinylum_1 = c("shinylum_1_tab1", "shinylum_1_tab2"),
    shinylum_3 = paste0("shinylum_3_tab", 1:10)
  )
  
  observeEvent(input$click, {
    
    removeModal()
    values$modal <- FALSE
    
    # cat("Current sidebar: ", input$sidebar, "\n")
    if (!input$sidebar %in% names(validTabs)) {
      print("No tabs available on this page") 
      cat("Current sidebar: ", input$sidebar, "\n")
      return(NULL)
    }
    
    updateTabsetPanel(session, input$sidebar,
                      selected = select_next(input[[input$sidebar]], validTabs[[input$sidebar]]))
    
  })
  
  observeEvent(input$altclick, {
    
    removeModal()
    values$modal <- FALSE
    
    # cat("Current sidebar: ", input$sidebar, "\n")
    if (!input$sidebar %in% names(validTabs)) {
      print("No tabs available on this page") 
      cat("Current sidebar: ", input$sidebar, "\n")
      return(NULL)
    }
    
    updateTabsetPanel(session, input$sidebar,
                      selected = select_previous(input[[input$sidebar]], validTabs[[input$sidebar]]))
  })
  
  # DEBUG OBSERVER
  observe({
    #print(input$sidebar)
  })
  
  # TAB FORWARD
  observeEvent(input$forward, {
    
    removeModal()
    values$modal <- FALSE
    
    next_tab <- which(values$current_tab == values$tabs) + 1
    if (next_tab > length(values$tabs))
      next_tab <- 1
    values$current_tab <- values$tabs[next_tab]
    updateTabItems(session, "tabs", values$current_tab)
  })
  
  # TAB BACK
  observeEvent(input$back, {
    
    removeModal()
    values$modal <- FALSE
    
    next_tab <- which(values$current_tab == values$tabs) - 1
    if (next_tab < 1)
      next_tab <- length(values$tabs)
    values$current_tab <- values$tabs[next_tab]
    updateTabItems(session, "tabs", values$current_tab)
  })
  
  
  ## TRIGGER
  ## ---------------------------------------------------------------------------
  observeEvent(input$trigger, {
    
    this_tab_index <- which(input[[input$sidebar]] == validTabs[[input$sidebar]])
    this_tab <- validTabs[[input$sidebar]][this_tab_index]
    
    if (is.null(this_tab)) {
      if (input$sidebar == "references") {
        this_tab <- "references"
      } else if (input$sidebar == "shinylum_2") {
        this_tab <- "shinylum_2"
      } else {
        return(NULL)
      }
    } 
    
    if (this_tab == "intro_2_tab1" || this_tab == "intro_2_tab2") {
      updateCheckboxInput(session, "solution_rotate", value = sample(c(TRUE, FALSE), 1))
      updateCheckboxInput(session, "solution_kde", value = sample(c(TRUE, FALSE), 1))
      updateCheckboxInput(session, "solution_hist", value = sample(c(TRUE, FALSE), 1))
      updateCheckboxInput(session, "solution_dots", value = sample(c(TRUE, FALSE), 1))
      
      updateSliderInput(session, "solution_ratio", value = round(runif(1, 0.5, 1), 2))
      updateSliderInput(session, "solution_cex", value = round(runif(1, 0.5, 1), 2))
    }
    
    if (this_tab == "shiny_1_tab1" || this_tab == "shiny_1_tab2") {
      updateSliderInput(session, "bins", value = ceiling(runif(1, 3, 50)))
    }
    
    if (this_tab == "shiny_2_tab1" || this_tab == "shiny_2_tab2") {
      updateActionButton(session, "actionBtn", "I said: do NOT push")
      updateCheckboxInput(session, "checkbox", value = !input$checkbox)
      updateCheckboxGroupInput(session, "checkboxGroup", selected = sample(c("Blue", "Green", "Red"), ceiling(runif(1, 0, 3))))
      updateRadioButtons(session, "radioButtons", selected = sample(1:3, 1))
      updateSelectInput(session, "selectBox", selected = sample(c(16, 1), 1))
      updateSliderInput(session, "slider", value = sample(1:10, 1))
      updateSliderInput(session, "sliderRange", value = c(sample(1:50, 1), sample(51:100, 1)))
    }
    
    if (this_tab == "shiny_3_tab2") {
      if (!values$modal) {
        showModal(
          modalDialog(title = "Self-hosted Shiny Server", size = "l", easyClose = TRUE,
                      fluidRow(
                        column(width = 6,
                               div(align = "center", tags$h3("IRAMAT-CRP2A, Bordeaux")),
                               tags$img(src = "img/shiny-server_iramat.jpeg", style = "width:100%;", border = 0),
                               div(align = "right", tags$p("Burow et al. (2016)"))
                        ),
                        column(width = 6, 
                               div(align = "center", tags$h3("Cologne Luminescence Laboratory")),
                               tags$img(src = "img/shiny-server_CLL.png", style = "width:100%;", border = 0),
                               div(align = "right", tags$p("Freely accessible under http://rlum.geographie.uni-koeln.de"))
                        )
                      )
                      
          ))
        values$modal <- TRUE
        
      } else {
        removeModal()
        values$modal <- FALSE
      }
    }
    
    if (this_tab == "shinylum_2") {
      values$extending_shiny_modal <- !values$extending_shiny_modal
    }
    
    if (grepl("shinylum_3_tab", this_tab)) {
      updateCheckboxInput(session, "online", value = !input$online)
    }
    
    if (this_tab == "references") {
      if (!values$modal) {
        
        showModal(
          modalDialog(title = NULL, size = "l",
                      div(align = "center", tags$h1("Thank you for your attention")),
                      fluidRow(
                        column(width = 6,
                               div(align = "center", tags$h3("R code for this presentation")),
                               tags$img(src = "img/qr_github.png", style = "width:100%;", border = 0),
                               div(align = "center", tags$h4("https://github.com/tzerk/LED2017-RLumShiny"))
                        ),
                        column(width = 6, 
                               div(align = "center", tags$h3("Presentation on the CLL server")),
                               tags$img(src = "img/qr_presentation.png", style = "width:100%;", border = 0),
                               div(align = "center", tags$h4("http://rlum.geographie.uni-koeln.de"))
                        )
                      )
          ))
        values$modal <- TRUE
      } else {
        removeModal()
        values$modal <- FALSE
      }
    }
    
  })
  
  ## MODALS 
  ## ---------------------------------------------------------------------------
  ## Header
  observeEvent(input$aboutBtn, {
    showModal(modalDialog(title = "About this presentation", easyClose = TRUE,
                          tabBox(width = 12,
                                 tabPanel(icon("info-circle"), about_text),
                                 tabPanel("sessionInfo()", verbatimTextOutput("session_info"))
                          )
    )
    )
  })
  
  output$session_info <- renderPrint({ sessionInfo() })
  
  ## Introduction
  observeEvent(c(input$problem1, input$problem2), {
    showModal(modalDialog(title = HTML("The p<b>R</b>oblem"), easyClose = TRUE,
                          problem_text))
  }, ignoreInit = TRUE)
  
  observeEvent(input$solution, {
    showModal(modalDialog(title = HTML("A solution"), easyClose = TRUE,
                          solution_text))
  })
  
  observeEvent(input$hello_shiny_modal, {
    showModal(modalDialog(title = HTML("What is <code>Ui.R</code> and <code>Server.R</code>?"), easyClose = TRUE,
                          hello_shiny_text))
  })
  
  observeEvent(input$info_deploy, {
    showModal(modalDialog(title = HTML("Sharing shiny applications"), easyClose = TRUE,
                          deploy_text
    ))
  })
  
  observeEvent(input$extending_shiny, {
    values$extending_shiny_modal <- !values$extending_shiny_modal
  })
  
  observeEvent(values$extending_shiny_modal, {
    if (values$extending_shiny_modal) {
    showModal(modalDialog(title = "Extending Shiny", easyClose = TRUE,
                          tags$p(HTML(
                            "The shiny framework can easily be extended by either writing your own extensions or
                            by including external JavaScript code or libraries. This is possible due to how <code>shiny</code>
                            works internally. From the <b>R</b> code of a shiny application an HTML file is generated, which
                            also includes a custom JavaScript library that enables the bidirectional communication between <b>R</b>
                            and the rendered webpage. The framework is further designed in a way to be easily extensible with only little <b>R</b>
                            code and a few lines of JavaScript. Since there are many great JavaScript libraries already available
                            the potential for increasing the capabilities of <b>R</b> is tremendous. While the <b>R</b>
                            package <code>RLumShiny</code> also includes some extensions to shiny, a much more impressive
                            integration of a JavaScript library is that of, e.g., Leaflet (<a href = '#'>http://leafletjs.com/</a>), a popular open-source library
                            for interactive maps using the <b>R</b> package <code>leaflet</code> (see example below)."
                          )),
                          verbatimTextOutput("leaflet_event"),
                          leafletOutput("leaflet")
                          ))
    } else {
      removeModal()
    }
  }, ignoreInit = TRUE)
  
  output$leaflet <- renderLeaflet({
    leaflet() %>% 
      addProviderTiles(providers$OpenStreetMap) %>% 
      setView(lng = 18.421923, lat = -33.921510, zoom = 17) %>%
      addMeasure()
  })
  
  output$leaflet_event <- renderPrint({
    input$leaflet_click
  })
  
  ## INTRODUCTION
  ## ---------------------------------------------------------------------------
  output$intro_2_task <- renderUI({
    if (input$intro_2_task %% 2 != 0) {
      tags$p(HTML("<b>Consider the following situation:</b></br> You, as a scientist, are facing the task
              to visualise your data in a more complex chart using <b>R</b>. Let us further
              assume that someone else already provided a custom <b>R</b> function that
              produces this kind of non-standard plot (here: <code>plot_AbanicoPlot()</code>).
              The desired plot may look like the one below."))
    }
  })
  
  
  output$intro_2_code <- renderUI({
    if (input$intro_2_code %% 2 != 0) {
      HTML("Naturally, to complete the task you would fire up the <b>R</b> command-line and 
                                        start hacking away. Assuming we have the data already in place, the essential part is 
                                        is the call of the specific plotting function.
                                        For the plot to look like it does right now the user would be required to write the
                                        <b>R</b> code below. To be fair, some or even most of the arguments do not to be explicitly
                                        specified if their default values are sufficient. But there is still an overwhelming
                                         number of arguments that need to be recognized and used to make the plot appear
                                         exactly as seen on the left-hand side.")
    }
  })
  
  output$intro_2_shiny1 <- renderUI({
    if (input$intro_2_shiny1 %% 2 != 0) {
      tags$p(HTML(
        "Alternatively, you could be provided a graphical user interface with input
        widgets that control the numerous arguments of this particular function.
        You would no longer be required to look up all the arguments and their
        required input type and/or structure."
      ))
    }
  })
  
  output$intro_2_shiny2 <- renderUI({
    if (input$intro_2_shiny2 %% 2 != 0) {
      tags$p(HTML(
        "To be fair, this is of course only a small subset of input widgets required
        to control all the options listed in the CLI code. But for a user new to <b>R</b>
        we could safely assume that a GUI is the much more comfortable alternative.</br>
        In the next section <code>The 'shiny' framework</code> you will learn more about the basic
        structure of a shiny application, the different input widgets and how to share
        the applications with others."
      ))
    }
  })
  
  
  output$solution_plot <- renderPlot({
    solution_plot(data, code = FALSE, 
                  cex = input$solution_cex, 
                  ratio = input$solution_ratio,
                  rotate = input$solution_rotate,
                  kde = input$solution_kde,
                  hist = input$solution_hist,
                  dots = input$solution_dots)
  })
  output$solution_plot_code <- renderUI({
    file <- tempfile()
    solution_plot(data, code = TRUE, 
                  cex = input$solution_cex,
                  ratio = input$solution_ratio,
                  rotate = input$solution_rotate,
                  kde = input$solution_kde,
                  hist = input$solution_hist,
                  dots = input$solution_dots) %>% 
      write(file)
    highlight(file, renderer = renderer_html(), output = NULL) %>% 
      paste(collapse = "") %>% 
      HTML()
  })
  
  ## SHINY FRAMEWORK
  ## ---------------------------------------------------------------------------
  output$helloshiny_code_ui <- renderUI({
    helloshiny_code$ui
  })
  output$helloshiny_code_server <- renderUI({
    helloshiny_code$server
  })
  
  output$helloshiny <- renderPlot({
    x <- faithful[ ,2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "darkgray", border = "white")
  })
  
  
  output$shiny_2_widgets <- renderUI({
    if (input$shiny_2_widgets %% 2 != 0) {
      tags$p(HTML("This is a non-exhaustive collection of input widgets available in the
              <code>shiny</code> framework. Most of the widgets here are bound to a parameter of the
              plot on the right-hand side. Feel free to test them all and observe its effect
              on the plot. You can also check the <b>R</b> console output to see the
              value returned by each widget."))
    }
  })
  
  ## Shiny widget code
  output$widget_code_actionBtn <- renderPrint({ print(input$actionBtn) })
  output$widget_code_checkbox <- renderPrint({ print(input$checkbox) })
  output$widget_code_checkboxGroup <- renderPrint({ print(input$checkboxGroup) })
  output$widget_code_dateInput <- renderPrint({ print(input$dateInput) })
  output$widget_code_dateRange <- renderPrint({ print(input$dateRange) })
  output$widget_code_fileInput <- renderPrint({ print(input$fileInput) })
  output$widget_code_numericInput <- renderPrint({ print(input$numericInput) })
  output$widget_code_radioButtons <- renderPrint({ print(input$radioButtons) })
  output$widget_code_selectBox <- renderPrint({ print(input$selectBox) })
  output$widget_code_slider <- renderPrint({ print(input$slider) })
  output$widget_code_sliderRange <- renderPrint({ print(input$sliderRange) })
  output$widget_code_textInput <- renderPrint({ print(input$textInput) })
  
  ## Shiny widget plot
  output$widget_plot <- renderPlot({
    
    if (is.null(input$checkboxGroup))
      return(NULL)
    
    n <- input$numericInput^1.5
    
    df <- data.frame(x = runif(n = n, 0, 100),
                     y = runif(n = n, 0, 100),
                     color = sample(c("Blue", "Green", "Red"), size = n, replace = TRUE)) %>% 
      filter(color %in% input$checkboxGroup)
    
    gg <- ggplot(df, aes(x, y, color = color)) +
      geom_point(size = input$slider, shape = as.integer(input$selectBox)) +
      xlim(input$sliderRange) + 
      ylim(input$sliderRange) +
      xlab("A random number") +
      ylab("Another random number") +
      ggtheme[[as.integer(input$radioButtons)]] +
      ggtitle(get_buttonMsg(input$actionBtn))
    
    if (input$checkbox)
      gg <- gg + facet_grid(. ~ color)
    
    gg
  })
  
  # Deploying apps
  output$shiny_3_deploy1 <- renderUI({
    if (input$shiny_3_deploy1 %% 2 != 0) {
      tags$p(
        HTML(
          "The easist and fastest way to share your self-written shiny applications
              is by using the commercial service <a href = '#'>Shinyapps.io</a> by RStudio.
              On this self-service platform users can upload, run and share their shiny
              applications. The service offers different subscription plans depending
              on the desired number of allowed applications, service availability and
              feature content. A free subscription is also available."
        )
      )
    }
  })  
  output$shiny_3_deploy2 <- renderUI({
    if (input$shiny_3_deploy2 %% 2 != 0) {
      tags$p(
        HTML(
          "If you do not want to rely on a third-party service to host your shiny
              applications there is also the option to host your own instance of
              <code>Shiny-Server</code>. Naturally, apart from the software itself, which is
              also available in an open-source version, a server or suitable webspace
              is required beforehand. While setting up a server yourself requires more
              preparation, knowledge and potentially costs, the benefit of having full
              control over the service can very well be justified."
        )
      )
    }
  })  
  output$shiny_3_deploy3 <- renderUI({
    if (input$shiny_3_deploy3 %% 2 != 0) {
      tags$p(
        HTML(
          "Running shiny applications as a service over the internet is not a must, it is always possible
              to run any shiny application locally on any computer with a working instance
              of <b>R</b> and RStudio. Shiny applications can also be included in <b>R</b> packages (like in <code>RLumShiny</code>), which
              can be downloaded e.g. from GitHub or, of course, from CRAN. Running a shiny application
              on your local computer does require a HTML5 compliant webbrowser, but no internet connection!"
        )
      )
    }
  })
  
  output$shinylum_1_motivation <- renderUI({
    if (input$shinylum_1_motivation %% 2 != 0) {
      tags$p(HTML(
        "The general motivations have already been outlined in the introduction.
                                    In short, using the <b>R</b> command-line can be tedious, even if your
                                    experienced in <b>R</b>. If you are new to <b>R</b> and only want to quickly
                                    produce a plot, the initial experience can be overwhelming. </br></br>
                                    In the context of the <b>R</b> package <code>Luminescence</code> over the time we learned
                                    that many colleagues were struggling 
                                    to get started with the package. While writing tutorials and manuals helped
                                    to ease the access to the package, it still takes a certain amount of dedication
                                    to learn the basic functionality of the package. Quite understandably many colleagues
                                    do not feel like having to learn basic <b>R</b> programming first only to use a very small
                                    subset of functions provided by the package. By providing a GUI to at least some
                                    of the more basic and/or 'popular' functions of the <code>Luminescence</code> package
                                    we can are able to practically remove these restrictions and make both <b>R</b> and
                                    the <code>Luminescence</code> more accessible to our colleagues."
      ))
    }
  })
  
  output$shinylum_1_apps <- renderUI({
    if (input$shinylum_1_apps %% 2 != 0) {
      tags$p(HTML("Shiny applications available in the <b>R</b> package <code>RLumShiny</code> (v0.2.1).
                  Each application can be started using the function app_RLum() with a
                  corresponding keyword as input for the parameter app
                  (e.g., <code>app_RLum(app = 'abanico')</code>). All functions are part of the <code>Luminescence</code> package.
                  See the 'Examples' section to test some of the listed applications yourself!"))
    }
  })
  output$shinylum_1_funs <- renderUI({
    if (input$shinylum_1_funs %% 2 != 0) {
      tags$p(HTML(
        "Functions in the <b>R</b> package <code>RLumShiny</code> (v0.2.1). The main function is <code>app_RLum()</code>, which must be used to start
        any of the applications given in the other table. All other functions are used internally and extend the functionality of the <code>shiny</code>
        package (see 'Extending shiny' section)."
      ))
    }
  })
  
  ## RLumShiny application table
  output$rlumshiny_app <- renderDataTable({
    rlumshiny_app_df
  }, options = list(pageLength = 10, pagingType = "full", 
                    searching = FALSE, lengthChange = FALSE))
  
  ## RLumShiny functions table
  output$rlumshiny_fun <- renderDataTable({
    rlumshiny_fun_df
  }, options = list(pageLength = 10, pagingType = "full", 
                    searching = FALSE, lengthChange = FALSE))
  
  ## RLumShiny extending shiny
  output$jscolorInput <- renderPrint({
    input$jscolorInput
  })
  output$jscolor_plot <- renderPlot({
    ggplot(diamonds, aes(carat)) +
      geom_histogram(binwidth = 0.01, fill = input$jscolorInput)
  })
  observeEvent(input$extending_shiny, {
    showModal(modalDialog(title = "Extending Shiny", easyClose = TRUE,
                          tags$p(HTML(
                            "The shiny framework can easily be extended by either writing your own extensions or
                            by including external JavaScript code or libraries. This is possible due to how <code>shiny</code>
                            works internally. From the <b>R</b> code of a shiny application an HTML file is generated, which
                            also includes a custom JavaScript library that enables the bidirectional communication between <b>R</b>
                            and the rendered webpage. The framework is further designed in a way to be easily extensible with only little <b>R</b>
                            code and a few lines of JavaScript. Since there are many great JavaScript libraries already available
                            the potential for increasing the capabilities of <b>R</b> is tremendous. While the <b>R</b>
                            package <code>RLumShiny</code> also includes some extensions to shiny, a much more impressive
                            integration of a JavaScript library is that of, e.g., Leaflet (<a href = 'http://leafletjs.com/'>http://leafletjs.com/</a>), a popular open-source library
                            for interactive maps using the <b>R</b> package <code>leaflet</code> (see example below)."
                          )),
                          verbatimTextOutput("leaflet_event"),
                          leafletOutput("leaflet")
    ))
  })
  output$leaflet <- renderLeaflet({
    leaflet() %>% 
      addProviderTiles(providers$OpenStreetMap) %>%
      setView(lng = 18.421813, lat = -33.921510, zoom = 14) %>% 
      addMeasure()
  })
  output$leaflet_event <- renderPrint({
    input$leaflet_click
  })
  
  observeEvent(input$online, {
    if (!is.null(input$online))
      values$online <- input$online
  })

  ## RLumShiny example applications
  output$abanico <- renderUI({
    if (values$online) # see hide_iframes.js
      iframe$abanico
    else
      div(align = "center", tags$img(src = "img/app_abanico.png", style = "width:100%;", border = 0))
  })
  output$histogram <- renderUI({
    if (values$online)
      iframe$histogram
    else
      div(align = "center", tags$img(src = "img/app_histogram.png", style = "width:100%;", border = 0))
  })
  output$kde <- renderUI({
    if (values$online)
      iframe$kde
    else
      div(align = "center", tags$img(src = "img/app_kde.png", style = "width:100%;", border = 0))
  })
  output$radialplot <- renderUI({
    if (values$online)
      iframe$radialplot
    else
      div(align = "center", tags$img(src = "img/app_radialplot.png", style = "width:100%;", border = 0))
  })
  output$doserecovery <- renderUI({
    if (values$online)
      iframe$doserecovery
    else
      div(align = "center", tags$img(src = "img/app_drt.png", style = "width:100%;", border = 0))
  })
  output$cosmic <- renderUI({
    if (values$online)
      iframe$cosmic
    else
      div(align = "center", tags$img(src = "img/app_cosmic.png", style = "width:100%;", border = 0))
  })
  output$transformCW <- renderUI({
    if (values$online)
      iframe$transformcw
    else
      div(align = "center", tags$img(src = "img/app_transformCW.png", style = "width:100%;", border = 0))
  })
  output$filter <- renderUI({
    if (values$online)
      iframe$filter
    else
      div(align = "center", tags$img(src = "img/app_filter.png", style = "width:100%;", border = 0))
  })
  output$fastratio <- renderUI({
    if (values$online)
      iframe$fastratio
    else
      div(align = "center", tags$img(src = "img/app_fastratio.png", style = "width:100%;", border = 0))
  })
  output$fading <- renderUI({
    if (values$online)
      iframe$fading
    else
      div(align = "center", tags$img(src = "img/app_fading.png", style = "width:100%;", border = 0))
  })
  
  ## Luminescence
  
  output$rlum_fun_history_plot <- renderPlot({
    gg <- ggplot(rlum_fun_history, aes(dates, funs)) + 
      geom_step(lwd = 1.5, col = "red") +
      geom_point() +
      theme_light() +
      xlab("Date") +
      ylab("No. of exported functions") +
      geom_text(aes(angle = 90), label = version, vjust = "top", hjust = "left", nudge_y = 1)
    
    gg
  })
  
  output$lum_functions <- renderDataTable({
    rlum_fun_df
  }, options = list(pageLength = 10, pagingType = "full", 
                    searching = FALSE, lengthChange = FALSE))
  
  
  output$cran_plot <- renderPlot({
    
    data <- switch(input$cran_package,
                   "luminescence" = list(cran$luminescence),
                   "rlumshiny" = list(cran$rlumshiny))
    
    fun <- switch(input$cran_category,
                  "date" = gg_Timeline(data),
                  "country" = gg_Map(data),
                  "os" = gg_ByOS(data),
                  "r_version" = gg_ByVersion(data),
                  "arch" = gg_ByArch(data))
    
    if (inherits(fun[[1]], "gg"))
      print(fun[[1]])
  })
  
  ## References
  output$references <- renderDataTable({
    references_df
  }, options = list(pageLength = 10, pagingType = "full", 
                    searching = FALSE, lengthChange = FALSE))
  
}
shinyApp(ui, server)