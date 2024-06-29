SELECT "city", COUNT("name") AS "Total Number of Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Total Number of Schools" DESC, "city"
LIMIT 10;
