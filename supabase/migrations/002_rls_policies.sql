--------------------------------------------------
-- Enable RLS
--------------------------------------------------

alter table profiles enable row level security;
alter table garage_bikes enable row level security;
alter table builds enable row level security;
alter table build_parts enable row level security;

--------------------------------------------------
-- Profiles
--------------------------------------------------

create policy "Users can view own profile"
on profiles
for select
using (id = auth.uid());

create policy "Users can update own profile"
on profiles
for update
using (id = auth.uid());

--------------------------------------------------
-- Garage Bikes
--------------------------------------------------

create policy "Users can manage own garage bikes"
on garage_bikes
for all
using (user_id = auth.uid());

--------------------------------------------------
-- Builds
--------------------------------------------------

create policy "Users can manage own builds"
on builds
for all
using (
  garage_bike_id in (
    select id from garage_bikes where user_id = auth.uid()
  )
);

--------------------------------------------------
-- Build Parts
--------------------------------------------------

create policy "Users can manage own build parts"
on build_parts
for all
using (
  build_id in (
    select b.id
    from builds b
    join garage_bikes gb on gb.id = b.garage_bike_id
    where gb.user_id = auth.uid()
  )
);
