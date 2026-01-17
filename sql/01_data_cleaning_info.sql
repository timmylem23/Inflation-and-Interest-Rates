## Summary

This PR adds SQL scripts to clean and prepare economic datasets imported from FRED for analysis and visualization. The scripts create cleaned tables that are ready for joining and Tableau dashboards.

### Datasets Cleaned

1. **CPI (Consumer Price Index, CPIAUCSL)**
   - Cleaned as `clean_cpi`
   - `observation_date` converted from TEXT to DATE
   - Values stored as DOUBLE
   - Removed any missing values
   - Column renamed to `date` and `cpi` for clarity

2. **Federal Funds Rate (FEDFUNDS)**
   - Cleaned as `clean_interest_rates`
   - `observation_date` converted from TEXT to DATE
   - Values stored as DOUBLE
   - Removed any missing values
   - Columns renamed to `date` and `interest_rate` for clarity

3. **Consumer Spending (PCE, DPCCRV1Q225SBEA)**
   - Cleaned as `clean_consumer_spending`
   - Using **monthly series directly** (no quarterly-to-monthly conversion needed)
   - `observation_date` converted from TEXT to DATE
   - Values stored as DOUBLE
   - Removed missing values
   - Columns renamed to `date` and `consumer_spending` for clarity

### Key Points

- Raw data tables are left intact; cleaned tables are newly created
- This ensures safe, reproducible cleaning
- Columns are simplified and standardized for analysis
- This setup prepares the datasets for joining, calculations (MoM/YoY), and Tableau visualization
- [x] Cleaned CPI series and verified date/value types
- [x] Cleaned FEDFUNDS series and verified date/value types
- [x] Cleaned PCE monthly series and verified date/value types
- [ ] Combine datasets into one joined table (next step)
- [ ] Export combined dataset for Tableau (next step)

### Next Steps

- Join these cleaned tables into a single combined dataset
- Export to CSV for Tableau
- Create visualizations showing trends, correlations, and economic insights

