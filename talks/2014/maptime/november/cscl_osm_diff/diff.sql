/*
	Make sure to also check out `revised_diff.sql`, which contains more
	up-to-date commands.

	`diff.sql` is an incomplete sequential collection of the commands used to
	generate:

		1. A table of all bike lanes exclusive to NY-OSM.
		2. A table of all bike lanes exclusive to CSCL.
		3. A table of all bike lanes inside NY-OSM that intersect with at least
			one in CSCL.
		4. A table of all bike lanes inside CSCL that intersect with at least
			one in NY-OSM.

	The first two tables are essentially good to go, but, to generate the table
	containing all "similar" bike lanes, we'll want to cross-join tables 3 and
	4 on intersections between bike lanes.
*/

create table
	cscl_bike_lanes
as select
	*
from
	cscl
where
	bike_lane is not null;

create table
	new_york_bike_lanes
as select
	*
from
	nyosm
where
	highway='cycleway' or
	(bicycle is not null and bicycle != 'no');

create table
	intersects
as select
	cuid as cgid,
	nuid as nid
from
	cs, ny
where
	st_intersects(
		st_snaptogrid(geom, 0.0005),
		st_snaptogrid(way, 0.0005)
	);

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
	cuid as cgid,
	null as nid
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
	tmp
as select
	*
from
	ny
where
	highway = 'cycleway' or (bicycle is not null and bicycle != 'no');

create table
	cs_no_intersect
as select
	*
from
	cs
inner join
	no_intersects
on
	no_intersects.cgid = cuid;

create table
	ny_no_intersect
as select
	*
from
	ny
inner join
	no_intersects
on
	no_intersects.ngid = nuid;

delete from
	cs
using
	no_intersects
where
	cs.cd = no_intersects.cgid;

delete from
	ny
using
	no_intersects
where
	ny.nd = no_intersects.ngid;
