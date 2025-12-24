# MotoSpec Studio — MVP Supabase Client & Queries

This file outlines the frontend Supabase client setup and the core queries needed for the MVP.

## Supabase Client

File: `src/lib/supabaseClient.ts`

```ts
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```  

## Manufacturers

```ts
export const getManufacturers = async () => {
  const { data, error } = await supabase
    .from('manufacturers')
    .select('*')
  return { data, error }
}
```  

## Motorcycles by Manufacturer

```ts
export const getMotorcycles = async (manufacturerId: string) => {
  const { data, error } = await supabase
    .from('motorcycle_models')
    .select('*')
    .eq('manufacturer_id', manufacturerId)
  return { data, error }
}
```  

## Motorcycle Variants (Model/Year)

```ts
export const getMotorcycleVariants = async (modelId: string) => {
  const { data, error } = await supabase
    .from('motorcycle_variants')
    .select('*')
    .eq('model_id', modelId)
  return { data, error }
}
```  

## User Garage

```ts
export const getUserGarage = async (userId: string) => {
  const { data, error } = await supabase
    .from('garage_motorcycles')
    .select('*, motorcycle_variants(*)')
    .eq('user_id', userId)
  return { data, error }
}
```  

## Parts by Category

```ts
export const getPartsByCategory = async (categoryId: string) => {
  const { data, error } = await supabase
    .from('parts')
    .select('*')
    .eq('category_id', categoryId)
  return { data, error }
}
```  

## Save Build

```ts
export const saveBuild = async (build: any) => {
  const { data, error } = await supabase
    .from('builds')
    .insert(build)
  return { data, error }
}
