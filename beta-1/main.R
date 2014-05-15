setwd('/Users/t-rex-Box/Desktop/work/analyze_survey_monkey/beta-1')

responseData <- read.csv("20140514181801-SurveyExport.csv", header = TRUE, stringsAsFactors = FALSE)
names(responseData)

responseData =  responseData[,names(responseData) == "major_cluster"
                             | names(responseData) == "interested" 
                            | names(responseData) == "Email"]

dim(responseData)

approachable_responseData = responseData[responseData$"interested" 
                                        == TRUE,]

cs_a_responseData = approachable_responseData[approachable_responseData$"major_cluster" == "cs", ]
dim(cs_a_responseData)

non_cs_stem_a_response_data = approachable_responseData[approachable_responseData$"major_cluster" == "non-cs-stem", ]
dim(non_cs_stem_a_response_data)

non_stem_a_response_data = approachable_responseData[approachable_responseData$"major_cluster" == "non-stem", ]
dim(non_stem_a_response_data)

#Now grab the random sampled 30 people.
sample_cs_a_responseData = cs_a_responseData[sample(nrow(cs_a_responseData), 30), ]
sample_non_cs_stem_a_response_data = non_cs_stem_a_response_data[sample(nrow(non_cs_stem_a_response_data), 30), ]
samlpe_non_stem_a_response_data = non_stem_a_response_data[sample(nrow(non_stem_a_response_data), 30), ]

#Already ran, don't run it again.
#write.csv(sample_cs_a_responseData$Email, file = "beta-1.0-cs.csv", row.names = FALSE)
#write.csv(sample_non_cs_stem_a_response_data$Email, file = "beta-1.0-non-cs-stem.csv", row.names = FALSE)
#write.csv(samlpe_non_stem_a_response_data$Email, file = "beta-1.0-non-stem.csv", row.names = FALSE)



