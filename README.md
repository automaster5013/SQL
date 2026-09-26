# Oracle SQL Practice

A compact collection of Oracle SQL and PL/SQL learning scripts covering relational schema design, sample data, joins, aggregation, subqueries, and Oracle-specific hierarchical queries.

The repository is intended for practice in a disposable local database schema. It is not a production migration set.

## Contents

### EMP and DEPT sample

`1_emp.sql` recreates the classic Oracle `EMP` and `DEPT` tables, inserts sample rows, and commits them. The dated `Script_*.sql` files contain follow-up query exercises using this and other practice schemas.

### University enrollment sample

The numbered scripts build a small university model:

| Order | Script | Tables introduced |
| ---: | --- | --- |
| 1 | `2_department.sql` | `DEPARTMENT`, `STUDENT` |
| 2 | `3_course.sql` | `COURSE` |
| 3 | `4_professor.sql` | `PROFESSOR` |
| 4 | `5_class.sql` | `CLASS` |
| 5 | `6_takes.sql` | `TAKES` |

The foreign-key flow is:

```text
DEPARTMENT ──> STUDENT
      └──────> PROFESSOR ──> CLASS <── COURSE
                      STUDENT ──> TAKES <── CLASS
```

## Requirements

- Oracle Database or Oracle Database XE
- SQL Developer, SQLcl, or SQL*Plus
- A disposable user/schema where creating and dropping tables is safe

The scripts use Oracle-specific types and syntax such as `VARCHAR2`, `NUMBER`, `TO_DATE`, and `CONNECT BY`. They are not expected to run unchanged on PostgreSQL, MySQL, or SQLite.

## Running the samples

Run the EMP/DEPT sample independently:

```sql
@1_emp.sql
```

For the university model, use a fresh schema and run the numbered scripts in order:

```sql
@2_department.sql
@3_course.sql
@4_professor.sql
@5_class.sql
@6_takes.sql
COMMIT;
```

Some scripts begin with unconditional `DROP TABLE` statements. A first run may report that a table does not exist; a rerun may require dropping dependent tables in reverse order first:

```sql
DROP TABLE takes;
DROP TABLE class;
DROP TABLE professor;
DROP TABLE course;
DROP TABLE student;
DROP TABLE department;
```

Only run destructive statements in a schema created for practice.

## Dated exercise files

Files named `Script_YYYYMMDD.sql` are chronological working notes. They can contain commented alternatives, standalone statements, or queries for schemas not created by the numbered files. Review and run individual statements instead of treating each dated file as an end-to-end migration.

## Data safety

The rows are educational sample data. Identifier-like values must not be interpreted as verified real identities or reused in another system. Do not add real personal information, production credentials, connection strings, or exported production rows to this repository.