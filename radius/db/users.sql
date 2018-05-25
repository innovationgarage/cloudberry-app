create database radius;
create user radius;
alter role radius with password 'radpass';
grant all on database radius to radius;
