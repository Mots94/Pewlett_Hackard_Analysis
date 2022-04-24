# Pewlett_Hackard_Analysis

## Overview
Pewlett Hackard is a company that is expecting a large portion of their workforce to retire within the next few years.  As a result, many positions at the company will be left vacant if nothing is done to get ahead of this mass retirement influx.  The following analyses were completed to see how many employees would be leaving the company, and from what departments they would be leaving.  This should give the company a good general idea of how many people would either need to be promoted to fill those positions or hired on to those positions.  Additionally, in order to reduce the impact of employees leaving the company, an analysis was done to determine eligbility of certain employees for a mentorship program.  The company would like to retain some employees who are looking to retire by offering them part-time roles as employees trainers.  By doing so, employees being promoted or hired on to a new role could be trained by someone who was previously in that role and who had subject matter expertise.

## Results
* There is a total of 72,458 employees that are currently eligible for retirement
* Of those eligible for retirement, the top three position titles that will have openings will be 'Senior Engineer', 'Senior Staff', and 'Engineer'.  
![retirement_titles](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/retirement_titles.PNG)
* Similar to the table above, the top three positions for employees eligible to participate in the part-time mentor program are Senior Staff, Engineers, and Senior Engineers
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

* There are only 1,549 eligible mentors available for the 72,458 positions that will need to be filled in the near future
![mentor_titles_sum](https://github.com/Mots94/Pewlett_Hackard_Analysis/blob/main/Data/mentor_titles_sum.PNG)