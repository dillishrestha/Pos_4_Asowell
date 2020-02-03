# POS_4_ASOWELL

**Status:**  Maintaining


**Main Feature:**
Restaurant Point of Sale System (ordering, stocking, data analysis,...)

  o	Include:

    •	Employee workspace: perform order operations in accordance with the business requirements of Asowel restaurant, view employee's personal information, and automatically check in when employees log into the software. Many employees can join the login, and join the order
    
    •	Admin workspace: manage all information and data related to the restaurant: Staff, Customers, Products (food), Raw materials, Sales invoices, Receiving invoices. Financial statistics, revenue (sales), expenses (purchase of raw materials and expenses incurred) of the whole restaurant system. Export report
    
    •	Warehouse workspace: Monitor and collect data about warehouse (inventory, used volume). Enter the warehouse receipt. Statistics data related to the warehouse. Export report
    
  o	Guaranty:
    
    •	Safety in unexpected incidents: for example, a power failure, hardware failure
    
    •	Data preservation, encryption of accounts
    
    •	Retrieve data, execute specialized tasks (order, export reports) quickly.


**Technology Usage**: C# .NET with WPF framework, Material Design. Include some open source library: MaterialDesignInXAML Toolkit, dragablz, mahapp.metro, livechart, EntityFramework, PDFReport,...



**Note:**
 - code style requirement not up to date
 - Mobile and Web version are in progress


# Develop Team:
    - Lưu Đức Trung (team leader, software back-end architecter, security, software event manipulator)
    - Nguyễn Hoàng Nam (main UI designer/creator, manage Warehouse and Admin workspace)
    - Lê Đức Anh (main back-end developer, software event manipulator, manage Admin workspace)
    
    
    -**Contact**:
      luuductrung@itcomma.com
      luuductrung1234@gmail.com
      0927333668


---
# Figure:
## Login Window
![Startup](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/startup.png)

![Login](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/login.png)

![Employee Login](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emplogin.png)

![Admin Login](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminlogin.png)

## Employee Workspace
![Start](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_front.png)
![Table map](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_table.png)
![Validation](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_validation.png)
![Entry](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_entry.png)
![Sub menu](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_submenu.png)
![Employee menu](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/emwsp_emmenu.png)

