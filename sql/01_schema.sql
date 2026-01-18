SELECT
  COUNT(*) AS total,
  COUNT(gp_band_1) AS has_gp1,
  COUNT(gp_band_2) AS has_gp2,
  COUNT(gp_band_3) AS has_gp3
FROM gvs.feature_store_v1;
