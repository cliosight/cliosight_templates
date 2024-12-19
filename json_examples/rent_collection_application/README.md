## Template #5 - House Rent Collection App                    
     
### [Rent Calculation Form](https://app1.cliosight.com/app/forms/217/show/public?noNavbar=true)  |   [Meter Reading Photos](https://app1.cliosight.com/app/reports/392/show/public?noNavbar=true)  | [House Rent Collection App](https://app1.cliosight.com/app/applications/11/show)            

### Highlights      
1. Creating a workflow with  triggers and jobs for completing related tasks in a particular sequence.  
2. Using public report data in an external application.
3. Processing images in a report.  
4. Configuring a form, report, trigger, job or workflow in an external application.  
5. Accessing a form with varying  pre-filled values in certain fields through QR codes.
6. Forms for restricted tables.   

### Application Schema    
The house rent application template was created to solve a personal problem. Most house owners are familiar with messaging services like Whatsapp, and spend time sharing pictures in social media. But when it comes to managing tenants, they prefer to use pen and paper to keep an account of  payments, expenses and personal details of tenants. Transactions are mostly done in cash. Receipts and identity documents are often missing. We wanted a way to solve these problems for ourselves and others who have tenants.   

### Primary entities
1. Payer (Tenant or Owner)      
2. Payee (Owner or Service Provider)       
3. Revenue (Rent)          
4. Expense (Building Maintenance)           
5. Inventory (Flats or Services & Items for maintenance)             
6. Rent Receipt       
7. Files (Meter Reading Pictures, Identity Documents of Tenants, Agreements)         

### Assumptions of the design     
1. The user is located in a remote city in India where electricity and water meters are not IoT enabled.   
2. We want a fully reliable method for collecting data through forms that are accessed by a maintenance staff member.      
3. Trained computer vision models provide an acceptable percentage of accuracy.     

