# 📚 BookstoreDB – MySQL Database Project

This project is a **MySQL database design and implementation** for a fictional bookstore's operations. It was created as part of a group assignment to demonstrate real-world skills in database schema design, data population, and user access control.

---

## 🚀 Project Objectives

- Design a relational database to manage a bookstore’s data
- Create all necessary tables with appropriate relationships
- Populate the database with sample data for books, authors, customers, and orders
- Implement access control for group members using MySQL user privileges

---

## 🧱 Schema Overview

The database consists of **15 interrelated tables**:

| Table Name         | Description                                      |
|--------------------|--------------------------------------------------|
| `book`             | Book records with title, price, language, etc.  |
| `book_author`      | Junction table for books and authors            |
| `author`           | Authors' names and IDs                          |
| `book_language`    | Book language options (English, Swahili, etc.)  |
| `publisher`        | Publishers of books                             |
| `customer`         | Customer profile information                    |
| `customer_address` | Link between customers and their addresses      |
| `address_status`   | Status like 'current' or 'old' for addresses    |
| `address`          | Street, city, postal code, and country info     |
| `country`          | Country name (Kenya)                            |
| `cust_order`       | Orders placed by customers                      |
| `order_line`       | Books included in each order                    |
| `shipping_method`  | Delivery methods and associated costs           |
| `order_status`     | Possible statuses: pending, shipped, delivered  |
| `order_history`    | Timeline of status changes for each order       |

---

## 🧪 Sample Data

- Includes 10  **Kenyan customers**
- 10+ **books by local authors**
- Fully connected order history, address info, and shipping details

---

## 🔐 User Access Control

Two users were created with remote IP access:

```sql
CREATE USER 'admin1'@'%' IDENTIFIED BY 'password1';
CREATE USER 'admin2'@'%' IDENTIFIED BY 'password2';

GRANT SELECT, INSERT, UPDATE ON BookstoreDB.* TO 'admin1'@'%';
GRANT SELECT, INSERT, UPDATE ON BookstoreDB.* TO 'admin2'@'%';
```

---

## 🛠️ How to Run

1. Import the `bookstore_project.sql` file into your MySQL server:
   ```bash
   mysql -u root -p < bookstore_project.sql
   ```

2. Make sure to allow connections from the group members' IP addresses.

3. Use any SQL client or MySQL CLI to query the data.

---

## 📂 Files Included

- `bookstore_project.sql`: Full SQL script to create and populate the database
- `README.md`: Project documentation

---

## 👥 Contributors
- Ivene Chebet (Team Lead)
- Sidney Baraka Muriuki (Contributor)
- Geoffrey Owuor (Contributor)


## 📌 License

This project is for academic purposes and is not licensed for commercial use.
