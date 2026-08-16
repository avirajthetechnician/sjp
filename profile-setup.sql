-- SJP FORUM PROFILE UPGRADE
-- Run once in Supabase SQL Editor.

alter table public.forum_profiles
  add column if not exists bio text not null default '' check (char_length(bio) <= 500),
  add column if not exists avatar_url text not null default '';

create index if not exists forum_profiles_display_name_idx
  on public.forum_profiles(display_name);
