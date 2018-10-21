
-- install extensions for lat long distance

create extension cube;
create extension earthdistance;

-- geonames tables

create table geon_geoname (
      geonameid         integer
    , name              varchar
    , asciiname         varchar
    , alternatenames    varchar
    , latitude          double precision
    , longitude         double precision
    , feature_class     char(1)
    , feature_code      varchar
    , country_code      char(2)
    , cc2               varchar
    , admin1_code       varchar(20)
    , admin2_code       varchar(80)
    , admin3_code       varchar(20)
    , admin4_code       varchar(20)
    , population        bigint
    , elevation         varchar
    , dem               varchar
    , timezone          varchar(40)
    , modification_date date
);

create table geon_feature_codes (
      code varchar
    , name varchar
    , description varchar
);

create table geon_admin1codes (
      code varchar
    , name varchar
    , name_ascii varchar
    , geoname_id integer
);

create table geon_admin2codes (
      concatenated_codes varchar
    , name varchar
    , asciiname varchar
    , geoname_id integer
);

create table geon_postal_codes (
      country_code char(2)
    , postal_code varchar(20)
    , place_name varchar(180)
    , admin_name1 varchar(100)
    , admin_code1 varchar(20)
    , admin_name2 varchar(100)
    , admin_code2 varchar(20)
    , admin_name3 varchar(100)
    , admin_code3 varchar(20)
    , latitude double precision
    , longitude double precision
    , accuracy char
);
