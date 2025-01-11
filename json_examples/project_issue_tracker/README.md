## Template #2 - Project Issue Tracker       
     
### [Project Detail Form](https://app1.cliosight.com/app/forms/270/show/public?noNavbar=true)  |   [Project-Requirement Drill down Report](https://app1.cliosight.com/app/reports/484/show/public?noNavbar=true)  | [Project Issue Tracker App](https://app1.cliosight.com/app/applications/1/show)            

### Highlights      
1. Reports with links to update a row through a form, to access another report for drilldown or to download results into a .csv file.                 
2. Reports with filters showing values from other reports, including both single and multi-select options.     
3. Reports with filters for a range of values such as timestamp, count, price, and other similar quantitative metrics.
4. Ability to sort the values of a report column.    
5. Row deletion functionality in a report.             
6. Global filters connecting two or more reports that share common columns.     
7. File upload form with validations, and sharing files within a report.      
8. Specifying chart views in report configurations.      
9. Using a dropdown menu in charts to reduce the number of parameters and to change metrics.      
10. Forms with an import link to upload bulk data from a .csv file.      
11. Updating the value of a column or sending email notifications on certain events using triggers.      
12. Using a "helper_input" field in a form to provide a dynamic dropdown or to create empty space.      
13. Incorporating "html" tags in a Single Page Application (SPA).      
14. Using Cliosight workspace to organize widget and automation configurations.      

### Application Schema    
The project issue tracker application template is inspired by bug tracker platforms like Jira, Asana, Bugzilla, Zoho Bug tracker etc. Although the overall design is quite simple, it can serve the basic purpose of sharing project requirements, tasks, work progress and individual effort by team members working together on a project.            

### Primary entities
    
1. Project     
2. Project Requirement      
3. Team Member Contact
4. Group     
5. Team Member Absence Record
6. Files (Documents)
7. Employee     

### Assumptions of the design     
   
1. A Project can have multiple project requirements and associated projects. A Project Requirement similarly can be associated with multiple projects and other requirements for tracking dependencies.       
2. A project team can be composed of employees, clients, contract workers, business partners and other stakeholders who might assume managerial roles within the team.    
3. A Team Member Contact is a record maintained by the project manager for co-ordinating with team members while assigning tasks.      
4. A team member can belong to multiple Groups and report to more than one manager.     
5. A supervisor or a manager has to approve the leaves filed by team members. Approvers will get notified through email. Similarly, on approval or rejection the team member will receive an update through email.
6. Monthly salaries (or payouts) can also be calculated for Employees, Freelancers or Contract workers based on the project manager's decision to make deductions against a leave.
7. Files uploaded through any of the forms can only be plain text files, PDFs, images or videos of certain minimum/maximum size and resolution if applicable. Multiple file upload is not supported.     
8. Data uploaded through the import functionality in forms is also restricted to a maximum size.       
   
   


