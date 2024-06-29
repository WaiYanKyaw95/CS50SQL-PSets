SELECT *
FROM (  SELECT "first_name", "last_name" FROM "players"
        JOIN "salaries" ON "salaries"."player_id" = "players"."id"
        JOIN "performances" ON ("performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year")
        WHERE "salaries"."year" = 2001 AND "RBI" != 0
        ORDER BY "salary"/"RBI"
        LIMIT 10
    )
INTERSECT
SELECT *
FROM (  SELECT "first_name", "last_name" FROM "players"
        JOIN "salaries" ON "salaries"."player_id" = "players"."id"
        JOIN "performances" ON ("performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year")
        WHERE "salaries"."year" = 2001 AND "H" != 0
        ORDER BY "salary"/"H"
        LIMIT 10
    )
ORDER BY "last_name";
