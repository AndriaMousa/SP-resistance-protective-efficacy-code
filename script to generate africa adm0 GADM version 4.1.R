# Load required packages
#install.packages(c("sf", "rnaturalearth", "raster"))  # Install if not installed
library(sf)
library(raster)
library(rnaturalearth)
library(dplyr)
library(ggplot2)

## manually download geopackage for the whole world : https://gadm.org/download_world.html
# the current file is called gadm_410-levels and is not provided in the repo due to file restrictions
# Set file path after you have manually downloaded the file
gadm_file <- "....../gadm_410-levels.gpkg"  # Adjust path 

# Step 1: Read the GADM file (Admin 0 = country level)
gadm_data <- st_read(gadm_file, layer = "ADM_0")

# Step 2: Get a list of African countries from 'rnaturalearth'
africa_countries <- ne_countries(continent = "Africa", returnclass = "sf") %>%
  dplyr::select(iso_a3, name)  # Explicitly use dplyr::select

# Step 3: Filter the GADM data to include only African countries
gadm_africa <- gadm_data %>%
  filter(GID_0 %in% africa_countries$iso_a3)

# Step 4: 
#Save as a new file
output_file <- "GADM_Africa_Admin0.gpkg"
st_write(gadm_africa, output_file, delete_layer = TRUE)

# Save as a new Shapefile (.shp)
output_shp <- "GADM_Africa_Admin0.shp"
st_write(gadm_africa, output_shp, delete_layer = TRUE)

ggplot(data = gadm_africa) +
  geom_sf() +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    plot.caption = element_text(size = 10)
  )
# Check if any geometries are invalid
invalid_geometries <- gadm_africa %>% st_is_valid() %>% which(!.)

# Attempt to fix invalid geometries
gadm_africa_fixed <- gadm_africa %>% st_make_valid()

# Simplify the geometry after fixing
gadm_africa_simple <- gadm_africa_fixed %>% st_simplify(dTolerance = 0.01)

# Plot the simplified map
ggplot(data = gadm_africa_simple) +
  geom_sf() +
  theme_minimal()

##to check for Benin where the boundaries seemed to be invalid
benin <- gadm_africa_simple %>% filter(COUNTRY=="Benin")

ggplot(data = benin) +
  geom_sf() +
  theme_minimal()

st_write(gadm_africa_simple, "data/GADM_Africa_Admin0.shp")
