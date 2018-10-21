

select *
from geon_geoname g
where g.admin2_code = '109'
  and g.admin1_code = 'FL'
;


select
       p1.place_name,
       p2.place_name,
       p1.postal_code,
       p2.postal_code,
       (point(p1.longitude, p1.latitude) <@> point(p2.longitude, p2.latitude)) as distance
from geon_postal_codes p1
cross join geon_postal_codes p2
where
    p1.postal_code = '20500'
        and p2.postal_code in (
        '32202',
        '10001'
        )
order by p1.postal_code, p2.postal_code
;
