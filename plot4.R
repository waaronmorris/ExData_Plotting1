source("include.R")

makePNG("plot4.png"
        , function(data){
            par(mfrow = c(2, 2))
          
            plot4_1(data)
            plot4_2(data)
            plot4_3(data)
            plot4_4(data)}
        , width = 503
        , height = 503
        , bg = "white"
        , data = loadCleanData("data/household_power_consumption.txt", dateFrom = "2007-02-01", dateTo = "2007-02-02")
)