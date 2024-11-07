Template #1 - Survey 
-------------------------
## [Cliosight Survey](https://app1.cliosight.com/app/forms/221/show/public?noNavbar=true)   

### Highlights      
1. Multiselect input fields (Cliosight Skills and Data Management Product Names)
2. Listing Skill names and Product names through 'public' reports - Skill_Names.json & Product_Names.json.    
   SQL queries:
   ``` sql
   select * from skills;     
   select * from products;
   ```
3. Link to another form "New Product Name" with access only for account users.
4. Multiple Instances of a Subform - 'Job Role'      
5. Conditional branching in field 'job_role' (Functional versus Technical versus Managerial) based on rules to populate the subform's 'job' and 'experience' drop down menu values.
6. Dynamic addition of a new field on selection of an option value - 'Other' in subform.       
7. Hidden columns - 'location' with a default value and system variable 'timestamp'.
8. Report for results of survey        
   SQL query:
   ``` sql
   select * from survey;     
   ```
9. Charts for reports with other more specific SQL queries. For instance,         
   ``` sql
   select count(*) as 'Total Count', prompt_engg as 'Prompt Engg.', job_role as 'Job Role' from survey where prompt_engg = 'yes' and job_role = 'Functional'     
   union          
   select count(*) as 'Total Count', prompt_engg as 'Prompt Engg.', job_role as 'Job Role' from survey where prompt_engg = 'yes' and job_role = 'Technical'          
   union
   select count(*) as 'Total Count', prompt_engg as 'Prompt Engg.', job_role as 'Job Role' from survey where prompt_engg = 'no' and job_role = 'Functional'     
   union          
   select count(*) as 'Total Count', prompt_engg as 'Prompt Engg.', job_role as 'Job Role' from survey where prompt_engg = 'no' and job_role = 'Technical'
   ```

