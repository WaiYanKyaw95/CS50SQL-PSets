SELECT "name", "per_pupil_expenditure", "dropped" FROM "expenditures"
JOIN "schools" ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "type" = 'Public School'
AND "per_pupil_expenditure" < (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
AND "dropped" > (
    SELECT AVG("dropped")
    from "graduation_rates"
)
ORDER BY "dropped" DESC;
