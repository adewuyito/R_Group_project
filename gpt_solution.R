# Read the data from a csv
options(width = 200)
class_data_file <- read.csv("class_attendance.csv")

# Function to calculate age from DateOfBirth
calculate_age <- function(dob) {
  dob <- as.Date(dob, format = "%d/%m/%y")
  current_date <- Sys.Date()
  age <- as.numeric(difftime(current_date, dob, units = "weeks")) %/% 52.25
  return(age)
}

# Apply the age calculation function to the DateOfBirth column
# class_data_file$Age <- sapply(class_data_file$DateOfBirth, calculate_age) # nolint

age_array <- calculate_age(class_data_file$DateOfBirth)

class_data_file$Age <- age_array

# Writes the data to a CSV file
write.csv(class_data_file, file = "output.csv", row.names = FALSE, quote = FALSE) # nolint

print(class_data_file)
