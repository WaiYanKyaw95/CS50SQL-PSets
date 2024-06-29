/*
SELECT "first_name", "last_name", "salary", "HR", "salaries"."year" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
FULL JOIN "performances" ON ("performances"."player_id" = "salaries"."id" AND "performances"."year" = "salaries"."year")
GROUP BY "salaries"."year";
*/

SELECT "first_name", "last_name", "salary", "HR", "salaries"."year" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON ("performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year")
ORDER BY "players"."id", "first_name", "last_name", "salaries"."year" DESC, "HR" DESC, "salary" DESC;
