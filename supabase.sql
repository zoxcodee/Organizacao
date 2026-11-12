-- Cole e execute no Supabase: SQL Editor > New query > Run
create table if not exists public.finance_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.finance_data enable row level security;
create policy "ler proprio"      on public.finance_data for select using (auth.uid() = user_id);
create policy "inserir proprio"  on public.finance_data for insert with check (auth.uid() = user_id);
create policy "atualizar proprio" on public.finance_data for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "apagar proprio"   on public.finance_data for delete using (auth.uid() = user_id);
