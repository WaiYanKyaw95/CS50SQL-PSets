-- search for shops, their types and locations which the specific users leave ratings and comments
SELECT "name", "type", "location"
FROM "shops" WHERE "id" IN (
    SELECT "shop_id" FROM "reviews"
    WHERE "user_id" = (
        SELECT "id" FROM "users"
        WHERE "username" = 'nathankyaw20'
    )
);

-- search for shops' names and their average ratings
SELECT "name", ROUND(AVG("rating"), 2) AS "average_rating" FROM "shops"
JOIN "reviews" ON "reviews"."shop_id" = "shops"."id"
GROUP BY "name"
ORDER BY "average_rating" DESC;

-- search for shops and their owners' names
SELECT "first_name" AS "owner_fname", "last_name" AS "owner_lname", "name" AS "shop_name" FROM "users"
JOIN "affiliations" ON "affiliations"."user_id" = "users"."id"
JOIN "shops" ON "shops"."id" = "affiliations"."shop_id"
WHERE "founded_year" >= 2020 AND "affiliations"."type" = 'Owner';

-- inserting a new shop
INSERT INTO "shops" ("name", "type", "location", "founded_year", "phone_number")
VALUES ('Coco&Booboo', 'Fruit seller', 'Yangon', 2023, '09795123456');

-- inserting a new user
INSERT INTO "users" ("first_name", "last_name", "username", "password", "birthday", "connected")
VALUES ('Nathan', 'Kyaw', 'nathankyaw20', 'thisisnathan2002', '2000-01-01', '2023-03-23');

-- inserting a new review
INSERT INTO "reviews" ("shop_id", "user_id", "rating", "comment")
VALUES (1, 1, 5, 'The best fruit-seller in town!');

-- updating the password of the user 'nathankyaw20'
UPDATE "users" SET "password" = 'thisisstrongerpw2002'
WHERE "username" = 'nathankyaw20';
