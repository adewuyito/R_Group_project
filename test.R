# Read the data from a csv
class_data_file <- read.csv("class_attendance.csv")
# class_output_file <- read.csv("output.csv") # nolint: commented_code_linter.


# Gets the date of the student from the dataframe
get_date <- function(my_data) {
  student_age <- substring(my_data, nchar(my_data) - 1, nchar(my_data) - 0) # nolint
  return(student_age)
}

calculate_age <- function(dob) {
  dob <- as.Date(dob, format = "%d/%m/%y")
  current_date <- Sys.Date()
  age <- as.numeric(difftime(current_date, dob, units = "weeks")) %/% 52.25
  return(dob)
}

print(get_date(class_data_file$DateOfBirth))
