-- creating covering index on enrollments table's student_id and course_id
-- CREATE INDEX "student_index" ON "students" ("name");

-- used
CREATE INDEX "enrol_student_index" ON "enrollments" ("student_id");

-- used
CREATE INDEX "enrol_course_index" ON "enrollments" ("course_id");

-- CREATE INDEX "course_department_index" ON "courses" ("department");

-- used
CREATE INDEX "course_number_index" ON "courses" ("number");

-- used
CREATE INDEX "course_semester_index" ON "courses" ("semester");

-- CREATE INDEX "course_title_index" ON "courses" ("title");

-- used
CREATE INDEX "satisfied_course_index" ON "satisfies" ("course_id");
