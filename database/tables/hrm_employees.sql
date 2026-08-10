/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_employees.sql
 Object     : HRM_EMPLOYEES
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Central employee master table for HRM_PRO.

 Relationships:
     HRM_LOOKUPS       -> Gender
     HRM_DEPARTMENTS   -> Department
     HRM_JOBS          -> Job
     HRM_LOOKUPS       -> Employment Status

==============================================================================*/

CREATE TABLE HRM_EMPLOYEES
(
    EMPLOYEE_ID         NUMBER(10)           NOT NULL,

    EMPLOYEE_NO         VARCHAR2(20 CHAR)    NOT NULL,

    FIRST_NAME          VARCHAR2(100 CHAR)   NOT NULL,
    MIDDLE_NAME         VARCHAR2(100 CHAR),
    LAST_NAME           VARCHAR2(100 CHAR)   NOT NULL,

    FIRST_NAME_AR       VARCHAR2(100 CHAR),
    MIDDLE_NAME_AR      VARCHAR2(100 CHAR),
    LAST_NAME_AR        VARCHAR2(100 CHAR),

    GENDER_ID           NUMBER(8)            NOT NULL,

    DATE_OF_BIRTH       DATE,

    NATIONAL_ID         VARCHAR2(30 CHAR),

    DEPARTMENT_ID       NUMBER(8)            NOT NULL,

    JOB_ID              NUMBER(8)            NOT NULL,

    HIRE_DATE           DATE                 NOT NULL,

    EMP_STATUS_ID       NUMBER(8)            NOT NULL,

    ACTIVE_YN           CHAR(1)
                        DEFAULT 'Y'
                        NOT NULL,

    CREATED_BY          VARCHAR2(100 CHAR)
                        DEFAULT USER
                        NOT NULL,

    CREATED_DATE        TIMESTAMP
                        DEFAULT SYSTIMESTAMP
                        NOT NULL,

    UPDATED_BY          VARCHAR2(100 CHAR),

    UPDATED_DATE        TIMESTAMP,


    CONSTRAINT PK_HRM_EMPLOYEES
        PRIMARY KEY (EMPLOYEE_ID),

    CONSTRAINT UK_HRM_EMPLOYEES_NO
        UNIQUE (EMPLOYEE_NO),

    CONSTRAINT UK_HRM_EMPLOYEES_NID
        UNIQUE (NATIONAL_ID),

    CONSTRAINT FK_HRM_EMPLOYEES_GENDER
        FOREIGN KEY (GENDER_ID)
        REFERENCES HRM_LOOKUPS (LOOKUP_ID),

    CONSTRAINT FK_HRM_EMPLOYEES_DEPT
        FOREIGN KEY (DEPARTMENT_ID)
        REFERENCES HRM_DEPARTMENTS (DEPARTMENT_ID),

    CONSTRAINT FK_HRM_EMPLOYEES_JOB
        FOREIGN KEY (JOB_ID)
        REFERENCES HRM_JOBS (JOB_ID),

    CONSTRAINT FK_HRM_EMPLOYEES_STATUS
        FOREIGN KEY (EMP_STATUS_ID)
        REFERENCES HRM_LOOKUPS (LOOKUP_ID),

    CONSTRAINT CHK_HRM_EMPLOYEES_ACTIVE
        CHECK (ACTIVE_YN IN ('Y','N')),

    CONSTRAINT CHK_HRM_EMPLOYEES_DATES
        CHECK
        (
            DATE_OF_BIRTH IS NULL
            OR DATE_OF_BIRTH <= HIRE_DATE
        )
);


COMMENT ON TABLE HRM_EMPLOYEES IS
'Central employee master table for HRM_PRO.';

COMMENT ON COLUMN HRM_EMPLOYEES.EMPLOYEE_ID IS
'Technical primary key for the employee.';

COMMENT ON COLUMN HRM_EMPLOYEES.EMPLOYEE_NO IS
'Business employee number.';

COMMENT ON COLUMN HRM_EMPLOYEES.GENDER_ID IS
'References the GENDER lookup value.';

COMMENT ON COLUMN HRM_EMPLOYEES.DEPARTMENT_ID IS
'References the employee department.';

COMMENT ON COLUMN HRM_EMPLOYEES.JOB_ID IS
'References the employee job.';

COMMENT ON COLUMN HRM_EMPLOYEES.EMP_STATUS_ID IS
'References the EMP_STATUS lookup value.';

COMMENT ON COLUMN HRM_EMPLOYEES.ACTIVE_YN IS
'Y = Active, N = Inactive.';
