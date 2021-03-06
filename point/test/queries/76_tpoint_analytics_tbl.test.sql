-------------------------------------------------------------------------------
--
-- This MobilityDB code is provided under The PostgreSQL License.
--
-- Copyright (c) 2016-2021, Université libre de Bruxelles and MobilityDB
-- contributors
--
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for any purpose, without fee, and without a written 
-- agreement is hereby granted, provided that the above copyright notice and
-- this paragraph and the following two paragraphs appear in all copies.
--
-- IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
-- DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
-- LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
-- EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY 
-- OF SUCH DAMAGE.
--
-- UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES, 
-- INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
-- AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
-- AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO 
-- PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS. 
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

-- set parallel_tuple_cost=0;
-- set parallel_setup_cost=0;
set force_parallel_mode=regress;

--------------------------------------------------------

SELECT st_astext(temp::geometry) FROM tbl_tgeompoint LIMIT 10;
SELECT st_astext(temp::geometry) FROM tbl_tgeompoint3D LIMIT 10;

SELECT temp::geometry FROM tbl_tgeompoint LIMIT 10;
SELECT temp::geometry FROM tbl_tgeompoint3D LIMIT 10;

SELECT st_astext(temp::geography) FROM tbl_tgeogpoint LIMIT 10;
SELECT st_astext(temp::geography) FROM tbl_tgeogpoint3D LIMIT 10;

SELECT temp::geography FROM tbl_tgeogpoint LIMIT 10;
SELECT temp::geography FROM tbl_tgeogpoint3D LIMIT 10;

--------------------------------------------------------

SELECT st_astext(asGeometry(temp, true)) FROM tbl_tgeompoint LIMIT 10;
SELECT st_astext(asGeometry(temp, true)) FROM tbl_tgeompoint3D LIMIT 10;

SELECT asGeometry(temp, true) FROM tbl_tgeompoint LIMIT 10;
SELECT asGeometry(temp, true) FROM tbl_tgeompoint3D LIMIT 10;

SELECT st_astext(asGeography(temp, true)) FROM tbl_tgeogpoint LIMIT 10;
SELECT st_astext(asGeography(temp, true)) FROM tbl_tgeogpoint3D LIMIT 10;

SELECT asGeography(temp, true) FROM tbl_tgeogpoint LIMIT 10;
SELECT asGeography(temp, true) FROM tbl_tgeogpoint3D LIMIT 10;

-------------------------------------------------------------------------------

SELECT asText((temp::geometry)::tgeompoint) FROM tbl_tgeompoint LIMIT 10;
SELECT asText((temp::geometry)::tgeompoint) FROM tbl_tgeompoint3D LIMIT 10;

SELECT count(*) FROM tbl_tgeompoint WHERE (temp::geometry)::tgeompoint = temp;
SELECT count(*) FROM tbl_tgeompoint3D WHERE (temp::geometry)::tgeompoint = temp;

SELECT asText((temp::geography)::tgeogpoint) FROM tbl_tgeogpoint LIMIT 10;
SELECT asText((temp::geography)::tgeogpoint) FROM tbl_tgeogpoint3D LIMIT 10;

SELECT (temp::geography)::tgeogpoint FROM tbl_tgeogpoint LIMIT 10;
SELECT (temp::geography)::tgeogpoint FROM tbl_tgeogpoint3D LIMIT 10;

-------------------------------------------------------------------------------

SELECT st_astext(geoMeasure(t1.temp, t2.temp)) FROM tbl_tgeompoint t1, tbl_tfloat t2 WHERE getTime(t1.temp) && getTime(t2.temp);
SELECT st_astext(geoMeasure(t1.temp, t2.temp)) FROM tbl_tgeompoint3D t1, tbl_tfloat t2 WHERE getTime(t1.temp) && getTime(t2.temp);

SELECT st_astext(geoMeasure(temp, round(speed(temp),2))) FROM tbl_tgeompoint WHERE speed(temp) IS NOT NULL;
SELECT st_astext(geoMeasure(temp, round(speed(temp),2))) FROM tbl_tgeompoint3D WHERE speed(temp) IS NOT NULL;

-------------------------------------------------------------------------------

SELECT MAX(numInstants(simplify(temp, 4))) FROM tbl_tfloat;
SELECT MAX(numInstants(simplify(temp, 4))) FROM tbl_tgeompoint;

-------------------------------------------------------------------------------

-- set parallel_tuple_cost=100;
-- set parallel_setup_cost=100;
set force_parallel_mode=off;

-------------------------------------------------------------------------------
