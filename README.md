# Snyder_Genres_Analysis
# 🎬 Snyder_Genres_Analysis

An SQL creation and manipulation project to explore the movie genres defined by Blake Snyder in *Save the Cat!*.

## 📌 About the Project

This project focuses on creating, populating, and analyzing a movie database based on **Snyder’s narrative genres**. Using only **SQL**, the project walks through all the essential steps of a data workflow, including:

- 📁 **Database creation**
- 📥 **Data insertion**
- 🛠️ **Data manipulation**
- 🧹 **Data treatment**
- 📊 **Outlier detection**
- 📈 **Profit analysis by genre**

The final goal is to understand how different genres behave in terms of financial success, using Blake Snyder’s framework to structure the dataset.

---

## 🗃️ Files Overview

| File                    | Description                                                  |
|-------------------------|--------------------------------------------------------------|
| `creation_database.sql` | Creates the database schema and tables                       |
| `insertion_data.sql`    | Inserts all the movie data                                   |
| `manipulation_data.sql` | Performs data updates, column additions, and transformations |
| `treatment_data.sql`    | Detects and treats nulls and outliers, and calculates metrics|

---

## ⚙️ Technologies Used

- MySQL
- SQL DDL, DML, and DQL
- Outlier handling (IQR method)
- Data cleaning and descriptive statistics (within SQL)

---

## 🧠 Concepts Applied

- **Narrative analysis** based on *Save the Cat!* genres
- **Data wrangling** directly in SQL
- **Exploratory Data Analysis (EDA)** using aggregate queries
- **Outlier treatment** without the need for Python or external tools

---

## 📊 Sample Query – Profit per Genre

```sql
SELECT
  Genre,
  COUNT(*) AS total_movies,
  ROUND(AVG(Profit), 2) AS avg_profit
FROM
  Movies
WHERE
  Profit IS NOT NULL
GROUP BY
  Genre
ORDER BY
  avg_profit DESC;
