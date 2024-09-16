Create database Bank_Loan_Project;
use Bank_Loan_Project;

select * from finance_1;
select count(*) from finance_1;
select count(*) from finance_2;

# 1. Year wise loan amount Stats
select year(issue_d) as year, sum(loan_amnt) as Total_Loan_Amount
from finance_1 group by year order by year desc;

select year(issue_d) as year, concat(round((sum(loan_amnt)/1000000),2),"M") as Total_Loan_Amount
from finance_1 group by year order by year ;

# 2. Grade and sub grade wise revol_bal
select grade, sub_grade,concat(format(round(sum(revol_bal)/1000000),2),"M") as Revol_Balance 
from finance_1 inner join finance_2
on finance_1.id= finance_2.id
group by grade, sub_grade order by grade, sub_grade;

# 3. Total Payment for Verified Status Vs Total Payment for Non-Verified Status
select * from finance_1;
select verification_status, concat("$",format(round(sum(total_pymnt)/1000000, 2),2),"M")as Total_Payment 
from finance_1 inner join finance_2
on finance_1.id= finance_2.id
group by verification_status; 

# 4. State wise, Month wise Loan Status
select addr_state , monthname(last_credit_pull_d) as month, loan_status
from finance_1 inner join finance_2
on finance_1.id= finance_2.id
group by addr_state, month, loan_status
order by addr_state, month;

# 5. Home ownership Vs last payment date stats
select home_ownership, concat(year(last_pymnt_d),"-",monthname(last_pymnt_d))as last_payment_date
from finance_1 inner join finance_2 
on finance_1.id = finance_2.id
group by home_ownership, last_pymnt_d
order by home_ownership, last_pymnt_d;


 



