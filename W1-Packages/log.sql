
-- *** The Lost Letter ***
-- finding the sender id : 432
SELECT "id", "address" FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

-- finding the receiver id; it's indeed a tricky one : 854
SELECT "id", "address" FROM "addresses"
WHERE "address" LIKE '%F______n%';

-- finding the congratulatory letter package id : 384
SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" LIKE '%2%F______n%Street%'
);

-- Finding all out

SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" LIKE '%2%F______n%Street%'
        )
    )
);

-- *** The Devious Delivery ***

-- specifically said no "from" address; package id = 5098
SELECT "id", "contents", "to_address_id" FROM "packages"
WHERE "from_address_id" IS NULL;

-- everything
SELECT "type" FROM "addresses"
WHERE "id" = (
    -- checking the dropped off address
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        -- there is no 'from' address
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

-- *** The Forgotten Gift ***

-- checking sender's address id
SELECT "id" FROM "addresses"
WHERE "address" = '109 Tileston Street';

-- checking receiver's address id
SELECT "id" FROM "addresses"
WHERE "address" = '728 Maple Place';

-- checking the id and contents of the package
SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- checking usual way with drop action

SELECT "address" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    ) AND "action" = 'Drop'
);

-- as driver is the one who picks up the package, let's find out the driver
SELECT "name" FROM "drivers"
WHERE "id" = 17;
