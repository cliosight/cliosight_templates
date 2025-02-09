## Template #3 - Revenue and Expenses Portal            
     
### [Revenue Detail Form](https://app1.cliosight.com/app/forms/180/show/public?noNavbar=true)  |   [Revenue and Expenses Summary by Inventory](https://app1.cliosight.com/app/reports/273/show/public?noNavbar=true)  | [Revenue & Expenses Portal](https://app1.cliosight.com/app/applications/10/show)            

### Highlights      
1. Forms with mathematical expressions for dynamic calculation of numeric field values like taxes, discounted price and arrears.   
2. Using inline forms to update the value of a report cell without editing the row.      
3. Export HTML for generating PDF files from rows in a report.     
4. Using SQL queries for intermediate results in a form.      
5. Grouping together two or more columns under a broader category in a report.        
6. Adding multiple cloud datasources.
7. Configuring an API datasource.     
8. Scheduling jobs to perform ETL.     
9. Creating users and groups to grant specific permissions in an account.        

### Application Schema    
The revenue and expenses portal template is inspired by the bookkeeping tasks that eCommerce merchants need to manage while operating their online stores. In India, there are small, medium and large retail sellers that sell their consumer products through eCommerce platforms like Amazon, Flipkart, Etsy, Facebook Marketplace, Shopify and others. While some of them provide extensive tools to track important data, there is no convinient way for generating portable reports and artifacts. These include bills, invoices, receipts, pay slips, statements, contracts etc. that are often a part of the order lifecycle or business operation. This solution is primarily focused on such practical aspects of an eCommerce business.             

### Primary entities
1. Buyer/Customer/Client    
2. Inventory/Service   
3. Payer
4. Payee
5. Revenue     
6. Expense
7. Invoice 
8. Document 

### Assumptions of the design     
1. It is presumed that there is only manual entry of sale, purchase order and other transactions with the help of this portal.
2. The merchant has to merge data periodically from two or more cloud databases for a combined view.     
3. The merchant uses another SaaS solution to run marketing campaigns using email or Whatsapp.     
