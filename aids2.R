rm(list=ls())
data()
data1 <-data("Aids2")
data1 ## didnt load since R is lazy ops we have to use it once
##type Aids2
data1 <- Aids2
data1
str(data1)
View(data1)
all_age <-data1[-1:-6]
mean(all_age$age)
subset(all_age, age <20)
twenty_less_age <- subset(all_age, age <20)
all_male_no_diag <- subset(data1, sex=="M", select = -diag)
NSW_M_dth <- subset(data1, state=="NSW" & sex=="M", select= c(state,death,age))
length(NSW_M_dth$death)
death_div_hundred <- NSW_M_dth$death/100
any(data1$death >15000)
seq(data1)
seq(data1$age)
rm(x) ## remove x vector from memory

x <- 0
for (i in 1:length(all_age$age))
{
  if(all_age$age[i] > 70)
  {
    print("I am Champion SCOTTLAND")
    x<- x+1
  }
}
View(all_age)

x <- 0
for (i in 1:length(all_age$age))
{
        if(all_age$age[i] > 70)
        {
                x[i]<-i
                print(x[i]) ## displays the index element
        }
        
}

x <- NULL
for (i in 1:length(all_age$age))
{
        if(all_age$age[i] == 70)
        {
                x <- c(x,i) 
                print(x) ## displays the index element
        }
        
}
##instead of writing for loop to find the position of vector
## in al_age$age we canuse which()

which (all_age$age ==70)
all_age[x,]


male_count <-ifelse(data1$sex=="M",1,0)
sum(male_count)
female_count<-length(male_count)-sum(male_count)
female_count
names(female_count)<- c("No of FEMALE in sample")
names(male_count)<-c("No of MALE in sample")

apply(data1[-c(1,2,5,6)],2,mean) ##apply() in use see how we use c to cut
##in apply() 2 means column and 1 means row; it applies to all 2 or 1

apply(data1[-c(1,2,5,6)],2,perct_cng)

j<-cbind(all_age, data.frame("TEST",1:length(all_age$age))) ##adding column

head(j) ##Returns the first or last parts of a vector
tail(j)
j$X.TEST. <- NULL ##DELETES COLUMN X.TEST. from j

names(j)[2] <- "TEST by adding no's" ##renaming column 2
apply(j,2,max) ## MAX finder

tapply(data1$death,data1$sex,mean) ##tapply FUNCTIOn

tapply(data1$death,list(data1$sex,data1$state),mean)
q <- data1[c(1,2)]
q<-table(q)
addmargins(q)
