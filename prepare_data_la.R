# This code is for preparing Google mobility data for the Local Authority report

google <- read_csv(google_path)

google <- google %>%
    filter(country_region == "United Kingdom")

## Geography lookup
geo_lookup <- read_csv("https://raw.githubusercontent.com/datasciencecampus/google-mobility-reports-data/master/geography/Google_Places_Lookup_Table_200417.csv")


## Merge the Google and geo lookup
google_by_country <- google %>%
    left_join(geo_lookup, by = c("sub_region_1" = "GPL_NM")) %>%
    mutate(
        REGION_NM = case_when(
            REGION_NM %in% c("Wales", "Scotland", "Northern Ireland") ~ REGION_NM,
            is.na(sub_region_1) ~ "United Kingdom",
            TRUE ~ "England")) %>%
    pivot_longer(cols = retail_and_recreation_percent_change_from_baseline:
                     residential_percent_change_from_baseline,
                 names_to = "variable", values_to = "value") %>%
    mutate(
        variable = case_when(
            variable == "grocery_and_pharmacy_percent_change_from_baseline" ~ "Supermarkets and pharmacy",
            variable == "parks_percent_change_from_baseline" ~ "Parks",
            variable == "residential_percent_change_from_baseline" ~ "Residential",
            variable == "retail_and_recreation_percent_change_from_baseline" ~ "Retail and recreation",
            variable == "transit_stations_percent_change_from_baseline" ~ "Public transport",
            variable == "workplaces_percent_change_from_baseline" ~ "Workplaces"
            
        )
    )

## Get Wales data and impute missing values

wales <- google_by_country %>%
    filter(REGION_NM == "Wales",
           variable %in% c("Retail and recreation", "Supermarkets and pharmacy",
                           "Public transport", "Workplaces"))


## Remove seasonality, impute with locf, and create new dataframe

wales_la_rolling_avg <- wales %>%
    arrange(sub_region_1, variable, date) %>%
    group_by(sub_region_1, variable) %>%
    mutate(
        rolling_avg = rollapply(value, 7, mean, align = "right", fill = NA)
    )

## Plot this stuff

wales_la_rolling_avg %>%
    filter(sub_region_1 == 'Blaenau Gwent') %>%
    ggplot(aes(x = date, y = rolling_avg, col = variable)) +
    geom_line()

wales_la_rolling_avg <- wales_la_rolling_avg %>%
    group_by(variable, date) %>%
    mutate(var_avg = mean(rolling_avg, na.rm = T)) %>%
    ungroup()

