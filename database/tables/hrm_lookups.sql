/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_lookups.sql
 Object     : HRM_LOOKUPS
 Author     : Hany Shaker
 Created    : 2026-08-09
 Version    : 1.0

 Description:
     Stores individual lookup values belonging to HRM_LOOKUP_TYPES.

 Examples:
     GENDER:
         M = Male
         F = Female

     EMP_STATUS:
         ACTIVE     = Active
         INACTIVE   = Inactive
         TERMINATED = Terminated

==============================================================================*/

CREATE TABLE HRM_LOOKUPS
(
    LOOKUP_ID           NUMBER(8)           NOT NULL,

    LOOKUP_TYPE_ID      NUMBER(6)           NOT NULL,

    LOOKUP_CODE         VARCHAR2(30 CHAR)   NOT NULL,

    LOOKUP_NAME         VARCHAR2(100 CHAR)  NOT NULL,

    DESCRIPTION         VARCHAR2(500 CHAR),

    DISPLAY_SEQUENCE    NUMBER(4)
                        DEFAULT 10
                        NOT NULL,

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

    CONSTRAINT PK_HRM_LOOKUPS
        PRIMARY KEY (LOOKUP_ID),

    CONSTRAINT FK_HRM_LOOKUPS_TYPE
        FOREIGN KEY (LOOKUP_TYPE_ID)
        REFERENCES HRM_LOOKUP_TYPES (LOOKUP_TYPE_ID),

    CONSTRAINT UK_HRM_LOOKUPS_TYPE_CODE
        UNIQUE (LOOKUP_TYPE_ID, LOOKUP_CODE),

    CONSTRAINT CHK_HRM_LOOKUPS_ACTIVE
        CHECK (ACTIVE_YN IN ('Y','N'))
);

COMMENT ON TABLE HRM_LOOKUPS IS
'Stores individual lookup values belonging to HRM_LOOKUP_TYPES.';

COMMENT ON COLUMN HRM_LOOKUPS.LOOKUP_ID IS
'Technical primary key for the lookup value.';

COMMENT ON COLUMN HRM_LOOKUPS.LOOKUP_TYPE_ID IS
'Foreign key referencing the lookup category.';

COMMENT ON COLUMN HRM_LOOKUPS.LOOKUP_CODE IS
'Business code of the lookup value.';

COMMENT ON COLUMN HRM_LOOKUPS.LOOKUP_NAME IS
'Display name of the lookup value.';

COMMENT ON COLUMN HRM_LOOKUPS.DISPLAY_SEQUENCE IS
'Controls display order of values within a lookup type.';
