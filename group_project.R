options(width = 200)

# Read the data from a csv
class_data_file <- read.csv("class_attendance.csv")

# Gets the date of the student from the dataframe
dob <- as.Date(class_data_file$DateOfBirth, format = "%d/%m/%y")

student_birth_year <- as.integer(substr(dob, 0, 4)) # nolint

student_age <- 2024 - student_birth_year

class_data_file$Age <- student_age

# Writes the data to a CSV file
write.csv(class_data_file, file = "output.csv", row.names = FALSE, quote = FALSE) # nolint

print.data.frame(read.csv("output.csv"))
