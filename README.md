# Pewlett_Hackard_Analysis

## Overview
Pewlett Hackard is a company that is expecting a large portion of their workforce to retire within the next few years.  As a result, many positions at the company will be left vacant if nothing is done to get ahead of this mass retirement.  The following analyses were completed to see how many employees would be leaving the company, and from what departments they would be leaving.  This should give the company a good general idea of how many people would either need to be promoted or hired on to fill those positions.  Additionally, in order to reduce the impact of employees leaving the company, an analysis was done to determine eligbility of certain employees for a mentorship program.  The company would like to retain some employees who are looking to retire by offering them part-time roles as employee trainers.  By doing so, employees being promoted or hired on to a new role could be trained by someone who was previously in that role and who had subject matter expertise.

## Results
* There is a total of 72,458 employees that are currently eligible for retirement.
* Of those eligible for retirement, the top three position titles that will have openings will be 'Senior Engineer', 'Senior Staff', and 'Engineer'.  

    ![retirement_titles](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/retirement_titles.PNG)

* Similar to the table above, the top three positions for employees eligible to participate in the part-time mentor program are 'Senior Staff', 'Engineer', and 'Senior Engineer'.

    ![mentor_titles](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/mentor_titles.PNG)


    <details><summary>CODE USED FOR TABLE</summary>
    <p>

    ```
    SELECT me.title, COUNT(me.title) 
    INTO mentor_titles
    FROM mentors me
    GROUP BY (me.title)
    ORDER BY COUNT(me.title) DESC;
    ```

    <p>
    </details>

* There are only 1,549 eligible mentors available for the 72,458 positions that will need to be filled in the near future.

    ![mentor_titles_sum](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/mentor_titles_sum.PNG)


    <details><summary>CODE USED FOR TABLE</summary>
    <p>

    ```
    SELECT SUM(count)
    FROM mentor_titles;
    ```

    <p>
    </details>

## Summary
As seen above, there are 72,458 roles that will need to be filled at Pewlett Hackard, but there are only 1,549 current employees that are eligible for the mentorship program.  Overall, that is about 47 open positions for each eligible mentor.  It is certainly not realistic to expect that these mentors could handle such a work load.  It is also not realistic to expect that all of the 1,549 eligible employees for mentoring will want to take on the mentor role.  Perhaps it would be worthwhile to expand the eligibility criteria for mentoring, since we originally only looked at current employees born in 1965.  In 2022, those individuals would be about 57, which is still about 5-7 years away from retirement based on the national average for men and women.  The query criteria could be expanded to younger individuals that are not ready to retire, but who are getting closer in age and may be interested in taking on a training role.  Therefore, we can expand our criteria to current employees born between 1962 and 1970. The following query was re-factored from the original mentor eligibility query to expand the search criteria:

<details><summary>QUERY</summary>
<p>

```
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentors_expanded
FROM employees e
	JOIN dept_emp de
		ON (e.emp_no = de.emp_no)
	JOIN titles ti
		ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1962-01-01' AND '1970-12-31'
ORDER BY e.emp_no, ti.title;
```

<p>
</details>

The following output shows that there would be many more mentors in this larger range.  There would be a total of 56,859 eligible mentors, meaning there would be about 1.2 open positions for every eligible mentor.  It may be worthwhile for the company to look at recruiting their mentors from a wider range of current employees.  This would give employees being promoted the best chance to learn their new roles thoroughly and have confidence.

![mentors_expanded](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/mentor_titles_expanded.PNG)

<details><summary>QUERY</summary>
<p>

```
SELECT me_ex.title, COUNT(me_ex.title) 
INTO mentor_titles_ex
FROM mentors_expanded me_ex
GROUP BY (me_ex.title)
ORDER BY COUNT(me_ex.title) DESC;
```

<p>
</details>

