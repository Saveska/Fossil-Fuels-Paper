# Vo oil go zemame dataset-ot oil_consumption_by_country i prvo gi filtrirame vrednostite na Code
# koi ne ni se poznati (NA), potoa filtrirame po entitet odnosno gi zemame podatocite samo za
# nasata zemja, a potoa gi grupirame po entitet i potrosuvacka na nafta vo TWh

oil <- oil_consumption_by_country %>%
  filter(!is.na(Code)) %>%
  filter(Entity == "North Macedonia" ) %>%
  group_by(Entity, `Oil Consumption - TWh`)


# Vo plot_oil pravime graficka prezentacija na data frame-ot oil so podatoci na
# x-oskata za godinata i na y-oskata za potrosuvacka na naftata vo TWh. Potoa odbirame
# da se pretstavi vo forma na linija, za da vidime iminja za oskite i potoa gi naglasuvame varijaciite
# so crvena boja i transparentnost 0.8


plot_oil <- ggplot(data = oil, aes(x = Year, y = `Oil Consumption - TWh`)) +
  geom_line() +
  labs(x = "Year", y = "Oil Consumption (Twh)") +
  geom_jitter(alpha = 0.8, color = "red")
plot(plot_oil)
