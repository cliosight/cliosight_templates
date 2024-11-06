Template #1 - Survey Form
-------------------------
## [Cliosight Survey](https://app.cliosight.com/app/forms/221/show/public?noNavbar=true)   

### Highlights      
1. Multiselect input (Skills and Data Management Product Names)
2. Multiple Instances of Subform - Job Role      
3. Conditional Branching in Subform - Job Role (Functional & Technical)    
4. Link to another form "New Product Name" with access only for account users and superusers.
5. Hidden columns - location and current timestamp.      
6. Listing Skill names and Product names through 'public' reports - Skill_Names.json and Product_Names.json in multiselect option field.    
   SQL queries:
   ``` sql
   select * from skills;     
   select * from products;
   ```

