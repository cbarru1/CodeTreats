# CLAUDE.md - CodeTreats

## Project Overview

CodeTreats is a personal reference collection of SQL code snippets, query patterns, and technical notes for enterprise database work. It is **not** a deployable application — there are no build tools, CI/CD pipelines, or package managers.

**Author:** Carlton Barrus  
**License:** MIT (2025)

## Repository Structure

```
CodeTreats/
├── *.sql              # 14 T-SQL (SQL Server) script files
├── SQL Tips.docx      # SQL tips document
├── Misc JavaScript Tips - Overview.pdf
└── LICENSE
```

All SQL files live at the repository root. There are no subdirectories or nested modules.

## Tech Stack

- **Language:** T-SQL (Microsoft SQL Server)
- **No build tools, package managers, linters, or formatters** are configured
- **No .gitignore** — all files including binaries (docx, pdf) are tracked

## SQL Conventions

### Database Schemas Referenced

The SQL targets an enterprise system with these schemas:

| Schema | Domain |
|--------|--------|
| `vnd.*` | Vendor management |
| `com.*` | Company/user management |
| `eva.*` | Evaluations/scoring |
| `eml.*` | Email system |
| `msg.*` | Messaging system |
| `app.*` | Application config |
| `aud.*` | Audit/error logs |
| `ctl.*` | Control/batch processing |
| `dbo.*` | Default schema |

### Common Patterns Used

- **CTEs** (`WITH ... AS`) for complex queries and deduplication
- **Window functions** (`ROW_NUMBER() OVER (PARTITION BY ...)`)
- **Transaction control** (`BEGIN TRAN` / `ROLLBACK` / `COMMIT`) — queries often left in rollback mode for safety
- **Parameterized queries** using `DECLARE` statements
- **UPDATE with JOINs** for bulk data modifications
- **Fully qualified table names** (e.g., `vnd.Vendor`, `com.Company`)

## File Summaries

| File | Purpose |
|------|---------|
| `CommonSQLQueriesAndTools.sql` | DB admin utilities: constraints, triggers, temp tables, special characters |
| `CVSAndVPSQueries.sql` | Company-vendor status and vendor pool queries |
| `GeneralVendorQueries.sql` | Vendor data investigation with multi-table joins |
| `UserCacheQueries.sql` | User/company cache management and XML data updates |
| `RowNumberOverPartition.sql` | Deduplication using window functions |
| `UpdateWithJoin.sql` | Bulk email user updates via JOIN |
| `UpdateSPSEBIDSEvalNotes-RemoveSpecialChar-2.sql` | Remove special characters from evaluation notes |
| `UpdateComUserForBulkMessageFail.sql` | Fix email disable flags |
| `UsersTimeZoneOutsideOfCompanyTimeZone.sql` | Find user/company timezone mismatches |
| `VendorDuplicateSearchTesting.sql` | Test vendor duplicate search stored procedure |
| `TestingForNullAndIntMinValue.sql` | NULL and minimum value validation logic |
| `UpdateSQSEmailTasks.sql` | Update SQS task scheduling |
| `FindColumnNameInTables.sql` | Search system metadata for columns by name |
| `ASQLQuery6.sql` | Email and messaging query with LEFT JOINs |

## Development Guidelines

- **No tests or CI** — SQL scripts are run manually against SQL Server databases
- **Commit messages** have historically been brief (e.g., "Add files via upload")
- **File naming** uses PascalCase, sometimes with hyphens for variants (e.g., `UpdateSPSEBIDSEvalNotes-RemoveSpecialChar-2.sql`)
- When adding new SQL files, place them at the repository root
- Keep queries safe by defaulting to `SELECT` or wrapping mutations in `BEGIN TRAN` / `ROLLBACK`
