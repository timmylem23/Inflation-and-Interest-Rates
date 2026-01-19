-- ============================================================================
-- 02_combined_dataset.sql
-- ============================================================================
-- Author: Timmy Lem
-- Purpose: Combine cleaned economic datasets into a single table
--          for analysis and Tableau visualization
-- Datasets:
--   - clean_consumer_spending
--   - clean_cpi
--   - clean_interest_rates
-- Notes:
--   - All datasets are monthly
--   - Consumer spending is used as the anchor table
-- ============================================================================

-- ============================================================================
-- 1️⃣ Create Combined Monthly Dataset
-- ============================================================================
-- Join on date to align consumer spending, inflation, and interest rates

DROP TABLE IF EXISTS combined_economic_data;

CREATE TABLE combined_economic_data AS
SELECT
    cs.date,
    cs.consumer_spending,
    cpi.cpi,
    ir.interest_rate
FROM clean_consumer_spending cs
LEFT JOIN clean_cpi cpi
    ON cs.date = cpi.date
LEFT JOIN clean_interest_rates ir
    ON cs.date = ir.date
ORDER BY cs.date;

-- ============================================================================
-- 2️⃣ Create Tableau-Ready Dataset with Month-over-Month % Change (Optional)
-- ============================================================================
-- Adds growth metrics commonly used in economic analysis

DROP TABLE IF EXISTS combined_economic_data_mom;

CREATE TABLE combined_economic_data_mom AS
SELECT
    date,
    consumer_spending,
    cpi,
    interest_rate,

    ROUND(
        (consumer_spending - LAG(consumer_spending) OVER (ORDER BY date))
        / LAG(consumer_spending) OVER (ORDER BY date) * 100,
        2
    ) AS consumer_spending_mom_pct,

    ROUND(
        (cpi - LAG(cpi) OVER (ORDER BY date))
        / LAG(cpi) OVER (ORDER BY date) * 100,
        2
    ) AS cpi_mom_pct,

    ROUND(
        (interest_rate - LAG(interest_rate) OVER (ORDER BY date))
        / LAG(interest_rate) OVER (ORDER BY date) * 100,
        2
    ) AS interest_rate_mom_pct

FROM combined_economic_data;


-- ============================================================================
-- End of script
-- ============================================================================
-- Output tables:
--   - combined_economic_data
--   - combined_economic_data_mom
-- Ready for CSV export and Tableau dashboards
-- ============================================================================