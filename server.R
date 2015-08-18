library(shiny)
library(ggplot2)
#source(file = "mult_ggplot2.R")

# random distribution app
shinyServer(function(input, output) {
    # genera n observaciones de la distrib dada
    data <- reactive({
        distrib <- switch(input$dist,
                          Normal = rnorm,
                          Exponencial = rexp,
                          Uniforme = runif,
                          LogNormal = rlnorm,
                          rnorm)
        
        distrib(input$n)
    })
    
    # curva densidad
    output$densidad <- renderPlot({
        var <- data()
        data <- data.frame(var)
        g1 <- ggplot(data, aes(x=var))+
            geom_density(fill="dodgerblue4",colour="gray0", alpha=0.8, lwd=0.5) + 
            labs(x="", y="") + xlim(c(min(var)-1.5, max(var)+1.5))+theme_bw()+
            theme(axis.text.y=element_blank(),axis.ticks.y=element_blank(),
                  axis.title.x=element_blank(),panel.border=element_blank())
        print(g1)
    })
    
    
    # diag cajas
    output$dcajas <- renderPlot({
        distrib <- input$dist
        var <- data()
        data <- data.frame(var)
        #var <- rnorm(100)
        g2 <- ggplot(data, aes(x=1, y=var))+
            geom_boxplot(fill="dodgerblue4", outlier.colour = "orangered",
                         alpha=0.8, width=0.1)+
            labs(y = paste("Distribución", distrib, sep=" "), x = "")+
            ylim(c(min(var)-1.5,max(var)+1.5))+ xlim(c(0.95,1.05))+theme_bw()+
            theme(axis.text.y=element_blank(),axis.ticks.y=element_blank(),
                  panel.border=element_blank())+
            coord_flip()
        print(g2)
        
        # multiples graficos ggplot2
        #list_graf <- list(g1,g2)
        #print(mult_ggplot(list_graf,2,1))
        
    })
    
    # tabla de estadisticos descriptivos
    output$tdesc <- renderTable({
        var <- data()
        m <- mean(var); de <- sd(var) ; varz<- var(var); mi <- min(var); ma <- max(var);
        cuart <- quantile(var,probs = c(0.25,0.75))
        Descriptivo <- c("Mínimo", "Media","Máximo", "Desv. Est", "Varianza", "1er Cuartil", "2do Cuartil")
        Valor <- c(mi,m,ma,de,varz,cuart)
        tdesc <- data.frame(Descriptivo,Valor)
    })
    
    # summary de data
    output$summary <- renderPrint({
        summary(data())
    })
    
    # HTML table DT
    output$table <- renderTable({
        data.frame(x=data())
    })
    
})