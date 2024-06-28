SELECT "username" FROM "users"
JOIN "messages" ON "users"."id" = "messages"."to_user_id"
GROUP BY "username"
ORDER BY COUNT("picture") DESC, "username"
LIMIT 1;
