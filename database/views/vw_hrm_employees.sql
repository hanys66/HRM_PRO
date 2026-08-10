/*==============================================================================
 Project    : HRM_PRO
 File       : vw_hrm_employees.sql
 Object     : VW_HRM_EMPLOYEES
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Business-friendly employee view for reporting and APEX pages.

==============================================================================*/

CREATE OR REPLACE VIEW VW_HRM_EMPLOYEES AS
SELECT

    e.EMPLOYEE_ID,

    e.EMPLOYEE_NO,

    /* English full name */
    TRIM(
        e.FIRST_NAME || ' ' ||
        NVL(e.MIDDLE_NAME || ' ', '') ||
        e.LAST_NAME
    ) AS EMPLOYEE_NAME,

    /* Arabic full name */
    TRIM(
        e.FIRST_NAME_AR || ' ' ||
        NVL(e.MIDDLE_NAME_AR || ' ', '') ||
        e.LAST_NAME_AR
    ) AS EMPLOYEE_NAME_AR,

    e.FIRST_NAME,
    e.MIDDLE_NAME,
    e.LAST_NAME,

    e.FIRST_NAME_AR,
    e.MIDDLE_NAME_AR,
    e.LAST_NAME_AR,

    /* Gender */
    gender.LOOKUP_CODE AS GENDER_CODE,
    gender.LOOKUP_NAME AS GENDER_NAME,

    /* Department */
    d.DEPARTMENT_ID,
    d.DEPARTMENT_CODE,
    d.DEPARTMENT_NAME,
    d.DEPARTMENT_NAME_AR,

    /* Job */
    j.JOB_ID,
    j.JOB_CODE,
    j.JOB_TITLE,
    j.JOB_TITLE_AR,

    e.DATE_OF_BIRTH,
    e.NATIONAL_ID,
    e.HIRE_DATE,

    /* Employment Status */
    status_lkp.LOOKUP_CODE AS EMP_STATUS_CODE,
    status_lkp.LOOKUP_NAME AS EMP_STATUS_NAME,

    e.ACTIVE_YN,

    e.CREATED_BY,
    e.CREATED_DATE,
    e.UPDATED_BY,
    e.UPDATED_DATE

FROM HRM_EMPLOYEES e

JOIN HRM_DEPARTMENTS d
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID

JOIN HRM_JOBS j
    ON j.JOB_ID = e.JOB_ID

JOIN HRM_LOOKUPS gender
    ON gender.LOOKUP_ID = e.GENDER_ID

JOIN HRM_LOOKUPS status_lkp
    ON status_lkp.LOOKUP_ID = e.EMP_STATUS_ID;
