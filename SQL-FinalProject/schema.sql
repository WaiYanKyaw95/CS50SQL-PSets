-- represent shops in the area
CREATE TABLE "shops" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" NUMERIC NOT NULL CHECK("founded_year" >= 1900),
    "phone_number" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

-- represent users in the application
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "birthday" NUMERIC NOT NULL,
    "connected" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id")
);

-- represent the relation between shop and users; for instance, owner or employee of the shop
CREATE TABLE "affiliations" (
    "id" INTEGER,
    "shop_id" INTEGER,
    "user_id" INTEGER,
    "type" TEXT NOT NULL CHECK("type" IN ('Owner', 'Employee')),
    PRIMARY KEY("id"),
    FOREIGN KEY("shop_id") REFERENCES "shops"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

-- represent the reviews and comments given by users to the shops
CREATE TABLE "reviews" (
    "id" INTEGER,
    "shop_id" INTEGER,
    "user_id" INTEGER,
    "rating" INTEGER NOT NULL CHECK("rating" <= 5),
    "comment" TEXT,
    "time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("shop_id") REFERENCES "shops"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

-- create index to speed common searches
CREATE INDEX "user_&_rating_id_search" ON "reviews" ("user_id", "shop_id", "rating");
CREATE INDEX "affiliation_type_search" ON "affiliations" ("type");
