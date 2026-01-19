INSERT INTO gvs.su_distances (...)
SELECT
  spatial_unit_id,
  dist_metro_entrance_m, dist_pt_stop_m, dist_school_m, dist_kindergarten_m,
  dist_hospital_m, dist_pharmacy_m, dist_supermarket_m, dist_mall_m,
  dist_park_m, dist_water_m, dist_cemetery_m, dist_power_line_m,
  dist_highway_primary_m, dist_railway_m, dist_wastewater_plant_m,
  dist_waste_incineration_m, dist_beach_m, dist_chp_m
FROM gvs.feature_store_v1
ON CONFLICT (spatial_unit_id) DO UPDATE SET
  dist_metro_entrance_m = EXCLUDED.dist_metro_entrance_m,
  ...;

INSERT INTO gvs.su_raster_genplan (spatial_unit_id, gp_band_1, gp_band_2, gp_band_3)
SELECT spatial_unit_id, gp_band_1, gp_band_2, gp_band_3
FROM gvs.feature_store_v1
ON CONFLICT (spatial_unit_id) DO UPDATE
SET gp_band_1=EXCLUDED.gp_band_1, gp_band_2=EXCLUDED.gp_band_2, gp_band_3=EXCLUDED.gp_band_3;

INSERT INTO gvs.su_osm_counts (spatial_unit_id, cnt500_school, cnt500_kindergarten, cnt500_hospital, cnt500_pharmacy, cnt500_pt_stops, cnt500_parks)
SELECT spatial_unit_id, cnt500_school, cnt500_kindergarten, cnt500_hospital, cnt500_pharmacy, cnt500_pt_stops, cnt500_parks
FROM gvs.feature_store_v1
ON CONFLICT (spatial_unit_id) DO UPDATE
SET cnt500_school=EXCLUDED.cnt500_school, ...;
