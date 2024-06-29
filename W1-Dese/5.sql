SELECT "city", COUNT("name") AS "Total Number of Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "Total Number of Schools" <= 3
ORDER BY "Total Number of Schools" DESC, "city";
