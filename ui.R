library(shiny)

# random distribution app
shinyUI(fixedPage(
    #--------------------------- fixed row 1 logos---------------------------------#
    fixedRow(
        HTML("<hr color=SteelBlue noshade=noshade />"),
        column(width=3,offset = 1,
               tags$img(src = "logoepn.jpg", width = "190px", height = "90px",border="1")
        ),
        column(width=4,offset = 0,
               HTML("<div align=center> <font color=SteelBlue face=Arial size=5> <b>
                    Simulación de Variables Aleatorias Continuas.
                    </b> </font> </div>")
               ),
        column(width=3,offset = 1,
               #tags$img(src = "logodm.png", width = "70px", height = "90px",border="1"), 
               tags$img(src = "logofc.jpg", width = "90px", height = "90px",border="1")
        )
               ),    
    HTML("<hr color=SteelBlue noshade=noshade />"),
    

    #--------------------- fixed row 2 grafico densidad -------------------------# 
    # distrib de prob
    #HTML("<div align=left> <b> <font color=SteelBlue face=Cambria size=3>
    #     Distribuciones de probabilidad: </font> </b> </div>"),
    fixedRow(
        column(width=3,offset = 0,
               radioButtons("dist", "Distribución de probabilidad:",
                            c("Normal" = "Normal",
                              "Exponencial" = "Exponencial",
                              "Uniforme" = "Uniforme",
                              "LogNormal" = "LogNormal"
                            )),
               HTML("<hr color=SteelBlue noshade=noshade />"),
               
               sliderInput("n", "Número de observaciones:", 
                           value = 5,
                           min = 5, 
                           max = 200,
                           step = 5),
               HTML("<hr color=SteelBlue noshade=noshade />")
        ),
        
        column(width=4,offset = 0,
               # graf densidad
               HTML("<div align=center> <b> <font color=Black face=Arial size=3>
               Función de densidad y diagrama de cajas: </font> </b> </div>"),
               HTML("<br> </br>"),
               plotOutput(outputId="densidad", width = 450, height = 200),
               plotOutput(outputId="dcajas", width = 450, height = 120)
        ),
        column(width=4,offset = 1,
               HTML("<div align=left> <b> <font color=Black face=Arial size=3>
                    Estadísticos descriptivos: </font> </b> </div>"),
               #HTML("<br> </br>"),
               # descriptivos
               tableOutput("tdesc"),
               #verbatimTextOutput("summary"),
               
               #HTML("<br> </br>"),
               fixedRow(
                   column(width=2, offset = 0,
                          HTML("<img src=logodm.jpg width = 60 height = 80 align=left>")
                   ),
                   column(width=6, offset = 0,
                          HTML("<font color=SteelBlue face=Arial size=4> <b> Departamento de Matemática.
                               </b> </font>")
                          )
               )
       )
),
    
    
HTML("<hr color=SteelBlue noshade=noshade />"),
mainPanel( # all of the output elements go in here
tabsetPanel(
    tabPanel("Distribuciones aleatorias",
         
     HTML("<font color=#2E2E2E face=Arial size=2> El aplicativo desarrollado tiene como propósito
          principal facilitar el aprendizaje de la <font color=SteelBlue> simulación de variables
          aleatorias continuas </font> mayormente utilizadas,
          mediante la visualización de forma dinámica de cómo varía la forma de la función de 
          densidad cuando el número de observaciones se incrementa progresivamente.
      .</font>"),
         tags$br(),
         tags$br(),
                     
     HTML("<font color=#2E2E2E face=Arial size=2> La interfaz fue desarrollada para que de una
          manera sencilla el usuario pueda hacer uso de la misma. Los pasos que se deben seguir 
          son los siguientes:</font>"),
                     
     HTML("<font color=#2E2E2E face=Arial size=2> <ol>
       <li> Seleccionar la <b>distribución </b> a analizar.</li>                          
       <li> Mediante el slider <b>Número de observaciones </b> incrementar las observaciones de la
        la distribución elegida.</li>
        </ol> </font>"),
        
     HTML("<font color=#2E2E2E face=Arial size=2> En lo que se refiere a las <font color=SteelBlue> 
          herramientas informáticas </font> utilizadas en la generación del modelo podemos enumerar 
          las siguientes:</font>"),
         tags$ol(
             tags$li(tags$a(href="http://www.r-project.org", "R Project")), 
             tags$li(tags$a(href="http://www.rstudio.com", "Rstudio"))
         )
),
tabPanel("R",
     tags$iframe(src = "http://www.r-project.org",
             seamless=NA,height=300,with=500)
),
tabPanel("Rstudio",
     tags$iframe(src = "http://www.rstudio.com",
                 seamless=NA,height=300,with=500)
                     
),
tabPanel("Facultad de Ciencias EPN",
         tags$iframe(src = "http://www.ciencias.epn.edu.ec",
                     seamless=NA,height=300,with=500)
),
tabPanel("Dep. de Matemáticas EPN",
         tags$iframe(src = "http://www.math.epn.edu.ec",
                     seamless=NA,height=300,with=500)
)
),
HTML("<hr color=SteelBlue noshade=noshade />"),           
        
# Redes sociales
HTML("<font color=SteelBlue face=Arial size=1.7> Siguenos en</font>"),
HTML("<a href=https://www.facebook.com/sourcestatlab> <img src=facebook.png width = 50 height = 35> </a> 
     <font color=SteelBlue face=Arial size=1.7>  Source Stat Lab EC </font>"),
HTML("<a href=https://twitter.com/SourceStatLab> <img src=twitter.jpg width = 50 height = 45> </a>
     <font color=SteelBlue face=Arial size=1.7> @SourceStatLabEC </font>"),
HTML("<hr color=SteelBlue noshade=noshade />")
        )
    
    
)
)