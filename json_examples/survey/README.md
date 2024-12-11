## Template #1 - Survey 
     
### [Survey Form](https://app1.cliosight.com/app/forms/221/show/public?noNavbar=true)  |  [Survey Results](https://app1.cliosight.com/app/pages/158/show?noNavbar=true)  |  [Cliosight Survey App](https://app1.cliosight.com/app/applications/17/show)            

### Highlights      
1. Multiselect input fields (Cliosight Skills and Data Management Product Names) and checkbox input with references stored in the `respondent_cities` table.       
2. Listing Skill names and Product names through 'public' reports - Skill_Names_Report.json & Product_Names_Report.json.    
   SQL queries:
   ``` sql
   SELECT * FROM skills;     
   SELECT * FROM products;
   ```
3. Link to another form "New Product Name" with access only for account users.    
4. Conditional branching on field 'job_role' (Functional versus Technical versus Managerial) based on rules to populate a subform's 'job' and 'experience' drop down menu values.     
5. Multiple Instances of the subform - 'Job Role'. Subforms are defined within another form, while reports can be used using an ID or code.                     
6. Dynamic addition of a new field on selection of an option value - 'Other' in subform's 'job' drop down menu.       
7. Hidden columns - 'location' with a default value, system variable 'timestamp' and the logged in Cliosight user 'logged_in_user'.
8. Report for results of the survey with the ability to export the data to a csv file.             
   ``` sql
   SELECT * FROM survey;     
   ```
9. Charts for reports with other more specific SQL queries.
   For instance, the chart to display primary work profile count of those who are faimilar with prompt engineering, may have the following SQL query:         
   ``` sql   
   SELECT * FROM (
   SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
   FROM survey 
   WHERE prompt_engg = 'yes' AND job_role = 'Functional'
   HAVING count(*) > 0
   UNION
   SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
   FROM survey 
   WHERE prompt_engg = 'yes' AND job_role = 'Technical'
   HAVING count(*) > 0
   UNION
   SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
   FROM survey 
   WHERE prompt_engg = 'yes' AND job_role = 'Managerial'
   HAVING count(*) > 0
   ) AS combined_results
   ORDER BY Total_Count DESC;  
   ```
### Assumptions of the design      
1. All of the input fields accept alphanumeric characters. There is no strict type checking such as for phone numbers, valid email or hyperlink and similar data.
2. Recent work experiences can only be in the same category of work profile. There is no option to include a mix of technical, functional and managerial experiences.
3. Extra data application development product names list in the text field can be of a max of 255 characters.    

