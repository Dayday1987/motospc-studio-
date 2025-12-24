--------------------------------------------------
-- 001_initial_schema.sql
-- Supabase / Postgres MVP schema for MotoSpec Studio
--------------------------------------------------

-- Enable UUID extension
create extension if not exists "uuid-ossp";

--------------------------------------------------
-- Core Tables
--------------------------------------------------

-- Manufacturers
create table manufacturers (
    id uuid primary key default uuid_generate_v4(),
    name text not null,
    slug text unique not null
);

-- Motorcycle Models
create table motorcycle_models (
    id uuid primary key default uuid_generate_v4(),
    manufacturer_id uuid references manufacturers(id) on delete cascade,
    name text not null,
    slug text not null,
    production_start_year int not null,
    production_end_year int
);

-- Motorcycle Variants (one row per model/year)
create table motorcycle_variants (
    id uuid primary key default uuid_generate_v4(),
    model_id uuid references motorcycle_models(id) on delete cascade,
    year int not null,
    engine_cc int not null,
    engine_type text not null,
    horsepower int,
    torque int,
    wet_weight_lbs int,
    seat_height_mm int,
    wheelbase_mm int
);

--------------------------------------------------
-- Users & Garage
--------------------------------------------------

-- Profiles
create table profiles (
    id uuid primary key,  -- matches auth.users.id
    display_name text,
    created_at timestamp default now()
);

-- Garage Motorcycles
create table garage_motorcycles (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references profiles(id) on delete cascade,
    variant_id uuid references motorcycle_variants(id) on delete cascade,
    nickname text,
    created_at timestamp default now()
);

--------------------------------------------------
-- Parts System
--------------------------------------------------

-- Part Categories
create table part_categories (
    id uuid primary key default uuid_generate_v4(),
    name text not null,
    slug text not null
);

-- Parts
create table parts (
    id uuid primary key default uuid_generate_v4(),
    part_number text not null,
    name text not null,
    category_id uuid references part_categories(id) on delete cascade,
    manufacturer text,
    base_price_cents int not null,
    weight_delta_lbs int,
    is_oem boolean default false
);

-- Part Variants
create table part_variants (
    id uuid primary key default uuid_generate_v4(),
    part_id uuid references parts(id) on delete cascade,
    label text,
    price_delta_cents int
);

-- Part Compatibility
create table part_compatibility (
    id uuid primary key default uuid_generate_v4(),
    part_id uuid references parts(id) on delete cascade,
    model_id uuid references motorcycle_models(id) on delete cascade,
    year_start int not null,
    year_end int
);

--------------------------------------------------
-- Builds
--------------------------------------------------

create table builds (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references profiles(id) on delete cascade,
    garage_motorcycle_id uuid references garage_motorcycles(id) on delete cascade,
    name text,
    created_at timestamp default now()
);

create table build_parts (
    id uuid primary key default uuid_generate_v4(),
    build_id uuid references builds(id) on delete cascade,
    part_id uuid references parts(id) on delete cascade,
    variant_id uuid references part_variants(id),
    quantity int default 1,
    price_snapshot_cents int not null
);

--------------------------------------------------
-- Notifications
--------------------------------------------------

create table notifications (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references profiles(id) on delete cascade,
    type text not null,   -- price_drop, reminder
    target_id uuid,
    scheduled_for timestamp,
    sent_at timestamp
);

--------------------------------------------------
-- 3D Assets (Later)
--------------------------------------------------

create table part_assets (
    id uuid primary key default uuid_generate_v4(),
    part_id uuid references parts(id) on delete cascade,
    model_url text,
    material_key text
);
