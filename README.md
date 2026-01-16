
# 🚗 Vehicle Rental System - Database Design & SQL Queries

## 📌 Overview
This project is part of an academic assignment focused on **Database Design, ERD modeling, and SQL querying** using a simplified **Vehicle Rental System**.

The system manages:
- Users
- Vehicles
- Bookings

It demonstrates real-world relational database concepts such as **Primary Keys, Foreign Keys, JOINs, EXISTS, WHERE, GROUP BY, and HAVING**.

---

## 🎯 Objectives
By completing this assignment, we demonstrate the ability to:

- Design an ERD with correct relationships
- Understand 1-to-Many and logical 1-to-1 relationships
- Use primary and foreign keys correctly
- Write optimized SQL queries using JOIN, EXISTS, and filtering
- Apply business logic through database constraints

---

## 🗂️ Database Tables

### 1️⃣ Users Table
Stores system users (Admin or Customer).

Fields:
- user_id (PK)
- name
- email (UNIQUE)
- password
- phone
- role (Admin / Customer)

---

### 2️⃣ Vehicles Table
Stores rentable vehicles.

Fields:
- vehicle_id (PK)
- name
- type (car / bike / truck)
- model
- registration_number (UNIQUE)
- rental_price_per_day
- status (available / rented / maintenance)

---

### 3️⃣ Bookings Table
Stores booking information.

Fields:
- booking_id (PK)
- user_id (FK → users.user_id)
- vehicle_id (FK → vehicles.vehicle_id)
- start_date
- end_date
- status (pending / confirmed / completed / cancelled)
- total_cost

---

## 🔗 ERD Relationships

- **User → Bookings** : One-to-Many
- **Vehicle → Bookings** : One-to-Many
- **Booking → User & Vehicle** : Logical One-to-One

📎 **ERD Link:**  
https://lucid.app/lucidchart/3054683e-0aeb-4dd8-9a57-dc03608d05eb

---

## 🧾 SQL Queries

### ✅ Query 1: INNER JOIN
Retrieve booking details with customer and vehicle names.

```sql
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```

---

### ✅ Query 2: NOT EXISTS
Find vehicles that have never been booked.

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);
```

---

### ✅ Query 3: WHERE
Retrieve all available cars.

```sql
SELECT *
FROM vehicles
WHERE status = 'available'
  AND type = 'car';
```

---

### ✅ Query 4: GROUP BY & HAVING
Vehicles with more than 2 bookings.

```sql
SELECT
  v.name AS vehicle_name,
  COUNT(*) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(*) > 2;
```

---

## 🎥 Viva Video
📺 https://youtube.com/shorts/F1MZtR0-TUY

---

## 📦 Submission Links

- **GitHub Repository:**  
  https://github.com/shuvo2011/b6a3-vehicle-rental-system

- **ERD Link:**  
  https://lucid.app/lucidchart/3054683e-0aeb-4dd8-9a57-dc03608d05eb

- **Viva Video:**  
  https://youtube.com/shorts/F1MZtR0-TUY

---

