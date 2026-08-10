/*==============================================================================
 Project    : HRM_PRO
 File       : pkg_hrm_employees.sql
 Object     : PKG_HRM_EMPLOYEES
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Business logic package for HRM employee operations.

==============================================================================*/


CREATE OR REPLACE PACKAGE PKG_HRM_EMPLOYEES AS


    /*======================================================================
      Add Employee
    ======================================================================*/

    PROCEDURE ADD_EMPLOYEE
    (
        p_employee_no       IN HRM_EMPLOYEES.EMPLOYEE_NO%TYPE,

        p_first_name        IN HRM_EMPLOYEES.FIRST_NAME%TYPE,
        p_middle_name       IN HRM_EMPLOYEES.MIDDLE_NAME%TYPE,
        p_last_name         IN HRM_EMPLOYEES.LAST_NAME%TYPE,

        p_first_name_ar     IN HRM_EMPLOYEES.FIRST_NAME_AR%TYPE,
        p_middle_name_ar    IN HRM_EMPLOYEES.MIDDLE_NAME_AR%TYPE,
        p_last_name_ar      IN HRM_EMPLOYEES.LAST_NAME_AR%TYPE,

        p_gender_id         IN HRM_EMPLOYEES.GENDER_ID%TYPE,
        p_date_of_birth     IN HRM_EMPLOYEES.DATE_OF_BIRTH%TYPE,
        p_national_id       IN HRM_EMPLOYEES.NATIONAL_ID%TYPE,

        p_department_id     IN HRM_EMPLOYEES.DEPARTMENT_ID%TYPE,
        p_job_id            IN HRM_EMPLOYEES.JOB_ID%TYPE,

        p_hire_date         IN HRM_EMPLOYEES.HIRE_DATE%TYPE,
        p_emp_status_id     IN HRM_EMPLOYEES.EMP_STATUS_ID%TYPE,

        p_employee_id       OUT HRM_EMPLOYEES.EMPLOYEE_ID%TYPE
    );


    /*======================================================================
      Update Employee
    ======================================================================*/

    PROCEDURE UPDATE_EMPLOYEE
    (
        p_employee_id       IN HRM_EMPLOYEES.EMPLOYEE_ID%TYPE,

        p_first_name        IN HRM_EMPLOYEES.FIRST_NAME%TYPE,
        p_middle_name       IN HRM_EMPLOYEES.MIDDLE_NAME%TYPE,
        p_last_name         IN HRM_EMPLOYEES.LAST_NAME%TYPE,

        p_first_name_ar     IN HRM_EMPLOYEES.FIRST_NAME_AR%TYPE,
        p_middle_name_ar    IN HRM_EMPLOYEES.MIDDLE_NAME_AR%TYPE,
        p_last_name_ar      IN HRM_EMPLOYEES.LAST_NAME_AR%TYPE,

        p_gender_id         IN HRM_EMPLOYEES.GENDER_ID%TYPE,
        p_date_of_birth     IN HRM_EMPLOYEES.DATE_OF_BIRTH%TYPE,
        p_national_id       IN HRM_EMPLOYEES.NATIONAL_ID%TYPE,

        p_department_id     IN HRM_EMPLOYEES.DEPARTMENT_ID%TYPE,
        p_job_id            IN HRM_EMPLOYEES.JOB_ID%TYPE,

        p_hire_date         IN HRM_EMPLOYEES.HIRE_DATE%TYPE,
        p_emp_status_id     IN HRM_EMPLOYEES.EMP_STATUS_ID%TYPE,

        p_active_yn         IN HRM_EMPLOYEES.ACTIVE_YN%TYPE
    );


    /*======================================================================
      Delete Employee
    ======================================================================*/

    PROCEDURE DELETE_EMPLOYEE
    (
        p_employee_id       IN HRM_EMPLOYEES.EMPLOYEE_ID%TYPE
    );


    /*======================================================================
      Get Employee
    ======================================================================*/

    PROCEDURE GET_EMPLOYEE
    (
        p_employee_id       IN  HRM_EMPLOYEES.EMPLOYEE_ID%TYPE,

        p_employee_no       OUT HRM_EMPLOYEES.EMPLOYEE_NO%TYPE,
        p_first_name        OUT HRM_EMPLOYEES.FIRST_NAME%TYPE,
        p_middle_name       OUT HRM_EMPLOYEES.MIDDLE_NAME%TYPE,
        p_last_name         OUT HRM_EMPLOYEES.LAST_NAME%TYPE,

        p_department_id     OUT HRM_EMPLOYEES.DEPARTMENT_ID%TYPE,
        p_job_id            OUT HRM_EMPLOYEES.JOB_ID%TYPE,

        p_hire_date         OUT HRM_EMPLOYEES.HIRE_DATE%TYPE,
        p_emp_status_id     OUT HRM_EMPLOYEES.EMP_STATUS_ID%TYPE,

        p_active_yn         OUT HRM_EMPLOYEES.ACTIVE_YN%TYPE
    );


END PKG_HRM_EMPLOYEES;
/
