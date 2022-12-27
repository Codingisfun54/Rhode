first <- read.table("C:/Users/willi/OneDrive/Desktop/RD_501_88101_1999-0.txt")
second <- read.table("C:/Users/willi/OneDrive/Desktop/RD_501_88101_2012-0.txt")
pm0 <- read.table("C:/Users/willi/OneDrive/Desktop/RD_501_88101_1999-0.txt"
      ,comment.char = "#", header = FALSE, sep = "|", na.strings = "")
cnames <- readLines("C:/Users/willi/OneDrive/Desktop/RD_501_88101_1999-0.txt",1)
cnames <- strsplit(cnames, "|", fixed = TRUE)
names(pm0) <- make.names(cnames[[1]])
x0 <- pm0$Sample.Value
pm1 <- read.table("C:/Users/willi/OneDrive/Desktop/RD_501_88101_2012-0.txt"
                  ,comment.char = "#", header = FALSE, sep = "|", na.strings = "")
names(pm1) <- make.names(cnames[[1]])
x1 <- pm1$Sample.Value
str(x1)
boxplot(x0,x1)
boxplot(log10(x0),log10(x1))
negative <- x1 < 0
sum(negative, na.rm = TRUE)
dates <- pm1$Date
str(dates)
dates <- as.Date(as.character(dates), "%Y%m%d")
str(dates)
par(mar =c(3,3,3,3))
hist(dates,"month")
hist(dates[negative], "month")
site0 <- unique(subset(pm0,State.Code == 36, c(County.Code, Site.ID)))
site1 <- unique(subset(pm1,State.Code == 36, c(County.Code, Site.ID)))
sit <- paste(site1[,1], site1[,2], sep = ".")
## can't do this for site0 bc site0 is messed up
site0[1] <- gsub("", ".",site0[[1]])

