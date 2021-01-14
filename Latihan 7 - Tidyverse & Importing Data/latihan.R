library(tidyverse)
library(dslabs)
library(dplyr)
data("murders")

# tibble ==============================
tbl_murders <- as_tibble(murders)
tbl_murders

tbl_murders$asdwrasdasd

tbl_murders %>% 
  filter(region == "South" | region == "West") %>% 
  .$total


# map ======================================
jumlah <- function(x){
  y <- 1:x
  sum(y)
}

faktorial <- function(n){
  if (n == 0 || n == 1) {
    result <- 1
  } else {
    deret <- 1:n
    result <- 1
    for (bilangan in deret) {
      result <- result * bilangan
    }
    tibble(bilangan = n,hasil = result)
  }
}

# cara biasa
list <- 1:4
hasil <- sapply(list, jumlah)
hasil
class(hasil)

# cara map
list <- 1:4
hasil <- map(list, jumlah) # bentuk class list
hasil <- map_dbl(list, jumlah) # bentuk class numeric
hasil <- map_df(list, faktorial)# ngebuat nilai dalam bentuk data frame
hasil
class(hasil)


# Tidyverse conditional ====================
x <- -2:2
case_when(
  x < 0 ~ "Negatif",
  x > 0 ~ "Positif",
  TRUE ~ "Nol"
)

# importing data ==================
install.packages("here")
library(here) # untuk dapetin lokasi file
here()
# library(readxl) untuk ngebaca xlsx
# hotel <- read_xlsx(here("sub folder", "nama dataset.xlsx"))

# ngebaca csv
# iris <- read.csv(here("sub folder", "nama dataset.xlsx"))

# install.packages("vroom") utk ngebuat tabel dalam bentuk tibble
# library(vroom)
# iris <- vroom(here("sub folder", "nama dataset.xlsx"))