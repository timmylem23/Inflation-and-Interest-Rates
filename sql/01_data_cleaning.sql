-- ============================================================================
-- 01_data_cleaning.sql
-- ============================================================================
-- Author: Timmy Lem
-- Purpose: Clean economic datasets imported from FRED for analysis
-- Datasets:
--   1. Consumer Spending (PCE, monthly series)
--   2. CPI (Consumer Price Index)
--   3. Federal Funds Rate
-- Notes:
--   - Raw tables are left intact
--   - Cleaned tables are created with readable column names
--   - Data types are consistent for analysis and Tableau visualization
-- ============================================================================


-- ============================================================================
-- 1️⃣ Clean Consumer Spending (PCE, monthly series – defensive)
-- ============================================================================
-- Table: PCE
-- Columns (assumed):
--   observation_date (TEXT)
--   PCE (DOUBLE)
-- Cleaning steps:
--   - Convert date from TEXT to DATE
--   - Remove missing values
--   - Rename columns to 'date' and 'consumer_spending'

DROP TABLE IF EXISTS clean_consumer_spending;

CREATE TABLE clean_consumer_spending AS
SELECT
    STR_TO_DATE(observation_date, '%Y-%m-%d') AS date,
    PCE AS consumer_spending
FROM PCE
WHERE PCE IS NOT NULL;


-- ============================================================================
-- 2️⃣ Clean Consumer Price Index (CPI)
-- ============================================================================
-- Table: CPIAUCSL
-- Columns:
--   observation_date (TEXT)
--   CPIAUCSL (DOUBLE)
-- Cleaning steps:
--   - Convert date from TEXT to DATE
--   - Remove missing values
--   - Rename columns to 'date' and 'cpi'

DROP TABLE IF EXISTS clean_cpi;

CREATE TABLE clean_cpi AS
SELECT
    STR_TO_DATE(observation_date, '%Y-%m-%d') AS date,
    CPIAUCSL AS cpi
FROM CPIAUCSL
WHERE CPIAUCSL IS NOT NULL;


-- ============================================================================
-- 3️⃣ Clean Federal Funds Rate
-- ============================================================================
-- Table: FEDFUNDS
-- Columns:
--   observation_date (TEXT)
--   FEDFUNDS (DOUBLE)
-- Cleaning steps:
--   - Convert date from TEXT to DATE
--   - Remove missing values
--   - Rename columns to 'date' and 'interest_rate'

DROP TABLE IF EXISTS clean_interest_rates;

CREATE TABLE clean_interest_rates AS
SELECT
    STR_TO_DATE(observation_date, '%Y-%m-%d') AS date,
    FEDFUNDS AS interest_rate
FROM FEDFUNDS
WHERE FEDFUNDS IS NOT NULL;


-- ============================================================================
-- End of cleaning scripts
-- ============================================================================
-- Notes:
-- - All cleaned tables are ready for joining or analysis
-- - Columns standardized for Tableau: 'date', 'consumer_spending', 'cpi', 'interest_rate'
-- - Next steps: join tables and/or calculate metrics like month-over-month % change
-- ============================================================================
