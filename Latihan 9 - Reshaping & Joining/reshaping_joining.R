library(tidyverse)
library(dslabs)
library(ggplot2)

# Reshaping dataset =============================================

path <- system.file("extdata", package = "dslabs") # fungsi utk mendefinisikan path
path

filename <- file.path(path, "fertility-two-countries-example.csv")
filename

wide_data <- read.csv(filename)
view(wide_data)

# mentranformasikan dataset menjadi bentuk tidy
# new_tidy_data <- gather(wide_data, year, fertility, 'X1960':'X2015') 
new_tidy_data <- wide_data %>% gather( key = year, value = fertility, 'X1960':'X2015')
new_tidy_data

# untuk convert ke tipe data seharusnya pake convert. 
# -country itu berarti mengumpulkan data kecuali country
new_tidy_data <- wide_data %>% gather(year, fertility, -country, convert = TRUE)
new_tidy_data

tidy_data <- ggplot(data = new_tidy_data, mapping = aes(x = year, y = fertility, color = country)) + geom_point()
tidy_data


# mengembalikan data dari tidy(data yg rapih) menjadi semula
new_wide_data <- new_tidy_data %>% spread(key = year, value = fertility)
view(new_wide_data)
