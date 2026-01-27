# sql
Airbnb-style SQL system: schema, synthetic data (Mockaroo), functions, stored procedures, triggers, views, and full technical docs (ER diagrams + explanations).

# Airbnb-Style SQL Database Project

This folder contains a complete SQL project that models the core operations of an Airbnb‑style temporary accommodation platform.  
The project includes **database schema creation**, **synthetic data population**, and **business logic implementation** (functions, stored procedures, triggers, and views).  
It also includes technical documentation and Entity–Relationship (ER) diagrams (conceptual and logical).

> **Data Privacy Notice:**  
> All data used in this database is **synthetic**, generated exclusively with **Mockaroo** (https://mockaroo.com).  
> Mockaroo permits using generated data for any purpose except building a competing data‑generation product.  
> No real personal information (PII) or confidential data is included.  
> Source: Mockaroo Terms of Use (“Data generated... may be used for any purpose except providing a derivative application”). [1](https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/adventure-works/README.md)  

**Project Objective**
Design and implement a robust relational database system that supports:

User & Host management
Listings / Properties & amenities
Bookings / reservations workflow
Reviews & ranking logic
Payment methods
Geographic hierarchy (Region → Country → City)
Platform governance through triggers & validation logic
Analytical reporting via views

**Folder Structure**
/sql
  /schema
    01_DB+Tables creation.sql
  /data
    02_insert_sample_data.sql      # synthetic data from Mockaroo
  /logic
    03_views.sql
    04_functions.sql
    05_stored_procedures.sql
    06_triggers.sql
  /docs
    DER_conceptual.png
    DER_logical.png
    technical_document.pdf          # 10+ pages of technical explanation
  README.md
  
**Data Model (overview)**
- **Core tables:** `PROPIETOR`, `HOST_TYPE`, `PROPERTY`, `HOUSING_TYPE`, `REGISTER_USER`, `BOOKING`, `PAYMENT_METHOD`, `REVIEW`, `RANKING_LEVEL`, `SERVICE`, `SERVICE_PROPERTY`, `REGION`, `COUNTRY`, `CITY`.
- Typical relationships: owner→property, geo hierarchy (region→country→city), user/property→booking, user/property→review, property↔service (bridge).

 **How to Run the Project**
  > Create the database and tables: 01_DB+Tables creation.sql
  > Populate synthetic data: 02_insert_sample_data.sql
  > Add business logic (in order): `03_views.sql`→`04_functions.sql` → `05_stored_procedures.sql` → `06_triggers.sql`.
  > Explore: occupancy & revenue views, top cities/listings, rating distributions, booking validations.

**Documentation**
A full technical specification (10+ pages) explaining:

conceptual ER model
logical ER model
schema design decisions
business rules
triggers & stored procedure logic
assumptions & limitations

…is provided in /docs/technical_document.pdf.

---
## Notes
- **Public shareability:** Mockaroo‑generated data is permitted for public/demo/portfolio use (see Terms/EULA). [1](https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/adventure-works/README.md)[2](https://learn.microsoft.com/en-us/sql/samples/sql-samples-where-are?view=sql-server-ver17)  
- No credentials, secrets, or production data are included.  
- Adapt minor syntax (dates/types) to your RDBMS (MySQL/PostgreSQL/SQL Server) if required.
