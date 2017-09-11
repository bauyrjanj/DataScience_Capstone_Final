options(shiny.maxRequestSize=30*1024^2)

library(shiny)
library(data.table)
library(NLP)
library(tm)
library(qdap)
library(stringr)

# Loading unigram, bigram, and trigram frequency lists
load("nfreq.v5.RData")
message<-""
## Function that predicts the next word
predictWord<-function(txt.in){
        count<-as.numeric(wc(txt.in))
        if (count==2) {
                l<-ngramsList[[3]]
                itx<-word(txt.in, start=2, sep = " ")
                p=grep(itx, l$w2)
                nxt<-as.character(l$w3[p])
                message<<-"Predicted the NEXT word using Trigram"
                return(nxt[1])
                
        } else if (count==1) {
                l<-ngramsList[[2]]
                itx<-word(txt.in, start=1, sep = " ")
                p=grep(itx, l$w1)
                nxt<-as.character(l$w2[p])
                message<<-"Predicted the NEXT word using Bigram"
                return(nxt[1])
        } else {
                l<-ngramsList[[1]]
                nxt<-l$w[1]
                message<<-"Predicted the NEXT word using Unigram"
                return(nxt[1])
        }
}


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
            output$word_next<-renderPrint({
                    result<-predictWord(input$obs)
                    output$sentence<- renderText({message})
                    result
              })
})