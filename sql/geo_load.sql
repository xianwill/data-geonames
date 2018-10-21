
copy geon_geoname (
      geonameid        
    , name             
    , asciiname        
    , alternatenames   
    , latitude         
    , longitude        
    , feature_class    
    , feature_code     
    , country_code     
    , cc2              
    , admin1_code      
    , admin2_code      
    , admin3_code      
    , admin4_code      
    , population       
    , elevation        
    , dem              
    , timezone         
    , modification_date
) from '/data/geonames/US.txt' delimiter E'\t';

copy geon_feature_codes (
      code
    , name
    , description
) from '/data/geonames/featureCodes.txt' delimiter E'\t';

copy geon_admin1codes (
      code
    , name
    , name_ascii
    , geoname_id
) from '/data/geonames/admin1CodesASCII.txt' delimiter E'\t';

copy geon_admin2codes (
      concatenated_codes
    , name
    , asciiname
    , geoname_id
) from '/data/geonames/admin2Codes.txt' delimiter E'\t';

copy geon_postal_codes (
      country_code
    , postal_code
    , place_name
    , admin_name1
    , admin_code1
    , admin_name2
    , admin_code2
    , admin_name3
    , admin_code3
    , latitude
    , longitude
    , accuracy
) from '/data/geonames/postal/US.txt' delimiter E'\t';