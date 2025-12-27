# MotoSpec Studio — Access & Authentication (MVP)

## Authentication
- Supabase Auth
- Email + password (MVP)
- OAuth providers later

## Public Access (No Login)
- View manufacturers
- View motorcycle models
- View basic specs
- No saving or builds

## Authenticated Users
- Create and manage Garage
- Create builds
- Save configurations
- Receive notifications

## Ownership Rules
- Users can only read/write their own:
  - garage_motorcycles
  - builds
  - build_parts
  - notifications

## Admin Access
- Manage manufacturers
- Manage models and variants
- Manage parts and compatibility
- Import and edit reference data

## Enforcement
- Supabase Row Level Security (RLS)
- Admin access via role or email allowlist
