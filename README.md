# 🏣️ Polopolis Municipal Database Design

Welcome to the **Polopolis Municipal Database**, developed by the **Al Aafiya Team**. This database project is a fully normalized, ER-modeled system tailored to a municipal structure where every resident has fur, feathers, or scales.

---

## 📘 Project Overview

The Polopolis Municipal Database is designed to handle vast amounts of data about pet residents, infrastructure, public services, and more. It supports municipal operations through:

- Structured data storage
- Relational integrity
- Efficient querying
- Real-world transaction support

---

## ✨ Key Features

- **🐾 Comprehensive Data Management**\
  Residents (pets), species, housing, occupations, businesses, and public services all covered.

- **🧹 ER Diagram Design**\
  A detailed Entity-Relationship model depicting inter-entity connections.

- **🔗 Relational Schema Mapping**\
  ER model transformed into a normalized relational schema.

- **🧠 BCNF Normalization**\
  Fully normalized up to Boyce-Codd Normal Form for data integrity and efficiency.

- **🛠️ SQL Implementation**\
  Includes scripts for schema creation, data insertion, and advanced querying.

- **📊 Real-world Transactions**\
  Query examples for handling overcapacity, service hours, and data inconsistencies.

---

## 🗃️ Database Schema Highlights

| Entity                        | Description                                                                 |
| ----------------------------- | --------------------------------------------------------------------------- |
| **RESIDENT**                  | Stores pet info: microchip ID, name, DOB, species, housing, job, vet record |
| **SPECIES**                   | Animal species classification and traits                                    |
| **NEIGHBORHOOD**              | City district info: area, climate, population                               |
| **HOUSE**                     | Housing units: type, address, capacity                                      |
| **OCCUPATION**                | Pet occupations with salary, business links                                 |
| **VETERINARY_RECORD**         | Health data including vaccines, chronic conditions                          |
| **ANIMAL_CONTROL_INCIDENT**   | Reports of behavioral incidents and actions taken                           |
| **BUSINESS**                  | Commercial entities: license, type, hours, owner                            |
| **COMMUNITY_ACTIVITY**        | Public events and facilities                                                |
| **MUNICIPALITY_OFFICIAL**     | Pet officials with department and term info                                 |
| **PUBLIC_SERVICE**            | Details on services like waste mgmt, vet clinics                            |

> **Junction Tables**:\
> `IS_CONNECTED_TO`, `SPECIES_ALLERGY`, `OCCUPATION_REQUIRED_SKILL`, `VR_CHRONIC_CONDITION`, `BUSINESS_ADDRESS` – these handle many-to-many and multivalued relationships.

---

## ⚙️ Setup & Usage

### 🧱 Environment

- **Database**: Oracle Database Server
- **Language**: SQL (DDL + DML)

### 🏗️ Setup Steps

1. **Table Creation**
   - Execute the `CREATE TABLE` scripts (see Chapter VIII of the report).
2. **Add Constraints**
   - Use `ALTER TABLE` commands to apply foreign keys *after* all tables are created (due to circular dependencies).
3. **Insert Sample Data**
   - Run `INSERT INTO` statements from Chapter X to populate tables.
   - For `RESIDENT`, `OCCUPATION`, and `BUSINESS`, use a two-step insertion strategy to handle cyclic dependencies.
4. **Run Queries**
   - Use SELECT, UPDATE, and CREATE VIEW queries (Chapter XII) to explore and analyze the data.

---

## 📄 Project Documentation

For full documentation, including diagrams, design decisions, and SQL scripts, please refer to the [**Phase 4 Report (PDF)**](./phase4.pdf).

---

## 👩‍💻 Project Team

Developed by the **Al Aafiya Team**:

- **Rayan Daoud**
- **Ilham Mneimneh**
- **Mohamad El Nahas**
- **Nabil Merhy**
- **Rana Ellweis**

---

## 📬 Contact

For questions, feedback, or collaboration inquiries, reach out via email:

- [rayan.daoud04@gmail.com](mailto:rayan.daoud04@gmail.com)

---

