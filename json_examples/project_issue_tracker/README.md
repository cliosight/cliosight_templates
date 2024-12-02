## Template #2 - Project Issue Tracker       
     
### [Project Details Form](https://app1.cliosight.com/app/forms/270/show/public?noNavbar=true)  |  [Project Management SPA](https://app1.cliosight.com/app/pages/160/show?noNavbar=true)  |  [Team Management SPA](https://app1.cliosight.com/app/pages/161/show?noNavbar=true)  |  [Project Issue Tracker App](https://app1.cliosight.com/app/applications/1/show)            

### Highlights      
1. Reports with links to update a row through a form and to access another report demonstrating limited and infite drilldown.            
2. Reports with filters showing values from other reports, including both single and multi-select options.     
3. Reports with filters for a range of values such as timestamp, count, price, and other similar quantitative metrics.      
4. Row deletion functionality in a report.       
5. Grouping related columns under a broader category in a report.      
6. Global filters for two or more reports that share one or more common columns.     
7. File upload form with validations, and sharing files within a report.      
8. Specifying chart views in report configurations.      
9. Using a dropdown menu in charts to reduce the number of parameters and to change metrics.      
10. Forms with an import link to upload bulk data from a .csv file.      
11. Updating the value of a column or sending email notification on certain events using triggers.      
12. Using a "helper_input" field in a form to provide a dynamic dropdown or to create empty space.      
13. Incorporating "html" tags in a Single Page Application (SPA).    

### Application Schema    
The project issue tracker application template is inspired from bug tracker platforms used in companies. For example Jira, Asana, Bugzilla, Zoho Bug tracker etc. Although the overall design is quite simple, it can serve the basic purpose of sharing project requirements and tracking work progress with individual effort of team members working together on a project.            

### Primary entities
    
1. Project (with sub categories)    
2. Project Requirement (with sub categories)     
3. Team Member Contact
4. Group     
5. Team Member Absence Record
6. Files (Documents)
7. Employee     

### Assumptions of the design     
   
1. A Project can have multiple project requirements and associated projects. A Project Requirement similarly, can have multiple projects and related requirements to indicate dependency.       
2. A project team can be composed of employees, interns, business partners, clients and other stakeholers who might assume managerial roles within the team.    
3. A Team Member Contact is a record maintained by the project manager for co-ordinating with team members while assigning tasks.      
4. A Contact can have multiple Groups and managers.     
5. A supervisor or a manager has to approve the leaves filed by team members who will get notified through email. Similarly, on approval or rejection, the team member receives an email.
6. Monthly salaries (or payouts) can also be calculated for Employees, Freelancers or Contract workers, based on the project manager's decision to make deductions if necessary against a leave.
7. The files uploaded through any or the forms can only be plain text files, PDFs, images or videos of certain minimum/maximum size and resolution if applicable. Multiple file uploaded is not supported at the moment.     
8. Data uploaded through the import functionality is also restricted to a maximum size.       
   
   


