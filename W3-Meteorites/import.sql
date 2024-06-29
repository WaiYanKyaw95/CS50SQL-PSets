/*
To consider the data in the meteorites table clean, you should ensure…

1. Any empty values in meteorites.csv are represented by NULL in the meteorites table.
    Keep in mind that the mass, year, lat, and long columns have empty values in the CSV.
2. All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
    Keep in mind that the mass, lat, and long columns have decimal values.
*/

-- create a new table meteorites
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

-- import the csv file into a meteorites_temp db
.import --csv meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';

UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);

UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';

UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';

UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);

UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

/*
3. All meteorites with the nametype “Relict” are not included in the meteorites table.
*/

DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

/*
4. The meteorites are sorted by year, oldest to newest, and then—if any two meteorites landed in the same year—by name, in alphabetical order.

-- SELECT * FROM "meteorites_temp"
-- ORDER BY "year", "name";

5. You’ve updated the IDs of the meteorites from meteorites.csv, according to the order specified in #4.
    The id of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year and is the first in alphabetical order for that year.
*/

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp" ORDER BY "year", "name";



