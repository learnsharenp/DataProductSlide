---
title       : Fertility diagnosis project
subtitle    : Pitch presentation
author      : Ram K Gubhaju 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url:
#  lib: ../../libraries
  lib: ./librariesNew
  assets: ./assets
widgets     : [mathjax, quiz, bootstrap]
mode        : selfcontained # {standalone, draft}
---

## About app?

- The app is hosted as [Fertility Diagnosis](https://learnsharenp.shinyapps.io/Course9_4/) .

- There are altogether nine attribute you should select upon

- Then push the "Submit" button to predict the pregnancy status

- The prediction will be either "Normal Pregnancy" or "Altered Pregnancy"

---

## Training dataset

- The dataset is available in [UCI website](https://archive.ics.uci.edu/ml/datasets/Fertility)

- The dataset contains 100 instances and 10 attribute

- The app uses 9 attribute to predict the diagnosis attribute.

- 100 volunteers provide a semen sample analyzed according to the WHO 2010 criteria.

- Sperm concentration are related to socio-demographic data, environmental factors, health status, and life habits

---

## Algorithm Used

- Random Forest is used to train and predict the diagnosis

- 100 instance where splitted 70-30 % as training and testing set to train and test the algorithm

```r
##import the fertility data
fertilityData<-read.csv("fertility_Diagnosis.txt",header = FALSE)
label the column names
names(fertilityData)<-c("Season","Age","ChildDisease","Trauma","SurgicalInterven"
                        ,"HighFeverLastYear","FrequencyAlcohol","Smoking"
                        ,"SittingHour","Diagnosis")
library(caret)
set.seed(1245)
TrainingRatio <- createDataPartition(y=fertilityData$Diagnosis, p=0.7, list =F)
fertilityData_Train <- fertilityData[TrainingRatio, ]
fertilityData_Test <- fertilityData[-TrainingRatio, ]
```


---

## Algorithm accuracy testing

- Cross validation of 5 fold is used to train the set

- The following scipt shows the efficiency of the fitted algorithm

```r
# instruct train to use 5-fold CV to select optimal tuning parameters
fitControl <- trainControl(method = "cv", number=5, verboseIter=F)
# fit model on ptrain1
fit <- train(Diagnosis ~ ., data=fertilityData_Train, method="rf", trControl=fitControl)
preds <- predict(fit, newdata=fertilityData_Test)
# show confusion matrix to get estimate of out-of-sample error
confusionMatrix(fertilityData_Test$Diagnosis, preds)
```

---

## Finally

- The confusion matrix show acceptable prediction of our fitted algorithm

- So Random Forest algorithm is acceptable for prediction


# Thankyou
---

