# Introduction to Cliosight

Cliosight is a low-code platform that allows users to quickly add SQL databases through an intuitive interface, enabling the development of versatile data apps in just minutes. As we continue to evolve, we plan to expand our compatibility to include a wide range of platform-specific databases.

### Free Tier (Tentative) <a name="freetier"></a>   
    
|Category     |Free for 14 days|
|:----------------------|:-------------|
|Users    | 1    |
|Datasources       | 1 (in-built)
|Data and Files    |4 GB    |
|Widgets           |Unlimited|
|Automation        |Limited|
|Notification      |Limited |
|Customization           |None |
|Support    |Limited   |

### Support for Multiple Datasources <a name="datasources"></a>             
                  
**SQL** - MySQL, Microsoft SQL Server (and Postgres).          
**Data Warehouse** - (Google Big Query)    

### Leveraging AI <a name="ai"></a>
To provide a better user experience through the use of AI, we will add code generators for the two types of syntaxes used within the platform.  
1. SQL query generator for creating reports,     
2. JSON body generator for element configuration.           

### Email Notification <a name="email"></a>    
Using our notifications, users will be able to send a max of 100 emails to valid email ids for free during the trial period.

<p align="center">
<h2 align="left">Primary Components of a Cliosight Application</h2>
</p>

[Form](#form)  &nbsp;&nbsp;|&nbsp;&nbsp;      [Report](#report)   &nbsp;&nbsp;|&nbsp;&nbsp;     [Dashboard](#dashboard)   &nbsp;&nbsp;|&nbsp;&nbsp;    [Automation](#automation)          

### Form <a name="form"></a>    
A form is the data input method for populating tables. It can have multiple sub-forms. It supports all basic elements of a conventional HTML5 form. With the 'pre' and 'post' HTML JSON tags a form can function like a web page. A form is complete, except for the limitation that it can have only one submit button. Pre-defined values of input fields like a drop-down menu or a multi-select option may contain column values of a [report](#report). 

[Click here](https://github.com/cliosight/Docs/blob/main/form_json_format.css) to see all JSON tags that can be used for creating a form.

### Example of Forms - Meeting Scheduler Application <a name="form_example"></a>        
For an application like a "company meeting scheduler", forms can be used to add contacts, groups and meeting requests. Data entered can be used to [automate](#automation) tasks like sending out emails for meeting invite, update or cancellation.          

[Contact](https://app.cliosight.com/app/forms/35/show/public?noNavbar=true) ,   [Group](https://app.cliosight.com/app/forms/34/show/public?noNavbar=true) ,   [Meeting](https://app.cliosight.com/app/forms/58/show/public?noNavbar=true)     

Note that adding 'Groups' to a 'Contact' and a 'Meeting' are disabled. This is because the [reports](#report) listing group names defined by their respective SQL queries are <b>not "public"</b>. 

**JSON specification of the 'Meeting' form** <a name="meeting_form"></a> ( [JSON](https://github.com/cliosight/Docs/blob/main/meeting_form_json.json) )          

This example shows how a Cliosight form can accomodate complex relations of a database.    
1. Multiselect input options from a report column       
2. Drop down menu with hardcoded values     
3. Rules based on the values selected from the drop down    
4. 'Meeting Purpose' sub-form within the form     
5. Multiple instances of aggregated values within the sub-form      

### File Storage <a name="afiles"></a>      
This platform provides specific functionalities for files uploaded through a form. The [free tier](#freetier) will allow a max of 4GB storage space for the in-built database and file storage. Like UI components, files are also equipped with access control.  
      
### Report <a name="report"></a>          
While a form is the data input interface, a report is the output of data analysis with SQL. Results of a report can be accessed via Cliosight's API or exported to other datasources with [jobs](#jobs). Within an enterprise application's schema, there can be numerous SQL queries, leading to countless report and filter combinations. This is because a filter like a form input can show the column values of a report apart from hard-coded values.

### Example of a Report - Contacts and Groups Report  <a name="report_example"></a> 
[Contacts & Groups](https://app.cliosight.com/app/reports/29/show/public?noNavbar=true)      
      
**SQL query:**         
``` sql
select min(c.id) as contact_id, min(gc.group_id) as group_id, min(c.name) as Name, \
min(c.email) as Email, min(c.phone) as Phone, min(c.stage) as Stage, \      
count(gc.id) as 'Total Groups' from `contacts` c  \     
left join `groups_contacts` gc on gc.contact_id = c.id  \
where ({{term}} is null or c.name like concat('%',{{term}},'%') or c.phone like concat('%',{{term}},'%'))  \
and (c.name = {{Name}} or {{Name}} is null)  \
and (c.phone = {{Phone}} or {{Phone}} is null)  \
group by c.id limit {{startIndex}}, {{pageSize}};
```

**JSON:**            
```json
{
    "datasource_id": "1",
    "multipleStatements": true,
    "is_public": {
        "status": true
    },
    "post_html": "",
    "css_definition": "",
    "columns": {
        "group_id": {
            "hidden": true
        },
        "contact_id": {
            "hidden": true
        },
        "Name": {
            "links": [{
                "type": "form",
                "id": "35",
                "args": [{
                    "report_column": "contact_id",
                    "name": "id"
                }, {
                    "report_column": "Email",
                    "name": "email"
                }],
                "label": "Edit Contact"
            }]
        },
        "Total Groups": {
            "text-align": "right",
            "dropdown-menu-align": "right",
            "links": [{
                "type": "report",
                "id": "31",
                "args": [{
                    "report_column": "contact_id",
                    "name": "contact_id"
                }],
                "label": "View Groups"
            }]
        }
    },
    "filter_menu": [{
        "column": "Name"
    }, {
        "column": "Email",
        "report_id": 49,
        "name": "email"
    }, {
        "column": "Phone"
    }, {
        "column": "Total Groups"
    }],
    "report_links": [{
        "type": "form",
        "id": "35",
        "label": "Add a Contact"
    }]
}
```

### Creating Graphs and Charts with JavaScript libraries and Reports <a name="graphs"></a>
Tabular data from reports can be used to plot graphs and charts using the standard Javascript libraries like Chart.js, HighCharts, D3.js, and C3.js to name a few. One such example is a line chart that depicts trends form datasets in three different datasources, viz. in-built, containerized and fully-managed MySQL database instances across different cloud platforms. We can also display live stats by fetching data through a report API or by using it in an iframe. The simplest way is to add it to a dashboard.      
     
Chart with different datasources (coming soon)                
[Live stats](https://app.cliosight.com/app/reports/85/show/public?noNavbar=true)    

SQL query for the report:     
```sql
select concat(count(*), ' Meetings Scheduled') from `meetings` as count       
union all   
select concat(count(*), ' Contacts Created') from `contacts` as count    
union all    
select concat(count(*), ' Groups Organized') from `groups` as count    
union all    
select concat(count(*), ' Interviews Recorded') from `interviews` as count    
```
Corresponding JSON:    
```json
{
    "datasource_id": "1",
    "pre_html": "<img src=\"\">",
    "is_public": {
        "status": true
    },
    "css_definition": "",
    "post_html": "",
    "columns": {}
}
```

### Using Reports in Jupyter Notebook <a name="jupyter"></a>
Public datasets are typically downloaded as CSV files on the hard disk of personal computers, cloud VM or storage attached to a serverless application. Data is processed, split or merged accordingly. Results can be dumped as a CSV file or plotted on a graph using matplotlib, seaborn etc. Custom datasets, on the other hand, can be accessed using TensorFlow Dataset (TFDS) and `torch.utils.data` in PyTorch.     

Alternatively, reports from different datasources in one or more Cliosight accounts can be used for the same purpose. The results of subsequent operations can be pushed back to connected datasources as new reports or as additional records for existing reports. This makes creating, updating and sharing private datasets more secure in a collaborative work environment.   

### Ensuring Trustworthiness <a name="trust"></a>           
Users can restrict data input into a table using the following methods:  
1. Disabling CSV data import.     
2. Disabling manual insert, update or delete query execution on the associated tables.
3. Ensuring that no other forms or endpoints can insert data into the tables.
4. Disabling data export.       

This approach ensures that the primary table and associated sub-form tables receive their inputs through the designated form interface or endpoint only. This real-world data can be used for generating better artificial datasets.
       
### Data Privacy and Security <a name="security"></a>       
In order to provide assurance to users, Cliosight is designed to have in place all the possible tools to make datasets compliant with the applicable security regulations.    
Some of the in-built features are:    
1. Discretionary and Role-based Access Control (Admin, User and Admin-Minor).
2. Secure protocols for data and file transfer like HTTPS and SFTP.
3. Removal of sensitive information from data with pre-defined SQL queries.     
   
EU and USA: [GDPR vs. HIPPA compliance](https://www.onetrust.com/blog/hipaa-vs-gdpr-compliance/)      
India: [The PDP Bill](https://www.meity.gov.in/writereaddata/files/The%20Digital%20Personal%20Data%20Potection%20Bill%2C%202022_0.pdf) [The EHR Standards](https://main.mohfw.gov.in/sites/default/files/17739294021483341357.pdf)     


### Dashboard <a name="dashboard"></a>        
A dashboard is an aggregation of forms, reports, charts and HTML. This makes it the easiest way to create and host an analytics dashboard or a data application.                                    
### Examples of Dashboards <a name="dashboard_example"></a>   

[Cliosight Meetings](https://app.cliosight.com/app/dashboards/49/show/public?noNavbar=true)                    

```json
{
    "is_public": {
        "status": true
    },
    "css_definition": "",
    "pre_html": "<h1>Cliosight Meetings</h1>",
    "hideToolbar": false,
    "post_html": "<h6>Copyright Cliosight 2024. All rights reserved</h6>",
    "widget_groups": [{
        "widgets": [{
                "id": "85",
                "cols": 12,
                "removeReportCss": false
            }, {
                "html": "<h4 style=\"\">Charts and Graphs</h4><br/>",
                "cols": 12,
                "type": "html"
            },
            {
                "html": "<h2></h2>",
                "cols": 2,
                "type": "html"
            },
            {
                "html": " <iframe src=\"\" style=\"\" title=\"\"></iframe> ",
                "cols": 8,
                "type": "html"
            },
            {
                "html": "<br/><br/><h4 style=\"\">Group, Contact and Meeting Forms</h4>",
                "cols": 12,
                "type": "html"
            },
            {
                "type": "form",
                "id": "34",
                "cols": 12,
                "removeFormCss": false
            },
            {
                "type": "form",
                "id": "35",
                "cols": 12,
                "removeFormCss": false
            },
            {
                "type": "form",
                "id": "58",
                "cols": 12,
                "removeFormCss": false
            },
            {
                "id": "88",
                "cols": 12,
                "removeReportCss": false
            }, {
            "html": "<br/><h4 style=\"\">Reports with Global Filters</h4><br/>",
            "cols": 12,
            "type": "html"
        }
        ]
    }, {
        "widgets": [{
            "id": "68",
            "cols": 6,
            "removeReportCss": false
        }, {
            "id": "37",
            "cols": 6,
            "removeReportCss": false
        }],
        "filter_menu": [{
            "label": "Group",
            "column": "id",
            "column_label": "Name",
            "report_id": 28,
            "name": "group_id",
            "reports": {
                "37": {
                    "report_column": "group_id",
                    "name": "group_id",
                    "label": "Group",
                    "label_column": "Name"
                },
                "68": {
                    "report_column": "group_id",
                    "name": "group_id",
                    "label": "Group",
                    "label_column": "Name"
                }
            }
        }]
    }]
}
```

### Automation <a name="automation"></a>   
Simple UI like forms and dashboards are useful. However, for developing a full-fledged cloud-hosted CRM application, automating tasks is necessary. Our syntax provides a shorthand for one-click deployment of automation code. Provision for custom Javascript/Python code will be available soon.     

### Sending Email Notification on Event <a name="trigger_email"></a>        
Sending notifications on events can be configured like any other backend component.   

### Trigger <a name="trigger"></a>   
A trigger enables action on data and insights. Since we are dealing with structured data, it means executing the basic operations on table rows based on events.  
    
### Example of a Trigger - Managing an SCD (Slowly Changing Dimension) <a name="scd"></a>    
**Existing Contact update action**  
```json 
{
    "client_id": 2,
    "trigger_definition": {
        "trigger_type": "update",
        "trigger_entity": "`contacts`",
        "trigger_condition_query": "select ('{{old_row.stage}}' <> '{{new_row.stage}}') as 'condition'",
        "trigger_action_query": "insert into contacts_scd (email, stage, start_datetime) values('{{new_row.email}}', '{{new_row.stage}}', '{{current_datetime}}')",
        "label": "Existing Contact Stage SCD"
    },
    "datasource_id": 1
}
```
### Job <a name="jobs"></a>   
A job executes SQL queries at intervals for performing an ETL operation.   

### Example of a Job - Managing free tier users of a SaaS platform <a name="job_example"></a>     
Let's consider a simple application that notifies trial users of a SaaS product. As an admin, I need to send notifications everyday through email.     

### Workflow <a name="workflow"></a>     
A workflow in Cliosight is an aggregation of jobs and triggers. Since it can be configured only for one datasource at a time, fetching data from others has to be carried out through other utility jobs or workflows.       

### Example of a Workflow - Executing daily sales operational tasks <a name="workflowexamples"></a>        
Consider the sales funnel that comprises sending out personalized emails to existing and potential customers on certain events at regular intervals.   

### Using Workflows in Jupyter Notebook for Machine Learning <a name="python"></a>     
Data analysis can provide pointers for fine-tuning a design through hypothesis testing. It can also help in improving the performance of a machine learning model in production with high quality datasets. 

Being able to create a workflow by combining data analytics tasks using a simple JSON configuration can speed up the design and development of a project powered by machine learning. Cliosight's components can be created instantly in external applications.    

### Fetching Data from a Report           
       
```python
...
url = "https://app.cliosight.com/node/reports/70/data"
# with filter
# url = "https://app.cliosight.com/node/reports/70/data?tableRow={\"Agent\":\"Best Bricks\"}"

payload = json.dumps({
  "startIndex": 0,
  "pageSize": 500  
})

response = requests.request("POST", url, headers=headers, data=payload)
...
```
### Creating a new Report           
```python
...
json_data = {
    'report_definition': {
        'config': '{ "columns": {}\n}',
        'query': "select * from `contacts` c where c.name like '%Jigisha%'",
        'label': 'Contacts Named Jigisha',
    },
    'mc_users': [
        '2',
        '6',
    ],
    'mc_groups': [
        '5',
    ],
    'datasource_id': '1',
}

response = requests.post('https://app.cliosight.com/node/reports/create', headers=headers, json=json_data)
...        
```



