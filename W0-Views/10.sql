SELECT "english_title" AS "Hiroshige's Highest Entropy Prints" FROM "views"
WHERE "artist" = 'Hiroshige'
ORDER BY "entropy" DESC, "english_title";
