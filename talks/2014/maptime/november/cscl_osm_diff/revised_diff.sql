/*
	Essentially an updated version of `diff.sql`.
*/

delete from cs where bike_lane is null;
create table
	tmp
as select
	*
from
	ny
where
	highway='cycleway' or
	(bicycle is not null and bicycle != 'no');

drop table ny;
alter table tmp rename to ny;

select addgeometrycolumn('cs', 'geom_2d', 4326, 'MultiLineString', 2);
update
	cs
set
	geom_2d = st_force_2d(geom);

alter table cs drop geom;
alter table cs rename column geom_2d to geom;

create table ny_full as SELECT
	"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
	ST_MakeLine(sp,ep) as way
FROM
	(
		SELECT
			"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
			ST_PointN(geom, generate_series(1, ST_NPoints(geom) - 1)) as sp,
			ST_PointN(geom, generate_series(2, ST_NPoints(geom))) as ep
		FROM
			(
				SELECT
					"osm_id", "access", "addr:housename", "addr:housenumber", "addr:interpolation", "admin_level", "aerialway", "aeroway", "amenity", "area", "barrier", "bicycle", "brand", "bridge", "boundary", "building", "construction", "covered", "culvert", "cutting", "denomination", "disused", "embankment", "foot", "generator:source", "harbour", "highway", "historic", "horse", "intermittent", "junction", "landuse", "layer", "leisure", "lock", "man_made", "military", "motorcar", "name", "natural", "office", "oneway", "operator", "place", "population", "power", "power_source", "public_transport", "railway", "ref", "religion", "route", "service", "shop", "sport", "surface", "toll", "tourism", "tower:type", "tracktype", "tunnel", "water", "waterway", "wetland", "width", "wood", "z_order", "way_area",
					(ST_Dump(way)).geom
				FROM
					ny
			) AS linestrings
	) AS segments;

create table cs_full as SELECT
	gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
	ST_MakeLine(sp,ep) as geom
FROM
	(
		SELECT
			gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
			ST_PointN(geom, generate_series(1, ST_NPoints(geom) - 1)) as sp,
			ST_PointN(geom, generate_series(2, ST_NPoints(geom))) as ep
		FROM
			(
				SELECT
					gid, objectid, segmentid, physicalid, genericid, segment_ty, stname_lab, status, trafdir_ve, nonped, bike_lane, boroughcod, posted_spe, trafdir, rw_type, from_level, to_level_c, shape_len,
					(ST_Dump(geom)).geom
				FROM
					cs
			) AS linestrings
	) AS segments;

drop table cs;
drop table ny;
alter table cs_full rename to cs;
alter table ny_full rename to ny;

create sequence cuid;
create sequence nuid;
alter table cs add cuid int unique;
alter table ny add nuid int unique;
update cs set cuid = nextval('cuid');
update ny set nuid = nextval('nuid');
select addgeometrycolumn('cs', 'snap', 4326, 'LineString', 2);
select addgeometrycolumn('ny', 'snap', 4326, 'LineString', 2);
update cs set snap = st_snaptogrid(geom, 0.0005);
update ny set snap = st_snaptogrid(way, 0.0005);

create table
	intersects
as select
	cuid as cgid,
	nuid as nid
from
	cs, ny
where
	st_intersects(cs.snap, ny.snap);

create tablex
	no_intersects (cd int, nd int);
insert into
	no_intersects
select
	null,
	nuid
from
	ny
where
	(
		select
			count(*)
		from
			intersects
		where
			intersects.nid = nuid
	) = 0;

insert into
	no_intersects
select
	cuid, null
from
	cs
where
	(
		select
			count(*)
		from
			intersects
		where
			intersects.cgid = cuid
	) = 0;

create table
	cs_no_intersect
as select
	*
from
	cs
inner join
	no_intersects
on
	no_intersects.cd = cuid;

create table
	ny_no_intersect
as select
	*
from
	ny
inner join
	no_intersects
on
	no_intersects.nd = nuid;

delete from
	cs
using
	no_intersects
where
	cs.cuid = no_intersects.cd;

delete from
	ny
using
	no_intersects
where
	ny.nuid = no_intersects.nd;
