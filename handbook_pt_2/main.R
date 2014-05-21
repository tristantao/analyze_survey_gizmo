setwd('/Users/t-rex-Box/Desktop/work/analyze_survey_gizmo/handbook_pt_2')

responseData <- read.csv("20140503040935-SurveyExport.csv", header = TRUE, stringsAsFactors = FALSE)

#########################
#####Education Analysis##
#########################

barplot(table(responseData$Highest.level.of.education.you.have.completed.or.are.currently.in.progress.to.complete),
        names.arg = c(" ", "HS", "c", "2-yr", "4-yr", "MA", "Profe", "PhD"))

table(responseData$Area.of.Concentration.in.Education)

responseData$Area.of.Concentration.in.Education = iconv(responseData$Area.of.Concentration.in.Education,"WINDOWS-1252","UTF-8")
responseData$Area.of.Concentration.in.Education <- gsub("\u0081|`", "", responseData$Area.of.Concentration.in.Education)
responseData$Area.of.Concentration.in.Education = tolower(responseData$Area.of.Concentration.in.Education)

responseData$Area.of.Concentration.in.Education = gsub("^information .*", 'info',
                                                    responseData$Area.of.Concentration.in.Education )
responseData$Area.of.Concentration.in.Education = gsub("^computer .*", 'cs',
                                                    responseData$Area.of.Concentration.in.Education )
responseData$Area.of.Concentration.in.Education = gsub("^software .*", 'cs',
                                                    responseData$Area.of.Concentration.in.Education )
responseData$Area.of.Concentration.in.Education = gsub("^math.*", 'math',
                                                    responseData$Area.of.Concentration.in.Education )
responseData$Area.of.Concentration.in.Education 

concentration_table = table(responseData$Area.of.Concentration.in.Education)
DF = data.frame(concentration_table)
top20CTs <- DF[with(DF, order(-Freq)),]
top20CTs = top20CTs[1:80,]
top20CTs

#########################
#######Age Analysis######
#########################
responseData$AgeBracket = NA
responseData$AgeBracket[responseData$X18.25.Age == "Option 1"] = "18-25"
responseData$AgeBracket[responseData$X26.30.Age == "Option 2"] = "26-30"
responseData$AgeBracket[responseData$X31.35.Age == "O1-35"] = "31-35"
responseData$AgeBracket[responseData$X36.and.above.Age == "O6 and above"] = "36-"

age_table = data.frame(table(responseData$AgeBracket))

age_table[[2]][1] = age_table[[2]][1] / 8
age_table[[2]][2] = age_table[[2]][2] / 5
age_table[[2]][3] = age_table[[2]][3] / 5

plot(age_table, type='step', main="a very crappy plot")

#########################
######JOB Analysis#######
#########################
responseData$Current.Job.Title = iconv(responseData$Current.Job.Title,"WINDOWS-1252","UTF-8")
responseData$Current.Job.Title <- gsub("\u0081|`", "", responseData$Current.Job.Title)
responseData$Current.Job.Title = tolower(responseData$Current.Job.Title)

responseData$Current.Job.Title = gsub(".*student.*", 'student', responseData$Current.Job.Title)
responseData$Current.Job.Title = gsub("^information .*", 'info', responseData$Current.Job.Title)
responseData$Current.Job.Title = gsub("^business .*", 'business', responseData$Current.Job.Title)

#sub("^electr.*//s?.*?", 'eletric', "eletrical")

responseData$Current.Job.Title

concentration_table = table(responseData$Current.Job.Title)
DF = data.frame(concentration_table)
top20CTs <- DF[with(DF, order(-Freq)),]
top20CTs = top20CTs[1:80,]
top20CTs

#########################
###Industry Analysis#####
#########################
responseData$Industry = iconv(responseData$Industry,"WINDOWS-1252","UTF-8")
responseData$Industry <- gsub("\u0081|`", "", responseData$Industry)
responseData$Industry = tolower(responseData$Industry)

responseData$Industry = gsub("^it .*", 'it', responseData$Industry)
responseData$Industry = gsub(".* consulting", 'consulting', responseData$Industry)
responseData$Industry = gsub("vc", 'venture capital', responseData$Industry)
responseData$Industry = gsub("^angel .*", 'angel', responseData$Industry)
responseData$Industry = gsub(".* education", 'academia', responseData$Industry)
responseData$Industry = gsub("information technology", 'it', responseData$Industry)
responseData$Industry = gsub("^telecom.*", 'telecommunication', responseData$Industry)
responseData$Industry = gsub("^financial .*", 'finance', responseData$Industry)
responseData$Industry = gsub("^banking", 'finance', responseData$Industry)
responseData$Industry = gsub("^ad .*", 'advertising', responseData$Industry)
responseData$Industry = gsub("^comput.* .*", 'software', responseData$Industry)
responseData$Industry = gsub("^comput.*", 'software', responseData$Industry)
responseData$Industry = gsub("^develop.* .*", 'software', responseData$Industry)
responseData$Industry = gsub("cs .*", 'software', responseData$Industry)
responseData$Industry = gsub("^financ.*", 'finance', responseData$Industry)
responseData$Industry = gsub("^tech.*", 'technology', responseData$Industry)

responseData$Industry = gsub("^math.*", 'math', responseData$Industry)
responseData$Industry = gsub("^math.*", 'math', responseData$Industry)
responseData$Industry = gsub("^math.*", 'math', responseData$Industry)
responseData$Industry = gsub("^math.*", 'math', responseData$Industry)

responseData$Industry

gsub("^comput.*/ ?.*", 'software', "computer")

concentration_table = table(responseData$Industry)
DF = data.frame(concentration_table)
top20CTs <- DF[with(DF, order(-Freq)),]
top20CTs = top20CTs[1:80,]
top20CTs


#####################
########VC PPL######
#####################

vc_ppl = responseData[responseData$Industry == 'venture capital' | responseData$Industry == 'angel',]

vc_ppl[complete.cases(vc_ppl),]


