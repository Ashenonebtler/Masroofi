# Masroofi

A personal daily expense tracker: separate wallet and bank balances, daily log with categories and times, money in, ATM withdrawals, Thndr transfers, goals, Thndr holdings, and a "Can I afford it?" check.

- Hosted with GitHub Pages (Settings → Pages → Deploy from branch `main`, folder `/root`).
- Data lives in Supabase. `setup.sql` creates the table and the privacy rules, so only the signed-in owner can read or write their numbers.
- `config.js` holds the project URL and publishable key. These are public by design; never put the service_role key here.
- `vendor/supabase.js` is supabase-js 2.49.4 (MIT), bundled so the site does not depend on a CDN.
