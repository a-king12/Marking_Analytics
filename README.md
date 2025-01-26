# **Optimizing Marketing Strategies with SQL**

## **Project Overview**
This project demonstrates how SQL can be used to perform exploratory data analysis (EDA) on a real-world marketing dataset. The dataset contains valuable information about customer demographics, income levels, marital status, spending habits, and product preferences. The goal of this project is to uncover actionable insights and make data-driven recommendations to optimize marketing strategies.

---

## **Dataset**
The dataset used in this project is the [Marketing Data](https://www.kaggle.com/datasets/jackdaoud/marketing-data) available on Kaggle. It includes the following key features:

- **Age**: Customer age.
- **Income**: Annual income of the customer.
- **Marital Status**: Single, Married, etc.
- **Spending Score**: A score (1-100) that indicates customer spending habits.
- **Product Categories**: Types of products purchased.

---

## **Project Goals**
1. **Data Cleaning**: Identify and handle missing values, remove duplicates, and standardize the dataset.
2. **Data Analysis**: Explore patterns in customer behavior, including age distribution, spending habits, and income brackets.
3. **Extract Insights**: Identify high-value customer segments and popular product categories.
4. **Provide Recommendations**: Suggest data-driven strategies to improve marketing efficiency.

---

## **Project Workflow**

### 1. **Data Cleaning**
- Removed duplicates to ensure data integrity.
- Handled missing values by replacing them with statistical measures (e.g., mean, median).
- Standardized data types and formatted categorical variables.

### 2. **Data Analysis**
Key SQL queries performed:
- **Customer Age Distribution**: Analyzed the distribution of customers by age.
- **Spending Score by Marital Status**: Identified patterns in spending scores across different marital statuses.
- **Income Bracket Analysis**: Grouped customers into income brackets and analyzed their purchasing behavior.

### 3. **Insights and Recommendations**
- Identified high-value customers with above-average income and spending scores.
- Highlighted the most popular product categories.
- Suggested marketing strategies for specific customer segments (e.g., targeting middle-income, high-spending customers).

---

## **SQL Highlights**
Some of the key SQL techniques used:
- **Data Cleaning**:
  ```sql
  DELETE FROM marketing_data
  WHERE rowid NOT IN (
      SELECT MIN(rowid)
      FROM marketing_data
      GROUP BY customer_id, age, income, marital_status, spending_score
  );
  ```

- **Age Distribution Analysis**:
  ```sql
  SELECT 
      age, 
      COUNT(*) AS customer_count
  FROM marketing_data
  GROUP BY age
  ORDER BY customer_count DESC;
  ```

- **Targeting Strategy**:
  ```sql
  SELECT 
      marital_status, 
      FLOOR(income / 10000) * 10000 AS income_bracket,
      AVG(spending_score) AS avg_spending_score,
      COUNT(*) AS customer_count
  FROM marketing_data
  WHERE income BETWEEN 30000 AND 60000
  GROUP BY marital_status, income_bracket
  ORDER BY avg_spending_score DESC, customer_count DESC;
  ```

---

## **Tools and Technologies**
- **Database**: PostgreSQL / MySQL
- **Languages**: SQL
- **Dataset Source**: [Kaggle Marketing Data](https://www.kaggle.com/datasets/jackdaoud/marketing-data)

---

## **Recommendations**
1. Focus marketing campaigns on middle-income, high-spending customer segments.
2. Promote the most popular product categories to maximize revenue.
3. Tailor campaigns for specific age groups based on spending patterns.
4. Develop retention strategies for high-value customers identified in the analysis.

---

## **Next Steps**
1. Visualize the results using tools like Tableau or Power BI.
2. Expand the dataset to include campaign-specific data (e.g., email or social media engagement).
3. Create predictive models to forecast customer lifetime value (CLV).

---

## **How to Use**
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/sql-marketing-analysis.git
   ```
2. Import the dataset into your SQL database.
3. Run the provided SQL scripts in your database environment.
4. Explore insights and modify queries as needed.

---

## **Contributing**
Contributions are welcome! Feel free to fork this repository and submit a pull request.

---

## **License**
This project is licensed under the MIT License. See the LICENSE file for details.

---

## **Acknowledgments**
Special thanks to [Kaggle](https://www.kaggle.com/) for providing the dataset and inspiring this project!
