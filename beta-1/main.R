setwd('/Users/t-rex-Box/Desktop/work/analyze_survey_gizmo/beta-1')

responseData <- read.csv("20140603145109-SurveyExport.csv", header = TRUE, stringsAsFactors = FALSE)
names(responseData)

responseData =  responseData[,names(responseData) == "major_cluster"
                             | names(responseData) == "interested" 
                             | names(responseData) == "Email"
                             | names(responseData) == "Date.Submitted"]

dim(responseData)

approachable_responseData = responseData[responseData$"interested" 
                                         == TRUE,]

sent_cs = read.csv("bucketed_users/beta-1.0-cs.csv", header = TRUE, stringsAsFactors = FALSE)
sent_non_cs = read.csv("bucketed_users/beta-1.0-non-cs-stem.csv", header = TRUE, stringsAsFactors = FALSE)
sent_non_stem_cs = read.csv("bucketed_users/beta-1.0-non-stem.csv", header = TRUE, stringsAsFactors = FALSE)
excess = read.csv("bucketed_users/beta-1.0-excess.csv", header = TRUE, stringsAsFactors = FALSE)
  
dim(sent_cs)
dim(sent_non_cs)
dim(sent_non_stem_cs)
dim(excess)

#Remove the excess category emails
approachable_responseData = approachable_responseData[!(approachable_responseData$"Email" %in% excess$Email),]

cs_a_responseData = approachable_responseData[approachable_responseData$"major_cluster" == "cs" &
                                                !(approachable_responseData$"Email" %in% sent_cs$Email), ]
dim(cs_a_responseData)

non_cs_stem_a_response_data = approachable_responseData[approachable_responseData$"major_cluster" == "non-cs-stem" &
                                                        !(approachable_responseData$"Email" %in% sent_non_cs$Email), ]
dim(non_cs_stem_a_response_data)

non_stem_a_response_data = approachable_responseData[approachable_responseData$"major_cluster" == "non-stem" &
                                                     !(approachable_responseData$"Email" %in% sent_non_stem_cs$Email), ]
dim(non_stem_a_response_data)

new_batch_cs = cs_a_responseData[1:180,]
new_batch_non_cs_stem = non_cs_stem_a_response_data[1:60,]
new_batch_non_stem  = non_stem_a_response_data[1:60,]

write.csv(new_batch_cs$Email, file="batch-cs.csv", row.names = FALSE,)
write.csv(new_batch_non_cs_stem$Email, file="batch-non-cs-stem.csv", row.names = FALSE)
write.csv(new_batch_non_stem$Email, file="batch-non-stem.csv", row.names = FALSE)


#Grab the random sampled 30 people.
#sample_cs_a_responseData = cs_a_responseData[sample(nrow(cs_a_responseData), 30), ]
#sample_non_cs_stem_a_response_data = non_cs_stem_a_response_data[sample(nrow(non_cs_stem_a_response_data), 30), ]
#samlpe_non_stem_a_response_data = non_stem_a_response_data[sample(nrow(non_stem_a_response_data), 30), ]

#Already ran, don't run it again.
#write.csv(sample_cs_a_responseData$Email, file = "beta-1.0-cs.csv", row.names = FALSE)
#write.csv(sample_non_cs_stem_a_response_data$Email, file = "beta-1.0-non-cs-stem.csv", row.names = FALSE)
#write.csv(samlpe_non_stem_a_response_data$Email, file = "beta-1.0-non-stem.csv", row.names = FALSE)



