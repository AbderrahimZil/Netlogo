df <- read.csv('B_Treasure.csv',
               col.names = c('Update','Account', 
                             'Diamond', 'Gold', 'Purple', 'Brown', 
                             'Key', 'Chest', 'Win'))

attach(df)

## Occurence per box type
width <- 45
bins <- 9

par(mfrow=c(2,2))
hD <- hist(Diamond, breaks=seq(0,4,l=5),
     freq=TRUE,main="",pch = 19,
     xlab="Diamond",ylab="occurence",yaxs="i",xaxs="i")

hG <-hist(Gold, breaks=seq(0,5,l=7),
     freq=TRUE,main="",
     xlab="Gold",ylab="occurence",yaxs="i",xaxs="i")

hP <-hist(Purple, breaks=seq(1,20,l=10),
     freq=TRUE,main="",
     xlab="Purple",ylab="occurence",yaxs="i",xaxs="i")

hB <-hist(Brown, breaks=seq(10,width,l=15),
     freq=TRUE,main="",
     xlab="Brown",ylab="occurence",yaxs="i",xaxs="i")
par(mfrow=c(1,1))

## Lollipop plot
####################################
par(mfrow=c(2,2))
# Diamond
plot(table(df$Diamond)/185,
     type="h",
     xlim=c(-1,5), # Diam and Gold (-1,5) purple (0, 17) brown (8, 43)
     ylim=c(0,1),
     lwd=2,
     col='black',
     ylab="p",
     xlab="# Diamond Boxes")
points(sort(unique(df[,"Diamond"]), decreasing = FALSE),
       table(df$Diamond)/185,
       pch=15,
       cex=1, # 2
       col="black")

# Gold
plot(table(df$Gold)/185,
     type="h",
     xlim=c(-1,5), # Diam and Gold (-1,5) purle (0, 17) brown (8, 43)
     ylim=c(0,1),
     lwd=2,
     col='black',
     ylab="p",
     xlab="# Gold Boxes")
points(sort(unique(df[,"Gold"]), decreasing = FALSE),
       table(df$Gold)/185,
       pch=15,
       cex=1, # 2
       col="black")

# Purple
plot(table(df$Purple)/185,
     type="h",
     xlim=c(0,17), # Diam and Gold (-1,5) purle (0, 17) brown (8, 43)
     ylim=c(0,1),
     lwd=2,
     col='black',
     ylab="p",
     xlab="# Purple Boxes")
points(sort(unique(df[,"Purple"]), decreasing = FALSE),
       table(df$Purple)/185,
       pch=15,
       cex=1, # 2
       col="black")

# Brown
plot(table(df$Brown)/185,
     type="h",
     xlim=c(8,43),
     ylim=c(0,1),
     lwd=2,
     col='black',
     ylab="p",
     xlab="# Brown Boxes")
points(sort(unique(df[,"Brown"]), decreasing = FALSE),
       table(df$Brown)/185,
       pch=15,
       cex=1, # 2
       col="black")
mtext("Lollipops plot",                   # Add main title
      side = 3,
      line = - 2,
      outer = TRUE,
      font = 15)
## end lollipops
#############################################################################

## Empirical CDF
# plot(ecdf(table(df$Diamond)/185))

par(mfrow=c(2,2))

f <- df$Brown
cdf <- ecdf(f)
plot(cdf, lwd= 2, xaxt="n", xlab="# Boxes", ylab="", verticals = TRUE,
     col.01line = "gray70", pch = 19, do.points = TRUE,
     main='Brown')
axis(1, at=knots(cdf))#, labels = sort(unique(df$Diamond), decreasing = FALSE))
abline(v = knots(cdf), lty = 2, col = "gray70")

par(mfrow=c(1,1))