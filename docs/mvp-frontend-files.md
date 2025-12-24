# MotoSpec Studio — MVP Frontend Files & Components

This file outlines the folder and component structure for the frontend of MotoSpec Studio.

## Folder Structure (inside apps/web/src/)

src/
├─ app/
│  ├─ layout.tsx          # Main layout (header/footer)
│  ├─ page.tsx            # Homepage / Motorcycle Catalog
│  └─ garage/
│     └─ [userId]/        # Dynamic routes for user garage & builds
├─ components/            # Reusable components
│  ├─ Navbar.tsx
│  ├─ CardMotorcycle.tsx
│  ├─ BuildConfigurator.tsx
│  ├─ PartSelector.tsx
│  └─ BuildSummary.tsx
├─ lib/                   # API clients & helpers
│  └─ supabaseClient.ts
├─ types/                 # TypeScript types
│  ├─ motorcycle.ts
│  └─ part.ts
└─ styles/                # Tailwind / global styles

---

## Core Pages / Routes

| Route | Purpose |
|-------|---------|
| `/` | Motorcycle catalog overview |
| `/motorcycles/[id]` | Detailed specs & “Add to Garage” |
| `/garage` | User saved motorcycles |
| `/garage/[garageBikeId]/builds` | Build configurator |
| `/build/[buildId]` | Saved build summary / export |

---

## Components (Description)

- **Navbar** → Navigation + login/logout + trial notice  
- **CardMotorcycle** → Displays a motorcycle in catalog / search  
- **BuildConfigurator** → Add/remove parts for a bike  
- **PartSelector** → Dropdown/modal for parts with compatibility filter  
- **BuildSummary** → Shows build details, price, and spec changes  

---

## Notes

- All API calls will go through `lib/supabaseClient.ts`  
- TailwindCSS is used for styling  
- Mobile-first design, minimal animations for MVP  
- File structure is ready to drop into Next.js once environment is available
