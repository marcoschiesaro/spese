-- Puoi eseguirlo più volte senza errori. Incollalo nel SQL Editor di Supabase e premi Run.
create table if not exists public.expenses (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  id text not null,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);
alter table public.expenses enable row level security;

drop policy if exists "select_own" on public.expenses;
drop policy if exists "insert_own" on public.expenses;
drop policy if exists "update_own" on public.expenses;
drop policy if exists "delete_own" on public.expenses;
create policy "select_own" on public.expenses for select using (auth.uid() = user_id);
create policy "insert_own" on public.expenses for insert with check (auth.uid() = user_id);
create policy "update_own" on public.expenses for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete_own" on public.expenses for delete using (auth.uid() = user_id);

do $$
begin
  if not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'expenses') then
    alter publication supabase_realtime add table public.expenses;
  end if;
end $$;
