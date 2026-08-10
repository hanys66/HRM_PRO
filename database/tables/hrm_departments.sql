/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_departments.sql
 Object     : HRM_DEPARTMENTS
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Stores the organizational departments used by HRM_PRO.

==============================================================================*/

CREATE TABLE HRM_DEPARTMENTS
(
    DEPARTMENT_ID       NUMBER(8)           NOT NULL,

    DEPARTMENT_CODE     VARCHAR2(20 CHAR)   NOT NULL,

    DEPARTMENT_NAME     VARCHAR2(100 CHAR)  NOT NULL,

    DEPARTMENT_NAME_AR  VARCHAR2(100 CHAR),

    DESCRIPTION         VARCHAR2(500 CHAR),

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


    CONSTRAINT PK_HRM_DEPARTMENTS
        PRIMARY KEY (DEPARTMENT_ID),

    CONSTRAINT UK_HRM_DEPARTMENTS_CODE
        UNIQUE (DEPARTMENT_CODE),

    CONSTRAINT CHK_HRM_DEPARTMENTS_ACTIVE
        CHECK (ACTIVE_YN IN ('Y','N'))
);


COMMENT ON TABLE HRM_DEPARTMENTS IS
'Stores organizational departments used by HRM_PRO.';

COMMENT ON COLUMN HRM_DEPARTMENTS.DEPARTMENT_ID IS
'Technical primary key for the department.';

COMMENT ON COLUMN HRM_DEPARTMENTS.DEPARTMENT_CODE IS
'Business code identifying the department.';

COMMENT ON COLUMN HRM_DEPARTMENTS.DEPARTMENT_NAME IS
'Department name in English.';

COMMENT ON COLUMN HRM_DEPARTMENTS.DEPARTMENT_NAME_AR IS
'Department name in Arabic.';

COMMENT ON COLUMN HRM_DEPARTMENTS.ACTIVE_YN IS
'Y = Active, N = Inactive.';