## Admin Workspace
![Start](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_start.png)
![Home](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_main.png)
![Float button](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_floatbutton.png)
![Food statistic](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_foodchart.png)
![Revenue statistic](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_statistic.png)
![Sample workspace](https://github.com/ITComma/POS-4-Asowel/blob/master/documents/images/adminwsp_subwindows.png)




---
# Software's procession:
    - [x] : apply asynchronous (also known as multi-stage programming) to help the program execute multiple tasks more effectively (this needs discussion)

  - **Database and WebService**:
    - [x] : Connect to data access operations (local) with ADO.NET Entity Framework
    - [x] : Connect to data processing access (cloud / web API) with ADO.NET Entity Framework
    - [x]  : Design allows data to be manipulated by multiple programs running simultaneously simultaneously safely, checking and preventing concurrency errors
    - [x]  : Apply Silence Retries to implicitly fix link errors and query data from the database
    - []  : The webservice provides data services and handles n-tier architectures. Combined storage synchronization between local database and cloud, increasing safety when unexpected incidents occur


  - **LoginWindow**:
    - [x] : Login for employees and managers, login with Employee Code
    - [x] : The function changes the database login configuration, after editing and logging in successfully, the program automatically stores the data of that database (next time there is no need to adjust). Database information will be saved to databaseinfo.txt
    - [x] : Encrypt user password

  - **EmployeeWorkspaceWindow**:
    - [x] : Staff login, automatically taking start login time. When the employee logs out, automatically takes the logout time, attendance and WorkingHistory during the day (the store procedure in the database will automatically update to the salary table of the current month of the employee)
    - [x] : Multiple employees who log in at the same time, are recorded
    - [x] : The window displays the seat map (based on the restaurant's map, allowing customization). When the employee selects the table, proceed to navigate to the Entry (order) window.
    - [x] : Admin level identity is required to edit Pin tables
    - [x] : Identity verification is required each time an order is made, and then orders can be processed until the individual has finished the current session.
    - [x] : Authentication by Employee Code
    - [x] : Store ID information of all employees acting on the same order
    - [x] : menu export frames, add dish fiter alphabetically, design button to find dishes (add photos for dishes if needed). There is also a raw material export frame (to ensure the ability to enter invoices to buy raw materials)
    - [x] : The frame enters the order operation, acting directly on the current table
    - [x] : Admin required for deletion of order information in current table
    - [x] : built the Settings framework for customizing some attributes in EmployeeWorkspaceWindow, the customizations saved to settinginfoinfo.txt
    - [x] : building an employee information framework, allowing employees to edit accounts and personal information
    
    The latter part is the printing and payment of bill
    
    - [x] : Allows payment and save ordered data to the database
    - [x] : Proceed to design the bill form
    - [x] : Print bill through printer. Customizable feature displays printed text before printing (order bill is divided by bar and kitchen, temporary bil and receipt bill)
    - [x] : Customize the printer
    - [x] : Print additional notes of each dish in the bill (kitchen print)
    - [x] : Export bill as pdf
    - [x] : In end of day report (in pdf document or listed invoice)
    - [x] : add logging function in case the program is closed unexpectedly (But saving employee information is not feasible). Can be solved by allowing after 5-10 minutes will automatically save the current time and current staff to the file
    - []  : Save the working history of the staff
    - [x] : swap/merge bill
    - [x] : Allow split bill to pay by each seat
    - [x] : Do not allow logging out while the table is under order
    
(*) expected: Supplementing customer information, adding function to export information and image to identify familiar customers, when exporting customer lists to employees, they can sort by the number of times customers have come to the shop.


  - **WareHouseWindow**:
    - [x] : login / logout
    - [x] : The frame to enter the invoice of the purchase of raw materials (similar to the order entry frame)
    - [x] : building a monitoring window, statistics on the amount of raw materials used and the amount of raw materials fed into the warehouse
    - [x] : Statistics of materials according to the amount used
    - [x] : Function of checking and announcing when the quantity of materials is low
    - [x] : build the order-entry window, after the order-entry staff automatically generates the ReceitpNote and ReceiptNoteDetails data in the database
    - []  : Warehouse for AdPress

  - **AdminWorkspaceWindow**:
    - [x] : Employee information form (interface / view / delete / edit information / search (by name,?))
    - [x] : Salary N`ote information form (interface / view / delete / edit information)
    - [x] : Customer information form (interface / view / delete / edit information / search (by name,?))
    - [x] : Product information form (interface / view / delete / search (by name,?))
    - [x] : Ingredient information form (interface / view / delete / edit information / search (by name,?))
    - [x] : Allows designing new dishes (food map and amount of ingredients tho recipe)
    - [x] : Order information form (view / view / search (by date,?))
    - [x] : ReceiptNote information form (view / view / search (by date,?))
    - [x] : Admin profile information form (interface / view / edit information) _ does not have permission to delete any admin
    - [x] : Export report for order / order details data, empschedule / salarynote
    - [x] : Export report for receiptnote data / receiptnote details
    - [x] : Export end of day report
    - [x] : Display data chart for order / order details ,, receipnote / receiptnote details. Income statistics
    - [x] : Display data chart for salaryNote / workingHistory and product (by quantity called)
    
(*) expected: The function allows the admin to add a weekly work schedule for employees, and employees can only log in within the time that the admin has set (if logging in later means working late, early logout over the specified time => notify admin, deduct salary). Revenue and expenditure audit function by day / month / year. Graphical function drawing income chart.
