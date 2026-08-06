/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_lookup_types.sql
 Object     : HRM_LOOKUP_TYPES
 Author     : Hany Shaker
 Created    : 2026-08-06
 Version    : 1.0

 Description:
     Stores the master list of lookup categories used throughout HRM_PRO.

 Example:
     GENDER
     EMP_STATUS
     LEAVE_TYPE
     ATT_STATUS

==============================================================================*/

CREATE TABLE HRM_LOOKUP_TYPES
(
    LOOKUP_TYPE_ID      NUMBER(6)           NOT NULL,

    LOOKUP_TYPE_CODE    VARCHAR2(30 CHAR)   NOT NULL,

    LOOKUP_TYPE_NAME    VARCHAR2(100 CHAR)  NOT NULL,

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

    CONSTRAINT PK_HRM_LOOKUP_TYPES
        PRIMARY KEY (LOOKUP_TYPE_ID),

    CONSTRAINT UK_HRM_LOOKUP_TYPES_CODE
        UNIQUE (LOOKUP_TYPE_CODE),

    CONSTRAINT CHK_HRM_LOOKUP_TYPES_ACTIVE
        CHECK (ACTIVE_YN IN ('Y','N'))
);

COMMENT ON TABLE HRM_LOOKUP_TYPES IS
'Defines lookup categories used by the HRM application.';

COMMENT ON COLUMN HRM_LOOKUP_TYPES.LOOKUP_TYPE_CODE IS
'Unique code such as GENDER or EMP_STATUS.';

COMMENT ON COLUMN HRM_LOOKUP_TYPES.LOOKUP_TYPE_NAME IS
'Display name shown to administrators.';

COMMENT ON COLUMN HRM_LOOKUP_TYPES.DISPLAY_SEQUENCE IS
'Controls display order in maintenance screens.';
