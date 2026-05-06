# RPG-Subfile-Template
A Simple RPG Subfile Template

# IBM i RPG – Customer List with Subfile (SQL + DSPF + RPGLE)

##  Overview

This project demonstrates how to display multiple records using a **Subfile** on IBM i.

It builds on a basic setup using:

* SQL (DB2) for data storage
* Display File (DSPF) with Subfile support
* RPGLE (free format) for business logic

The program loads customer data into a subfile and displays it as a scrollable list.

---

##  Project Structure

### 1. SQL Table (`CUSTOMERS`)

Same structure as in the basic example.

Stores:

* `CUSTOMER_ID`
* `NAME`
* `BALANCE`

---

### 2. Display File (`CUSTOMERSFLDSPF`)

Defines the subfile layout and screen behavior.

**Key aspects:**

* `SFL` = one row in the list
* `SFLCTL` = control structure for the list
* `SFLSIZ` = total records loaded
* `SFLPAG` = visible rows
* Indicators control display behavior:

  * `SFLCLR` (clear subfile)
  * `SFLDSP` (display subfile)
  * `SFLDSPCTL` (display control)

---

### 3. RPGLE Program (`CUSTOMERSFLRPG`)

Handles loading and displaying the subfile.

**Key aspects:**

* Uses SQL cursor to fetch all records
* Loads each record into the subfile
* Uses `RRN` (Relative Record Number) to track rows
* Displays the subfile using `EXFMT`
* Handles user input (F3 = Exit)

---

##  Data Flow

1. SQL query retrieves all customer records
2. RPG program loops through results
3. Each row is written to the subfile
4. Subfile is displayed to the user

---

##  Subfile Concept

A subfile is essentially a **terminal-based table**:

* Displays multiple records at once
* Supports paging and scrolling
* Acts as the standard list UI in IBM i applications

---

##  Important Notes

* Subfiles are the **standard way to display lists** in RPG applications
* Indicators are required to control behavior (clear, display, refresh)
* `RRN` is used internally to manage subfile rows
* This example does not yet include:

  * Selection options
  * Paging logic
  * User input fields

---

##  Purpose

This project is designed to:

* Introduce Subfiles in IBM i development
* Show how to display multiple records
* Prepare for real-world applications (e.g. banking systems)

---

##  Next Steps

Possible extensions:

* Add selection options (e.g. 2=Edit, 4=Delete)
* Implement paging (Page Up / Page Down)
* Add filtering (search by name)
* Create detail screens

---
