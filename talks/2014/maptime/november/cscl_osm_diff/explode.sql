/*
	Explodes MultiLineStrings into multiple LineStrings.
*/

select
	"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
	-- gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
	ST_MakeLine(sp,ep)
from
-- extract the endpoints for every 2-point line segment for each linestring
	(
		select
			"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
			-- gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
			ST_PointN(geom, generate_series(1, ST_NPoints(geom) - 1)) as sp,
			ST_PointN(geom, generate_series(2, ST_NPoints(geom))) as ep
		from
			-- extract the individual linestrings
			(
				select
					"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
					-- gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
					(ST_Dump(way)).geom
				from
					nyosm
			) as linestrings
	) as segments;
