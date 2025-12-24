--------------------------------------------------
-- Manufacturers
--------------------------------------------------

insert into manufacturers (name, slug, country)
values
  ('Yamaha', 'yamaha', 'Japan'),
  ('Honda', 'honda', 'Japan'),
  ('Kawasaki', 'kawasaki', 'Japan');

--------------------------------------------------
-- Motorcycles (one row per model/year)
--------------------------------------------------

insert into motorcycles (
  manufacturer_id,
  model_name,
  year,
  engine,
  dimensions,
  weight,
  performance
)
select
  m.id,
  'MT-07',
  2023,
  '{"type":"Parallel Twin","displacement_cc":689}',
  '{"wheelbase_mm":1400}',
  '{"wet_kg":184}',
  '{"hp":74}'
from manufacturers m
where m.slug = 'yamaha';

insert into motorcycles (
  manufacturer_id,
  model_name,
  year,
  engine,
  dimensions,
  weight,
  performance
)
select
  m.id,
  'CB650R',
  2023,
  '{"type":"Inline-4","displacement_cc":649}',
  '{"wheelbase_mm":1450}',
  '{"wet_kg":202}',
  '{"hp":94}'
from manufacturers m
where m.slug = 'honda';

--------------------------------------------------
-- Parts
--------------------------------------------------

insert into parts (
  part_number,
  name,
  category,
  brand,
  base_price,
  is_oem
)
values
  ('YAM-EXH-001', 'Akrapovič Full Exhaust', 'Exhaust', 'Akrapovič', 1299.99, false),
  ('OEM-YAM-BRK-001', 'OEM Front Brake Pads', 'Brakes', 'Yamaha', 89.99, true),
  ('HON-EXH-001', 'SC Project Slip-On', 'Exhaust', 'SC Project', 899.99, false);

--------------------------------------------------
-- Part Compatibility
--------------------------------------------------

insert into part_compatibility (part_id, motorcycle_id)
select
  p.id,
  mc.id
from parts p
join motorcycles mc on mc.model_name = 'MT-07'
where p.part_number in ('YAM-EXH-001', 'OEM-YAM-BRK-001');

insert into part_compatibility (part_id, motorcycle_id)
select
  p.id,
  mc.id
from parts p
join motorcycles mc on mc.model_name = 'CB650R'
where p.part_number = 'HON-EXH-001';
