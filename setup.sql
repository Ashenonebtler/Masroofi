-- Masroofi database setup. Paste this whole file into Supabase: SQL Editor -> New query -> Run.
create table if not exists public.docs (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  path       text not null,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, path)
);

alter table public.docs enable row level security;

drop policy if exists "owner reads own docs"   on public.docs;
drop policy if exists "owner inserts own docs" on public.docs;
drop policy if exists "owner updates own docs" on public.docs;
drop policy if exists "owner deletes own docs" on public.docs;

create policy "owner reads own docs"   on public.docs for select to authenticated using (user_id = auth.uid());
create policy "owner inserts own docs" on public.docs for insert to authenticated with check (user_id = auth.uid());
create policy "owner updates own docs" on public.docs for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "owner deletes own docs" on public.docs for delete to authenticated using (user_id = auth.uid());

revoke all on public.docs from anon;
grant select, insert, update, delete on public.docs to authenticated;
