-- first, create the triplet table
CREATE TABLE "triplets" (
    "id" INTEGER,
    "first_num" INTEGER NOT NULL,
    "second_num" INTEGER NOT NULL,
    "third_num" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

-- insert the value into the triplets table
INSERT INTO "triplets" ("first_num", "second_num", "third_num")
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

-- create a view named "message" that will show decipher message ciphered from the sentences
CREATE VIEW "message" AS
SELECT substr("sentence", "second_num", "third_num") AS "phrase" FROM "sentences"
JOIN "triplets" ON "triplets"."first_num" = "sentences"."id";
