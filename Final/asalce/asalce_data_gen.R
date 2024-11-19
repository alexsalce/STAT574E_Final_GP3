# This file documents all R scripts used to generate and clean data

####################
# Get all AZ roads #
####################

# az_fips <- fips_codes %>%
#   filter(state == "AZ") %>%
#   pull(state_code) %>%
#   unique()
#
# # Get all counties in the state
# az_counties <- counties(state = az_fips, cb = TRUE)
#
# # Fetch roads for all counties and combine into one sf object
# az_roads <- map_dfr(az_counties$COUNTYFP, function(county) {
#   roads(state = az_fips, county = county)
#   }) %>% st_as_sf()




#######################
# FILTER ALL AZ ROADS #
#######################
#
# az_rd_primary <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1100"))  # Primary  roads
#
# az_rd_secondary <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1200"))  # Secondary roads
#
# az_rd_local <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1400"))  # Local and neighborhood roads
#
# az_rd_4wd <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1500"))  # 4WD roads
#
# az_rd_ramp <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1630"))  # Ramps and interchanges
#
# az_rd_frontage <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1640"))  # Frontage roads
#
# az_rd_ped_trail <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1710"))  # Pedestrian walkway or trail
#
# az_rd_ped_stairs <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1720"))  # Stairways
#
# az_rd_alleys <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1730"))  # Alleyways
#
# az_rd_privateservice <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1740"))  # Private service roads
#
# az_rd_census <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1750"))  # US Census Buereau use only
#
# az_rd_parkinglot <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1780"))  # Parking lot road
#
# az_rd_wintertrail <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1810"))  # Winter trail
#
# az_rd_bikepath <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1820"))  # Bike path or trail, no motorized vehicles
#
# az_rd_bridle <- az_roads_sf %>%
#   filter(MTFCC %in% c("S1830"))  # Horse trail, no motorized vehicles




############################################
#GENERATE CLOSEST ROAD TO WILDFIRE DIST (m)#
############################################

# wfigs_az_sf$distance_rd_primary <-
#   st_distance(wfigs_az_sf, az_rd_primary) %>% apply(1, min)
#
# wfigs_az_sf$distance_rd_secondary <-
#   st_distance(wfigs_az_sf, az_rd_secondary) %>% apply(1, min)
#
# wfigs_az_sf$distance_rd_4wd <-
#   st_distance(wfigs_az_sf, az_rd_4wd) %>% apply(1, min)

# wfigs_az_sf <- wfigs_az_sf %>% filter(distance_rd_primary <= 1000)


#####################
#ORIGINAL ROADS PLOT#
#####################
# Arizona Roads

# mapview(arizona_sf, col.regions = "snow") +
#   mapview(az_rd_primary$geometry, color = "black", alpha = 0.8) +
#   mapview(az_rd_secondary$geometry, color = "lawngreen", alpha = 0.8) +
#   mapview(az_rd_4wd$geometry, color = "gray", lwd = 1)
# mapview(az_rd_frontage$geometry, color = "orange", lwd = 1) +
# mapview(az_rd_privateservice$geometry, color = "blue", lwd = 1) +
# mapview(az_rd_local$geometry, color = "red", lwd = 1)

# do not use: census, alleys, bikepath, bridle, parkinglot, ped_stairs, ped_trail, ramps, wintertraiil

#  maybes: privateservice - ALL over the place, and connect major roads. however you may get enough information from others
# frontage roads - not a lot added information
# local - WAY too much data



########################
#UNUSED ROAD DATA PLOTS#
########################
#
#
# layout(matrix(1:2, 1, 2))
# par(mar = c(1, 1, 1, 1))
#
# plot(arizona_sf$geometry, main = "Alleys")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_alleys$geometry, col = "deeppink3", lwd = 1, add = T)
#
# plot(arizona_sf$geometry, main = "Bike Paths")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_alleys$geometry, col = "deeppink3", lwd = 1, add = T)
#
#
#
# layout(matrix(1:2, 1, 2))
# par(mar = c(1, 1, 1, 1))
#
# plot(arizona_sf$geometry, main = "Census")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_census$geometry, col = "deeppink3", lwd = 0.5, add = T)
#
#
# plot(arizona_sf$geometry, main = "Frontage")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_frontage$geometry, col = "deeppink3", lwd = 0.5, add = T)
#
#
# layout(matrix(1:2, 1, 2))
# par(mar = c(1, 1, 1, 1))
#
# plot(arizona_sf$geometry, main = "Local")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_local$geometry, col = "deeppink3", lwd = 0.5, add = T)
#
#
# plot(arizona_sf$geometry, main = "Parking Lot")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_parkinglot$geometry, col = "deeppink3", lwd = 0.5, add = T)
#
#
# layout(matrix(1:2, 1, 2))
# par(mar = c(1, 1, 1, 1))
#
# plot(arizona_sf$geometry, main = "Private Service Roads")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_privateservice$geometry, col = "deeppink3", lwd = 0.5, add = T)
#
#
# plot(arizona_sf$geometry, main = "Ramps and Interchanges")
# plot(az_rd_4wd$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_primary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_secondary$geometry, col = "gray80", add = T, lwd = 0.1)
# plot(az_rd_ramp$geometry, col = "deeppink3", lwd = 0.5, add = T)


########################
##
########################