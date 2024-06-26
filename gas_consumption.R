# Vo gas go zemame dataset-ot gas_consumption_by_country i prvo gi filtrirame vrednostite na Code
# koi ne ni se poznati (NA), potoa filtrirame po entitet odnosno gi zemame podatocite samo za
# nasata zemja, a potoa gi grupirame po entitet i potrosuvacka na gas vo TWh
gas <- gas_consumption_by_country %>%
  filter(!is.na(Code)) %>%
  filter(Entity == "North Macedonia" ) %>%
  group_by(Entity, `Gas Consumption - TWh`)

# Vo plot_gas pravime graficka prezentacija na data frame-ot gas so podatoci na
# x-oskata za godinata i na y-oskata za potrosuvacka na gasot vo TWh. Potoa odbirame
# da se pretstavi vo forma na linija, za da vidime iminja za oskite i potoa gi naglasuvame varijaciite
# so zelena boja i transparentnost 0.8

plot_gas <- ggplot(data = gas, aes(x = Year, y = `Gas Consumption - TWh`)) +
  geom_line() +
  labs(x = "Year", y = "Gas Consumption (Twh)") +
  geom_jitter(alpha = 0.8, color = "green")
plot(plot_gas)
