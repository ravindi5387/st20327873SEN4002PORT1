 📊 Family Budget Management System

📌 Project Overview
The Family Budget Management System is a web-based application that helps families manage their finances effectively. It provides tools to track income, expenses, and savings, making financial decision-making easier. The system is designed with multiple dashboards for different users, enabling transparency and efficiency in managing budgets.



🚀 Features
- 👨‍👩‍👧‍👦 Multi-user roles (Admin, Owner, Member)
- ➕ Add, edit, and delete income/expenses
- 📈 Generate reports and summaries
- 📊 Graphical charts for better analysis
- 🔐 Secure login system
- 🗂️ Organized database integration
- 📱 Simple and user-friendly interface



 🛠️ Technologies Used
- Frontend: HTML, CSS, JavaScript  
- Backend:PHP  
- Database: MySQL  


 📂 Project Structure
 
- index.html → Homepage  
- about.html → About page  
- contact.html → Contact page  
- admin-dashboard.html → Admin dashboard  
- owner-dashboard.html → Owner dashboard  
- member-dashboard.html → Member dashboard  
- config.php → Database connection file  
- family_budget_db.sql → Database script

   ⚙️ Installation Guide
1. Clone this repository:
   bash
   git clone (https://github.com/ravindi5387/st20327873SEN4002PORT1.git)
   

2.  Set up the database

    Open phpMyAdmin.
    Create a new database (e.g., family_budget_db).
    Import the family_budget_db.sql file from the repository.


3. Configure the backend
   
     Open the config.php file.
     Update database credentials (host, username, password, dbname).
   

5. Run the project

     Place the project folder in the htdocs directory (if using XAMPP).
     Start Apache and MySQL from XAMPP.
     Open a browser and go to: http://localhost/st20327873SEN4002PORT1

Login Page
<img width="975" height="568" alt="image" src="https://github.com/user-attachments/assets/c035c5be-9b4c-4f12-96c7-75fe5a0cea0b" />

Dashboard View
 - Admin Dashboard
   <img width="975" height="555" alt="image" src="https://github.com/user-attachments/assets/c82ebcb0-a041-40bd-afba-d00307efae93" />

- Family Owner Dashbord
<img width="753" height="378" alt="image" src="https://github.com/user-attachments/assets/33673f5b-d84a-4142-a117-d5579f8496e7" />

 - Family Member Dashbord
   <img width="975" height="577" alt="image" src="https://github.com/user-attachments/assets/c279a6fc-6567-4ce0-bb23-39782bd8e851" />

 - Add Expense
   <img width="975" height="535" alt="image" src="https://github.com/user-attachments/assets/5c2026a3-3ee4-4698-b4d9-e7ababf9b865" />

 - Reports
<img width="896" height="493" alt="image" src="https://github.com/user-attachments/assets/36187602-d895-474f-8d71-ae48d405062f" />



Family Budget Management System - User Manual

	Registration and Login

1. Access the System: Open your web browser and navigate to the Family Budget Management System URL.
2. Login: 
   - If you already have an account, enter your email/username and password
   - Select your role (Admin, Family Owner, or Family Member)
   - Click the "Login" button
   - 
3. Registration:
   - Click "Don't have an account? Register" on the login page
   - Fill in your details: Full Name, Email, Password, and confirm password
   - Select your role (Family Owner or Family Member)
   - Click "Register"

     
	Default Login Credentials
For demonstration purposes, the system includes these default accounts:
•	Admin Account:
- Email: admin@gmail.com
- Password: admin123
  
•	Family Owner Account:
- Username: owner
- Email: owner@gmail.com
- Password: owner123

  
•	Family Member Account:
- Email: member@gmail.com
- Password: member123

  
	User Roles
•	Administrator
- Manages all system users and families
- Configures system-wide settings and categories
- Generates system-wide reports
- Has access to all features

•	Family Owner
- Creates and manages their family group
- Adds/removes family members
- Sets budgets for family members
- Views all family transactions and reports
- Has full control over their family's financial data

•	Family Member
- Views their allocated budget and spending
- Adds personal transactions
- Views family financial overview (limited)
- Cannot modify family settings or other members' data



	Dashboard Guide
•	Admin Dashboard
The Admin Dashboard provides tools for system management:
1. System Overview: View total users, families, and transactions
2. User Management: 
   - Create new users with different roles
   - Edit existing user information
   - Delete users from the system
3. System Settings:
   - Manage budget categories (add, edit, delete)
   - Generate system-wide reports
   - Configure system parameters

•	Owner Dashboard
The Owner Dashboard is the control center for family finances:
1. Financial Summary: View total income, expenses, and balance
2. Expense Overview: Visual breakdown of spending by category
3. Family Management: 
   - Add new family members
   - Set individual budgets
   - View member spending activity
4. Transaction Management: Add and manage family transactions
5. Reporting: Generate detailed financial reports
   

•	Member Dashboard
The Member Dashboard provides a personalized view:
1. Personal Budget: View allocated budget and current spending
2. Spending Analysis: Visual breakdown of personal expenses
3. Transaction Management: Add personal income and expenses
4. Notifications: Receive alerts about budget limits and family updates
   

	Managing Transactions

•	Adding Transactions
1. Navigate to the Transaction section of your dashboard
2. Click "Add New Transaction"
3. Fill in the transaction details:
   - Type (Income or Expense)
   - Amount (in LKR)
   - Category (select from predefined categories)
   - Date
   - Description
   - Family Member (for owners adding transactions for others)
4. Click "Add Transaction"


•	Editing Transactions
1. Find the transaction in the transaction list
2. Click the "Edit" button (if available for your role)
3. Modify the transaction details
4. Save changes

•	Deleting Transactions
1. Find the transaction in the transaction list
2. Click the "Delete" button
3. Confirm the deletion in the pop-up window

	Family Management
•	Adding Family Members (Owners Only)
1. Navigate to the "Manage Family Members" section
2. Click "Add New Member"
3. Fill in the member details:
   - Full Name
   - Email Address
   - Role (Member or additional Owner)
   - Monthly Budget (in LKR)
4. Click "Add Member"


•	Removing Family Members (Owners Only)
1. Find the member card in the Family Members section
2. Click the "X" button in the top right corner
3. Confirm the removal
•	Setting Member Budgets (Owners Only)
1. When adding a new member, set the monthly budget in the form
2. To modify an existing member's budget:
   - Remove the member
   - Add them again with the updated budget
  
     
	Reports and Analytics
•	Generating Reports
1. Navigate to the Reports section (available to Admins and Owners)
2. Select report parameters:
   - Report Period (This Month, Last Month, Custom Range)
   - Report Type (Summary, Detailed Transactions, Category Breakdown, Member Spending)
3. Click "Generate Report"

•	Exporting Reports
1. Generate a report first
2. Click either:
   - "Export as PDF" to download a PDF version
   - "Export as CSV" to download a spreadsheet-friendly version


•	Understanding Reports
- Summary Report: Overview of income, expenses, and net balance
- Detailed Transactions: List of all transactions with full details
- Category Breakdown: Visual representation of spending by category
- Member Spending: Analysis of each family member's spending patterns

	System Settings
•	Managing Categories (Admins Only)
1. Navigate to System Settings > Budget Categories
2. To add a category:
   - Enter the category name
   - Select the type (Income or Expense)
   - Click "Add Category"
3. To edit a category:
   - Click the "Edit" button next to the category
   - Modify the name or type
   - Save changes
4. To delete a category:
   - Click the "Delete" button next to the category
   - Confirm deletion





	Troubleshooting
•	Common Issues
1. Login Problems:
   - Ensure you're using the correct credentials
   - Verify you've selected the correct role
   - Check that Caps Lock is not enabled

2. Transaction Not Appearing:
   - Refresh the page
   - Check if you've selected the correct date range

3. Report Generation Issues:
   - Ensure you've selected a valid date range
   - Check if there are transactions in the selected period

     
•	Getting Help
If you encounter issues not covered in this manual:
1. Check the "About" section for system information
2. Use the "Contact" form to reach support
3. Ensure your browser is updated to the latest version

   
•	Browser Compatibility
The system works best with:
- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+


  👨‍💻 Author

Name: Ravindi Sandali Perara (st20327873) 
University: Cardiff Metropolitan University (via ICBT, Colombo Campus)
Course: Software Engineering


📜 License

This project is developed for **academic purposes only** and is **not intended for commercial use**. 

You are free to:
- View the code
- Learn from the code
- Share the code for educational purposes

You are **not allowed** to:
- Use this code for commercial purposes
- Claim this work as your own
- Distribute modified versions for profit

© 2025 Ravindi Sandali . All rights reserved.


  






