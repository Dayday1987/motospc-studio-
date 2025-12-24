Postgres / Supabase

Core Tables

Manufacturers
sql
•	id (uuid, pk)
•	name (text)
•	slug (text, unique)

motorcycle_models
sql
•	id (uuid, pk)
•	manufacturer_id (fk)
•	name (text)
•	slug (text)
•	production_start_year (int)
•	production_end_year (int, nullable)

motorcycle_variants (One row per model/year)
sql
•	id (uuid, pk)
•	model_id (fk)
•	year (int)
•	engine_cc (int)
•	engine_type (text)
•	horsepower (int, nullable)
•	torque (int, nullable)
•	wet_weight_lbs (int, nullable)
•	seat_height_mm (int, nullable)
•	wheelbase_mm (int, nullable)

Users & Garage
profiles
sql
•	id (uuid, pk)  -- matches auth.users.id
•	display_name (text)
•	created_at (timestamp)

garage_motorcycles
sql
•	id (uuid, pk)
•	user_id (fk)
•	variant_id (fk)
•	nickname (text)
•	created_at (timestamp)

Parts System
part_categories
sql
•	id (uuid, pk)
•	name (text)
•	slug (text)

parts
sql
•	id (uuid, pk)
•	part_number (text)
•	name (text)
•	category_id (fk)
•	manufacturer (text)
•	base_price_cents (int)
•	weight_delta_lbs (int, nullable)
•	is_oem (boolean)

part_variants
sql
•	id (uuid, pk)
•	part_id (fk)
•	label (text)
•	price_delta_cents (int)

part_compatibility
sql
•	id (uuid, pk)
•	part_id (fk)
•	model_id (fk)
•	year_start (int)
•	year_end (int)

Builds
Builds
sql
•	id (uuid, pk)
•	user_id (fk)
•	garage_motorcycle_id (fk)
•	name (text)
•	created_at (timestamp)

build_parts
sql
•	id (uuid, pk)
•	build_id (fk)
•	part_id (fk)
•	variant_id (fk, nullable)
•	quantity (int)
•	price_snapshot_cents (int)
Price snapshots protect you from future price changes.

Notifications
Notifications
sql
•	id (uuid, pk)
•	user_id (fk)
•	type (text)  -- price_drop, reminder
•	target_id (uuid)
•	scheduled_for (timestamp)
•	sent_at (timestamp, nullable)

3D Assets (Later)
part_assets
sql
•	id (uuid, pk)
•	part_id (fk)
•	model_url (text)
•	material_key (text)

