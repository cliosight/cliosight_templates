Template #1 - Survey 
-------------------------
## [Cliosight Survey](https://app.cliosight.com/app/forms/221/show/public?noNavbar=true)   

### Highlights      
1. Multiselect input fields (Skills and Data Management Product Names)
2. Listing Skill names and Product names through 'public' reports - Skill_Names.json & Product_Names.json.    
   SQL queries:
   ``` sql
   select * from skills;     
   select * from products;
   ```
3. Multiple Instances of a Subform - 'Job Role'      
4. Conditional Branching (Functional versus Technical) with rules to populate the Subform Job Role's 'job_role' and 'experience' drop down menus.       
5. Link to another form "New Product Name" with access only for account users and superusers.
6. Hidden columns - 'location' with a default value and system variable 'current timestamp'.
7. Report for results of survey        
   SQL query:
   ``` sql
   select * from survey;     
   ```
8. Charts for reports with other SQL queries. For instance,         
      SQL query:
   ``` sql
   select * from survey where prompt_engg = 'yes' and job_role = 'Technical';     
   ```

