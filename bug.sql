The following SQL query attempts to use a subquery in the FROM clause to calculate the average salary of employees in each department, but it results in a syntax error in many SQL dialects because of the use of column alias in the outer query:

```sql
SELECT dept_name, AVG(average_salary) AS average_dept_salary
FROM (SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department) AS DepartmentAvgSalaries
GROUP BY dept_name;
```

The problem is that many database systems do not allow referencing a column alias from the inner query (average_salary) directly in the outer query's AVG function.  This is because the database processes the outer query after the inner query and doesn't resolve the alias until it's too late. 