# RiwiMarket S.A.S. — Database Project

## Project Description

This project implements a relational database solution for **RiwiMarket S.A.S.**, a company dedicated to the distribution of consumer products for supermarkets and neighborhood stores across different cities in Colombia.

The company previously stored all its information in a single shared Excel file, which caused multiple data quality problems: duplicate suppliers, inconsistent product names, cities written in different formats, incomplete records, and redundant data.

The goal of this project is to design and implement a normalized relational database that centralizes all information and guarantees data integrity.

---

## Developer Information

| Field       | Detail                          |
|-------------|---------------------------------|
| Full Name   | Guillermo De Leon               |
| Clan        | Cortissoz                       |
| Cohort      | C5-Cortissoz-Dllo-Baq           |
| Institution | RIWI                            |

---

## Technologies Used

| Technology   | Version  | Purpose                        |
|--------------|----------|--------------------------------|
| MySQL        | 9.x      | Relational database engine     |
| MySQL Workbench | 8.0   | Graphical database management  |
| Python       | 3.x      | Data cleaning and CSV export   |
| pandas       | Latest   | Excel file processing          |
| openpyxl     | Latest   | Excel file generation          |

---

## Database Engine

- **Engine:** MySQL
- **Database name:** `bd_guillermo_deleon_cortissoz`
- **Character set:** utf8mb4
- **Collation:** utf8mb4_unicode_ci

---

## Normalization Process

### Problem Analysis

The original Excel file contained **80 rows and 25 columns**, mixing supplier, warehouse, product, category, purchase, and movement data in every single row. The main problems found were:

- **Duplicate suppliers:** Same supplier registered under different names (e.g. `Ferreteria Andina SAS` vs `Ferretería Andina S.A.S.`)
- **Inconsistent cities:** Same city written in multiple formats (e.g. `B/quilla`, `B/QUILLA`, `Barranquilla`)
- **Duplicate warehouse codes:** `WH-BAQ1` and `WH-BAQ-01` referred to the same warehouse
- **Inconsistent SKUs:** `SKU2001` and `SKU-2001` referred to the same product
- **Inconsistent categories:** `pintura`, `Pinturas`, `pinturas` were the same category
- **Inconsistent phone formats:** `(601)5550101`, `601 555 0101`, `6015550101`
- **Empty fields:** Several rows had no `purchased_quantity` or no `purchase_code`
- **Redundant data:** Supplier and warehouse information was repeated in every purchase row

### First Normal Form (1FN)

**Rule:** Every column must contain atomic (indivisible) values. Every row must be unique.

**Initial state:** The table had all entities mixed in one flat structure. Cities, supplier names, SKUs, and categories had multiple formats for the same value.

**Changes applied:**
- Standardized all city names → `Barranquilla`, `Bogotá`, `Medellín`, `Cartagena`
- Unified supplier names by canonical form
- Standardized SKUs to always use hyphen format → `SKU-2001`
- Normalized category names → `Pinturas`, `Herramientas`, etc.
- Standardized phone numbers and tax IDs to a consistent format
- Unified warehouse codes → `WH-BAQ-01`, `WH-MED-01`, `WH-BOG-01`

**Result:** One clean flat table with atomic values and no formatting inconsistencies.

### Second Normal Form (2FN)

**Rule:** The table must comply with 1FN. Every non-key attribute must depend on the entire primary key, not just part of it.

**Partial dependencies found:**
- `supplier_name`, `supplier_city`, `supplier_phone` depended only on the supplier, not on the purchase
- `warehouse_name`, `warehouse_address` depended only on the warehouse
- `product_name`, `category_name`, `unit_price` depended only on the product
- `responsible_user` depended only on the employee

**Changes applied:** Each entity was extracted into its own table with its own primary key.

**New tables created:**
`rm_cities`, `rm_categories`, `rm_employees`, `rm_suppliers`, `rm_warehouses`, `rm_products`, `rm_purchases`, `rm_purchase_items`, `rm_movements`

### Third Normal Form (3FN)

**Rule:** The table must comply with 2FN. No non-key attribute should depend on another non-key attribute (no transitive dependencies).

**Transitive dependencies found and eliminated:**
- `supplier_city` (text) → replaced by `city_id` (FK). The city name does not depend on the supplier.
- `warehouse_city` (text) → replaced by `city_id` (FK). Same case.
- `category_name` inside products → replaced by `category_id` (FK). The category name does not depend on the product.

**Result:** All tables are in 3FN. No transitive dependencies remain.

---

## Database Structure

