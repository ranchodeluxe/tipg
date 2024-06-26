CREATE FUNCTION hexagons(
    IN size int DEFAULT 10,
    IN bounds geometry DEFAULT 'srid=4326;POLYGON((-180 -90,-180 90,180 90,180 -90,-180 -90))'::geometry,
    OUT geom geometry,
    OUT i integer,
    OUT j integer
) RETURNS SETOF RECORD AS $$
    SELECT * FROM st_hexagongrid(size, bounds);
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;

-- Hexagon function but with `g` as geometry input
CREATE FUNCTION hexagons_g(
    IN size int DEFAULT 10,
    IN g geometry DEFAULT 'srid=4326;POLYGON((-180 -90,-180 90,180 90,180 -90,-180 -90))'::geometry,
    OUT geom geometry,
    OUT i integer,
    OUT j integer
) RETURNS SETOF RECORD AS $$
    SELECT * FROM st_hexagongrid(size, g);
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
