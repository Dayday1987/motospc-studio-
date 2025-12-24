# MotoSpec Studio

MotoSpec Studio is a web-based motorcycle specification, parts, and build configuration platform.  
It allows users to explore motorcycle specs, manage a personal garage, configure builds with compatible OEM and aftermarket parts, and save price-stable build snapshots.

The product is designed as a paid web app with a free trial period.

---

## Project Status

This project is under active development.

**Completed:**
- Database schema (Postgres / Supabase)
- Row Level Security (RLS) policies
- Seed data for motorcycles, parts, and compatibility
- Product and technical documentation

**In Progress / Next:**
- Frontend initialization (Next.js)
- Supabase client integration
- Motorcycle catalog UI
- User garage and build configurator

---

## Tech Stack (Planned / Locked)

- **Frontend:** Next.js (App Router, TypeScript)
- **Backend:** Supabase
- **Database:** PostgreSQL (Supabase)
- **Auth:** Supabase Auth
- **Hosting:** Vercel (free tier)
- **Payments:** Stripe (planned)

---

## Repository Structure

```text
apps/
  web/              # Next.js frontend app

docs/
  product/          # Product planning and MVP docs
  technical/        # Architecture, data model, stack decisions

packages/
  db/               # Shared database utilities (future)
  jobs/             # Background jobs / workers (future)
  seed/             # Seed helpers (future)
  shared/           # Shared types and utilities

supabase/
  migrations/       # Database schema, RLS, seed data
