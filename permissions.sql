-- user------------------------------------------------
create role 'user';

create user 'user'@'localhost' identified by '1234';

grant select on corridas.* to 'user';

grant 'user' to 'user'@'localhost';

SET DEFAULT ROLE 'user' TO 'user'@'localhost';

-- Admin-------------------------------------------------
create role 'Admin';

create user 'Admin'@'localhost' identified by 'admin$';

grant select,update,insert,delete,create on corridas.* to 'Admin';

grant 'Admin' to 'Admin'@'localhost';

set default role 'Admin' to 'Admin'@'localhost';



