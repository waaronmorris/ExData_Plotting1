source("include.R")

makePNG("plot3.png"
        , plot3
        , width = 503
        , height = 503
        , bg = "white"
        , data = loadCleanData("data/household_power_consumption.txt", dateFrom = "2007-02-01", dateTo = "2007-02-02")
)