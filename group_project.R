options(width = 200)

# Read the data from a csv
class_data_file <- read.csv("class_attendance.csv")
# class_output_file <- read.csv("output.csv") # nolint: commented_code_linter.


# Gets the date of the student from the dataframe
get_date <- function(my_data) {
  class_age <- c()
  for (name in my_data["DateOfBirth"]) {
    student_age <- as.integer(substring(name, nchar(name) - 1, nchar(name) - 0)) # nolint
    class_age <- append(class_age, student_age)
  }
  return(class_age)
}

# Calculate the age from a vector of date string
age_calculate <- function(age_vector) {
  student_age_list <- c()
  present_date <- 24
  sub_date <- 0
  for (date in age_vector) {
    if (date > 24) {
      sub_date <- 100 - date
    } else {
      sub_date <- 0
    }
    if (sub_date > 0) {
      student_age_list <- append(student_age_list, (present_date + sub_date))
    } else {
      student_age_list <- append(student_age_list, (present_date - date))
    }
  }
  return(student_age_list)
}

new_class_age_list <- get_date(class_data_file)

age_number_list <- age_calculate(new_class_age_list)

# Creates a data frame for the new age
age_data_frame <- data.frame(Age = age_number_list)

# Combines the two data frame
class_attendance <- cbind.data.frame(class_data_file, age_data_frame)

# Writes the data to a CSV file
write.csv(class_attendance, file = "output.csv", row.names = FALSE, quote = FALSE) # nolint

print.data.frame(class_attendance)
