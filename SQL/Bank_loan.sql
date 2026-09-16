CREATE DATABASE Bank_Loan;

USE Bank_Loan;

CREATE TABLE finance (
    id INT,
    member_id INT,
    loan_amnt DECIMAL(12,2),
    funded_amnt DECIMAL(12,2),
    funded_amnt_inv DECIMAL(12,2),
    term VARCHAR(20),
    int_rate DECIMAL(10,6),
    installment DECIMAL(12,2),
    grade VARCHAR(5),
    sub_grade VARCHAR(5),
    emp_title VARCHAR(255),
    emp_length VARCHAR(30),
    home_ownership VARCHAR(30),
    annual_inc DECIMAL(15,2),
    verification_status VARCHAR(50),
    issue_d VARCHAR(20),
    loan_status VARCHAR(50),
    pymnt_plan VARCHAR(10),
    `desc` TEXT,
    purpose VARCHAR(100),
    title VARCHAR(255),
    zip_code VARCHAR(20),
    addr_state VARCHAR(10),
    dti DECIMAL(10,2)
);

SHOW TABLES;

DESCRIBE finance;

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

TRUNCATE TABLE finance;

LOAD DATA LOCAL INFILE 'C:/Users/deven/Desktop/Internship Project/SQL Bank_Loan/Finance_1.csv'
INTO TABLE finance
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM finance;

SELECT *
FROM finance
LIMIT 10;

SELECT
    id,
    COUNT(*) AS duplicate_count
FROM finance
GROUP BY id
HAVING COUNT(*) > 1;

SELECT
    SUM(id IS NULL) AS id_null,
    SUM(member_id IS NULL) AS member_id_null,
    SUM(loan_amnt IS NULL) AS loan_amnt_null,
    SUM(funded_amnt IS NULL) AS funded_amnt_null,
    SUM(funded_amnt_inv IS NULL) AS funded_amnt_inv_null,
    SUM(term IS NULL) AS term_null,
    SUM(int_rate IS NULL) AS int_rate_null,
    SUM(installment IS NULL) AS installment_null,
    SUM(grade IS NULL) AS grade_null,
    SUM(sub_grade IS NULL) AS sub_grade_null,
    SUM(emp_title IS NULL) AS emp_title_null,
    SUM(emp_length IS NULL) AS emp_length_null,
    SUM(home_ownership IS NULL) AS home_ownership_null,
    SUM(annual_inc IS NULL) AS annual_inc_null,
    SUM(verification_status IS NULL) AS verification_status_null,
    SUM(issue_d IS NULL) AS issue_d_null,
    SUM(loan_status IS NULL) AS loan_status_null,
    SUM(pymnt_plan IS NULL) AS pymnt_plan_null,
    SUM(`desc` IS NULL) AS description_null,
    SUM(purpose IS NULL) AS purpose_null,
    SUM(title IS NULL) AS title_null,
    SUM(zip_code IS NULL) AS zip_code_null,
    SUM(addr_state IS NULL) AS state_null,
    SUM(dti IS NULL) AS dti_null
FROM finance;

SELECT
    term,
    COUNT(*) AS loan_count
FROM finance
GROUP BY term
ORDER BY term;

SELECT
    loan_status,
    COUNT(*) AS loan_count
FROM finance
GROUP BY loan_status
ORDER BY loan_count DESC;

USE bank_loan;
CREATE TABLE finance_2 (
    id INT,
    delinq_2yrs INT,
    earliest_cr_line VARCHAR(20),
    inq_last_6mths INT,
    mths_since_last_delinq INT,
    mths_since_last_record INT,
    open_acc INT,
    pub_rec INT,
    revol_bal DECIMAL(15,2),
    revol_util DECIMAL(10,4),
    total_acc INT,
    initial_list_status VARCHAR(10),
    out_prncp DECIMAL(15,2),
    out_prncp_inv DECIMAL(15,2),
    total_pymnt DECIMAL(15,5),
    total_pymnt_inv DECIMAL(15,5),
    total_rec_prncp DECIMAL(15,2),
    total_rec_int DECIMAL(15,2),
    total_rec_late_fee DECIMAL(15,2),
    recoveries DECIMAL(15,2),
    collection_recovery_fee DECIMAL(15,2),
    last_pymnt_d VARCHAR(20),
    last_pymnt_amnt DECIMAL(15,2),
    next_pymnt_d VARCHAR(20),
    last_credit_pull_d VARCHAR(20)
);

SET GLOBAL local_infile = 1;

TRUNCATE TABLE finance_2;

LOAD DATA LOCAL INFILE 'C:/Users/deven/Desktop/Internship Project/SQL Bank_Loan/Finance_2.csv'
INTO TABLE finance_2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM finance_2;

SELECT *
FROM finance_2
LIMIT 10;

SELECT
    id,
    COUNT(*) AS duplicate_count
