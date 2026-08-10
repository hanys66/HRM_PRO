/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_jobs.sql
 Object     : HRM_JOBS
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Stores job definitions used by the HRM_PRO application.

==============================================================================*/

CREATE TABLE HRM_JOBS
(
    JOB_ID              NUMBER(8)           NOT NULL,

    JOB_CODE            VARCHAR2(20 CHAR)   NOT NULL,

    JOB_TITLE           VARCHAR2(100 CHAR)  NOT NULL,

    JOB_TITLE_AR        VARCHAR2(100 CHAR),

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


    CONSTRAINT PK_HRM_JOBS
        PRIMARY KEY (JOB_ID),

    CONSTRAINT UK_HRM_JOBS_CODE
        UNIQUE (JOB_CODE),

    CONSTRAINT CHK_HRM_JOBS_ACTIVE
        CHECK (ACTIVE_YN IN ('Y','N'))
);


COMMENT ON TABLE HRM_JOBS IS
'Stores job definitions used by HRM_PRO.';

COMMENT ON COLUMN HRM_JOBS.JOB_ID IS
'Technical primary key for the job.';

COMMENT ON COLUMN HRM_JOBS.JOB_CODE IS
'Business code identifying the job.';

COMMENT ON COLUMN HRM_JOBS.JOB_TITLE IS
'Job title in English.';

COMMENT ON COLUMN HRM_JOBS.JOB_TITLE_AR IS
'Job title in Arabic.';

COMMENT ON COLUMN HRM_JOBS.ACTIVE_YN IS
'Y = Active, N = Inactive.';
