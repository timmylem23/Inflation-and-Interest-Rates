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