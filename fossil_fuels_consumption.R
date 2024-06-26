# Vo fossil_change go zemame dataset-ot fossil.fuel.primary.energy i prvo gi filtrirame vrednostite
# na Code koi ne ni se poznati (NA), potoa filtrirame po entitet odnosno gi zemame podatocite samo za
# nasata zemja, a potoa gi grupirame po entitet i potrosuvacka na fosilnite goriva vo TWh
fossil_change <- fossil_fuel_primary_energy %>%
  filter(!is.na(Code)) %>%
  filter(Entity == "North Macedonia" ) %>%
  group_by(Entity,`Fossil Fuels (TWh)`)

# Vo plot2_fossil pravime graficka prezentacija na data frame-ot fossil_change so podatoci na
# x-oskata za godinata i na y-oskata za potrosuvacka na fosilnite goriva vo TWh. Potoa odbirame
# da se pretstavi vo forma na linija, zadavime iminja za oskite i potoa gi naglasuvame varijaciite
# so sina boja i transparentnost 0.9

plot2_fossil <- ggplot(data = fossil_change, aes(x = Year, y = `Fossil Fuels (TWh)`)) +
  geom_line() +
  labs(x = "Year", y = "Fossil Fuels (Twh)") +
  geom_jitter(alpha = 0.9, color = "blue")

# Go prikazuvame grafikot plot2_fossil koj e isto taka iskoristen vo tehnickata dokumentacija
plot(plot2_fossil)


