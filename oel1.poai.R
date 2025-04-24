library(tidyverse)
df <- read_csv('C:/Users/DUET/Downloads/studentscore.csv')
view(df)

average_attendance <- mean(df$Attendance_Percentage, na.rm = TRUE)
df$Attendance_Percentage[is.na(df$Attendance_Percentage)] <- average_attendance
view(average_attendance)

average_score <- rowMeans(df[c('Math_Score','Physics_Score','Chemistry_Score')])
View(average_score) 


filtered_fstudents <- df %>%
  filter(Gender == "Female", 
         'average_Score' > 75, 
         Attendance_Percentage > 80)


view(filtered_fstudents)

average_scores <- df %>%
  group_by('Department','Math_Score','Physics_Score','Chemistry_Score') %>%
  summarize(average_score)


view(average_scores)

