library(tidyverse)
library(dslabs)
data("murders")

# Joinning table =================================
view(murders)
view(results_us_election_2016)

# cek isi kolom state di dua data sama atau tidak
identical(results_us_election_2016$state, murders$state)

tab <- left_join(murders, results_us_election_2016, by = "state") %>% select(-others) %>% rename(ev = electoral_votes)
view(tab)


# cari tahu hubungan populasi dengan pemilihan
install.packages("ggrepel")
library(ggrepel)

tab %>% ggplot(aes(population/10^6, ev, label = abb)) + geom_point() + geom_text_repel() + scale_x_continuous(trans = "log2") + scale_y_continuous("log2") + geom_smooth(method = "lm", se = FALSE)


tab_1 <- slice(murders, 1:6) %>% select(state, population)
tab_1

tab_2 <- results_us_election_2016 %>% filter(state %in% c("Alabama", "Alaska", "Arizona", "California", "Connecticut", "Delaware")) %>% select(state, electoral_votes) %>% rename(ev = electoral_votes)
tab_2

# left join ========= gabungin data sesuai data di tab 1
left_join(tab_1, tab_2, by = "state")

# right join ======== gabungin data sesuai data di tab 2
right_join(tab_1, tab_2, by = "state")

# inner join ======== gabungin data-data yang sama aja
inner_join(tab_1, tab_2, by = "state")

# full join ========= gabungin semua tabel
full_join(tab_1, tab_2, by = "state")

# semi join ======== menampilkan data mana aja data tab 1 yang ada di tab 2
semi_join(tab_1, tab_2, by = "state")

# anti join ======== ngecek data tab 1 yang ga ada di tab ke 2
anti_join(tab_1, tab_2, by = "state")