FROM finance_2
GROUP BY id
HAVING COUNT(*) > 1;

SELECT
    SUM(id IS NULL) AS id_null,
    SUM(delinq_2yrs IS NULL) AS delinq_2yrs_null,
    SUM(earliest_cr_line IS NULL) AS earliest_cr_line_null,
    SUM(inq_last_6mths IS NULL) AS inq_last_6mths_null,
    SUM(mths_since_last_delinq IS NULL) AS mths_since_last_delinq_null,
    SUM(mths_since_last_record IS NULL) AS mths_since_last_record_null,
    SUM(open_acc IS NULL) AS open_acc_null,
    SUM(pub_rec IS NULL) AS pub_rec_null,
    SUM(revol_bal IS NULL) AS revol_bal_null,
    SUM(revol_util IS NULL) AS revol_util_null,
    SUM(total_acc IS NULL) AS total_acc_null,
    SUM(initial_list_status IS NULL) AS initial_list_status_null,
    SUM(out_prncp IS NULL) AS out_prncp_null,
    SUM(out_prncp_inv IS NULL) AS out_prncp_inv_null,
    SUM(total_pymnt IS NULL) AS total_pymnt_null,
    SUM(total_pymnt_inv IS NULL) AS total_pymnt_inv_null,
    SUM(total_rec_prncp IS NULL) AS total_rec_prncp_null,
    SUM(total_rec_int IS NULL) AS total_rec_int_null,
    SUM(total_rec_late_fee IS NULL) AS total_rec_late_fee_null,
    SUM(recoveries IS NULL) AS recoveries_null,
    SUM(collection_recovery_fee IS NULL) AS collection_recovery_fee_null,
    SUM(last_pymnt_d IS NULL) AS last_pymnt_d_null,
    SUM(last_pymnt_amnt IS NULL) AS last_pymnt_amnt_null,
    SUM(next_pymnt_d IS NULL) AS next_pymnt_d_null,
    SUM(last_credit_pull_d IS NULL) AS last_credit_pull_d_null
FROM finance_2;

-- YEAR WISE LOAN AMOUNT - QS-1

select year(issue_d) as loan_year,
	   sum(loan_amnt) as total_loan_amount
from finance
group by year(issue_d)
order by loan_year;

-- GRADE AND SUB-GRADE WISE REVOLVING BALANCE - QS 2

select f.grade,
	   f.sub_grade,
       sum(f2.revol_bal) as Total_revol_bal
from finance f inner join finance_2 f2
on f.id=f2.id
group by f.grade, f.sub_grade
order by f.grade;

-- TOTAL PAYMENT: VERIFIED VS NON-VERIFIED STATUS - QS 3

SELECT 
    verification_status,
    SUM(loan_amnt) AS total_payment
FROM finance
GROUP BY verification_status
ORDER BY total_payment DESC;

-- STATE WISE LOAN STATUS - QS 4
SELECT *FROM FINANCE;
SELECT * FROM FINANCE_2;

SELECT addr_state,loan_status,COUNT(id) AS TOTAL_COUNT
FROM finance
GROUP BY addr_state,loan_status
ORDER BY addr_state,loan_status;

---------------------------------------------------------------------------------------------------------------------------------

-- Month-Wise Loan Status
Select 
	Monthname(issue_d) As Loan_month,
    loan_status,
    Count(id) as Total_Loans
From finance
Group By Month(issue_d), Monthname(issue_d), Loan_status
Order By Month(issue_d), Loan_status;

Select	
monthname(issue_d) as Loan_month,
Loan_status,
Count(id) as Total_loans
From finance
group by month(issue_d), Monthname(issue_d), Loan_status
order by Month(issue_d), Loan_status;

-- Home Ownership and last payment date stats

SELECT
home_ownership,
COUNT(*) AS loan_count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM finance), 2) AS percentage
FROM finance
GROUP BY home_ownership
ORDER BY loan_count DESC;

SELECT
last_pymnt_d,
COUNT(*) AS payment_count
FROM finance_2
WHERE last_pymnt_d IS NOT NULL
  AND last_pymnt_d <> ''
GROUP BY last_pymnt_d
ORDER BY STR_TO_DATE(last_pymnt_d, '%b-%y');

-- Home Ownership Vs last payment date

SELECT
    f.home_ownership,
    f2.last_pymnt_d,
    COUNT(*) AS loan_count
FROM finance f
JOIN finance_2 f2
    ON f.id = f2.id
WHERE f2.last_pymnt_d IS NOT NULL
  AND f2.last_pymnt_d <> ''
GROUP BY
    f.home_ownership,
    f2.last_pymnt_d
ORDER BY
    f.home_ownership,
    STR_TO_DATE(f2.last_pymnt_d, '%b-%y');
-----------------------------------------------------------------------------------------------------------------



