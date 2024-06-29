-- first, change the password of the admin account to emily33's password
UPDATE "users" SET "password" = (
    SELECT "password" FROM "users"
    WHERE "username" = 'emily33'
) WHERE "username" = 'admin';

-- alter the password of the admin account to 'oops!' in hash
UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- delete the record of the updates where the admin's password was changed into 'oops!';
DELETE FROM "user_logs"
WHERE "type" = 'update' AND "old_username" = 'admin' AND "new_password" = '982c0381c279d139fd221fce974916e7';