```
rm_cities
├── city_id      PK
├── city_name    UNIQUE NOT NULL
└── country      NOT NULL DEFAULT 'Colombia'

rm_categories
├── category_id  PK
└── name         UNIQUE NOT NULL

rm_employees
├── employee_id  PK
└── name         NOT NULL

rm_suppliers
├── supplier_id  PK
├── code         UNIQUE NOT NULL
├── name         NOT NULL
├── tax_id       UNIQUE NOT NULL
├── phone
└── city_id      FK → rm_cities

rm_warehouses
├── warehouse_id PK
├── code         UNIQUE NOT NULL
├── name         NOT NULL
├── address
└── city_id      FK → rm_cities

rm_products
├── product_id   PK
├── sku          UNIQUE NOT NULL
├── name         NOT NULL
├── description
├── unit_measure NOT NULL
├── unit_price   NOT NULL CHECK > 0
└── category_id  FK → rm_categories

rm_purchases
├── purchase_id  PK
├── code         UNIQUE NOT NULL
├── purchase_date NOT NULL
└── supplier_id  FK → rm_suppliers

rm_purchase_items
├── item_id      PK
├── purchase_id  FK → rm_purchases
├── product_id   FK → rm_products
├── quantity     NOT NULL CHECK > 0
└── unit_price   NOT NULL CHECK > 0

rm_movements
├── movement_id  PK
├── code         UNIQUE NOT NULL
├── movement_type NOT NULL CHECK IN ('IN','OUT','ADJUSTMENT_IN','ADJUSTMENT_OUT')
├── movement_date NOT NULL
├── quantity     NOT NULL CHECK > 0
├── stock_after  NOT NULL
├── observations
├── product_id   FK → rm_products
├── warehouse_id FK → rm_warehouses
├── purchase_id  FK → rm_purchases (nullable)
└── employee_id  FK → rm_employees
```

---

## Entity Relationship Model

The ERD was built using the following relationships:

| Relationship                        | Cardinality |
|-------------------------------------|-------------|
| rm_suppliers → rm_cities            | N : 1       |
| rm_warehouses → rm_cities           | N : 1       |
| rm_products → rm_categories         | N : 1       |
| rm_purchases → rm_suppliers         | N : 1       |
| rm_purchase_items → rm_purchases    | N : 1       |
| rm_purchase_items → rm_products     | N : 1       |
| rm_movements → rm_products          | N : 1       |
| rm_movements → rm_warehouses        | N : 1       |
| rm_movements → rm_purchases         | N : 1       |
| rm_movements → rm_employees         | N : 1       |

> The ERD diagram is included as a separate PDF file: `MER_riwimarket.pdf`

---

## Installation Instructions

### Requirements

- MySQL Server 9.x installed and running
- MySQL Workbench 8.0

### Steps

1. Open MySQL Workbench and connect to your local server
2. Open a new SQL tab
3. Run the file `bd_guillermo_deleon_cortissoz.sql` to create the database and all tables
4. Run the file `inserts.sql` to load all data
5. Run the file `consultas.sql` to execute the business queries

---

## Database Creation

```sql
CREATE DATABASE IF NOT EXISTS bd_guillermo_deleon_cortissoz
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Tables are created in dependency order:
1. `rm_cities`
2. `rm_categories`
3. `rm_employees`
4. `rm_suppliers`
5. `rm_warehouses`
6. `rm_products`
7. `rm_purchases`
8. `rm_purchase_items`
9. `rm_movements`

---

## Data Loading Process

The original Excel file (`raw_dataset_riwibuild_practice.xlsx`) was processed using Python and pandas:

1. All data was read and cleaned (cities, supplier names, SKUs, phone formats, tax IDs)
2. Unique entities were extracted per table (no duplicates)
3. Foreign key IDs were assigned consistently
4. INSERT statements were generated in the correct order into `inserts.sql`

Rows with empty `purchased_quantity` were loaded with `NULL` in `rm_purchase_items`.  
Rows with empty `purchase_code` were loaded with `NULL` in the `purchase_id` field of `rm_movements` (these correspond to inventory adjustments with no associated purchase order).

---

## SQL Queries Explanation

| Query | Business Need | Technique Used |
|-------|--------------|----------------|
| 1 | Current stock per product | Subquery to get latest movement date per product |
| 2 | Products stored per warehouse | CASE WHEN to sum IN and subtract OUT movements |
| 3 | Total invested per supplier | SUM(quantity × unit_price) grouped by supplier |
| 4 | Products with lowest stock | Same as Query 1, ordered ASC with status label |
| 5 | Top 5 most purchased products | SUM of quantities with LIMIT 5 |
| 6 | Inventory value per city | Subquery for stock per warehouse × unit_price grouped by city |
