## Template #1 - Survey 
     
### [Survey Form](https://app1.cliosight.com/app/forms/221/show/public?noNavbar=true)  |  [Survey Results SPA](https://app1.cliosight.com/app/pages/158/show?noNavbar=true)  |  [Cliosight Survey App](https://app1.cliosight.com/app/applications/17/show)            

### Highlights      
1. Multiselect input fields (Cliosight Skills and Data Management Product Names).
2. Listing Skill names and Product names through 'public' reports - Skill_Names.json & Product_Names.json.    
   SQL queries:
   ``` sql
   select * from skills;     
   select * from products;
   ```
3. Link to another form "New Product Name" with access only for account users.    
4. Conditional branching on field 'job_role' (Functional versus Technical versus Managerial) based on rules to populate a subform's 'job' and 'experience' drop down menu values.     
5. Multiple Instances of the subform - 'Job Role'.                     
6. Dynamic addition of a new field on selection of an option value - 'Other' in subform's 'job' drop down menu.       
7. Hidden columns - 'location' with a default value, system variable 'timestamp' and current logged in Cliosight user 'logged_in_user'.
8. Report for results of the survey        
   ``` sql
   select * from survey;     
   ```
9. Charts for reports with other more specific SQL queries. For instance,         
   ``` sql   
   SELECT * FROM (
    SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
    FROM survey 
    WHERE prompt_engg = 'yes' AND job_role = 'Managerial'
    HAVING count(*) > 0
    UNION
    SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
    FROM survey 
    WHERE prompt_engg = 'yes' AND job_role = 'Technical'
    HAVING count(*) > 0
    UNION
    SELECT count(*) as Total_Count, prompt_engg as Prompt_Engg, job_role as Job_Role
    FROM survey 
    WHERE prompt_engg = 'yes' AND job_role = 'Functional'
    HAVING count(*) > 0
   ) AS combined_results
   ORDER BY Total_Count DESC;  
   ```

