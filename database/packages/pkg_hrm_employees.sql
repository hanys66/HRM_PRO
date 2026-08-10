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
CREATE OR REPLACE PACKAGE BODY PKG_HRM_EMPLOYEES AS


    /*======================================================================
      ADD_EMPLOYEE
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
    )
    IS
    BEGIN

        INSERT INTO HRM_EMPLOYEES
        (
            EMPLOYEE_NO,
            FIRST_NAME,
            MIDDLE_NAME,
            LAST_NAME,

            FIRST_NAME_AR,
            MIDDLE_NAME_AR,
            LAST_NAME_AR,

            GENDER_ID,
            DATE_OF_BIRTH,
            NATIONAL_ID,

            DEPARTMENT_ID,
            JOB_ID,

            HIRE_DATE,
            EMP_STATUS_ID,

            ACTIVE_YN
        )
        VALUES
        (
            p_employee_no,
            p_first_name,
            p_middle_name,
            p_last_name,

            p_first_name_ar,
            p_middle_name_ar,
            p_last_name_ar,

            p_gender_id,
            p_date_of_birth,
            p_national_id,

            p_department_id,
            p_job_id,

            p_hire_date,
            p_emp_status_id,

            'Y'
        )
        RETURNING EMPLOYEE_ID
        INTO p_employee_id;

    END ADD_EMPLOYEE;


    /*======================================================================
      UPDATE_EMPLOYEE
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
    )
    IS
    BEGIN

        UPDATE HRM_EMPLOYEES
        SET
            FIRST_NAME      = p_first_name,
            MIDDLE_NAME     = p_middle_name,
            LAST_NAME       = p_last_name,

            FIRST_NAME_AR   = p_first_name_ar,
            MIDDLE_NAME_AR  = p_middle_name_ar,
            LAST_NAME_AR    = p_last_name_ar,

            GENDER_ID       = p_gender_id,
            DATE_OF_BIRTH   = p_date_of_birth,
            NATIONAL_ID     = p_national_id,

            DEPARTMENT_ID   = p_department_id,
            JOB_ID          = p_job_id,

            HIRE_DATE       = p_hire_date,
            EMP_STATUS_ID   = p_emp_status_id,

            ACTIVE_YN       = p_active_yn

        WHERE EMPLOYEE_ID = p_employee_id;


        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(
                -20001,
                'Employee not found: ' || p_employee_id
            );
        END IF;

    END UPDATE_EMPLOYEE;


    /*======================================================================
      DELETE_EMPLOYEE
    ======================================================================*/

    PROCEDURE DELETE_EMPLOYEE
    (
        p_employee_id IN HRM_EMPLOYEES.EMPLOYEE_ID%TYPE
    )
    IS
    BEGIN

        DELETE FROM HRM_EMPLOYEES
        WHERE EMPLOYEE_ID = p_employee_id;


        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(
                -20002,
                'Employee not found: ' || p_employee_id
            );
        END IF;

    END DELETE_EMPLOYEE;


    /*======================================================================
      GET_EMPLOYEE
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
    )
    IS
    BEGIN

        SELECT
            EMPLOYEE_NO,
            FIRST_NAME,
            MIDDLE_NAME,
            LAST_NAME,
            DEPARTMENT_ID,
            JOB_ID,
            HIRE_DATE,
            EMP_STATUS_ID,
            ACTIVE_YN

        INTO
            p_employee_no,
            p_first_name,
            p_middle_name,
            p_last_name,
            p_department_id,
            p_job_id,
            p_hire_date,
            p_emp_status_id,
            p_active_yn

        FROM HRM_EMPLOYEES

        WHERE EMPLOYEE_ID = p_employee_id;


    EXCEPTION

        WHEN NO_DATA_FOUND THEN

            RAISE_APPLICATION_ERROR(
                -20003,
                'Employee not found: ' || p_employee_id
            );

    END GET_EMPLOYEE;


END PKG_HRM_EMPLOYEES;
/
