# MotoSpec Studio — Monetization & Free Trial (MVP)

## Pricing Model
- Subscription-based application
- Single paid tier at launch
- Monthly billing

## Free Trial
- 7-day free trial for new users
- Trial starts on account creation
- No credit card required for MVP

## Trial Access
During the trial, users can:
- Create a Garage
- Create and save builds
- Access full motorcycle specs
- Use parts and configurator

## Trial Expiration
After 7 days:
- Users can still log in
- Users can view existing builds (read-only)
- Creating new builds is disabled
- Editing existing builds is disabled

## Conversion to Paid
- User prompted to subscribe when trial expires
- Subscription unlocks full functionality again
- No data is deleted on expiration

## Enforcement Strategy
- Subscription status stored in user profile
- Frontend checks subscription before allowing writes
- Backend RLS prevents writes when inactive

## Future Enhancements
- Annual plan
- Promo codes
- Team / shop accounts
