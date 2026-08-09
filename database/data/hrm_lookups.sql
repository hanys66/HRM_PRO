/*==============================================================================
 Project    : HRM_PRO
 File       : hrm_lookups.sql
 Object     : Seed Data - HRM_LOOKUPS
 Author     : Hany Shaker
 Created    : 2026-08-09
 Version    : 1.0

 Description:
     Initial lookup values required by the HRM_PRO application.

 Notes:
     - Parent lookup types are identified by LOOKUP_TYPE_CODE.
     - LOOKUP_TYPE_ID values are NOT hard-coded.
     - MERGE makes this script safely re-runnable.
     - Codes are unique within each lookup type.

==============================================================================*/


/*==============================================================================
  GENDER
==============================================================================*/

MERGE INTO HRM_LOOKUPS tgt
USING
(
    SELECT
        LOOKUP_TYPE_ID,
        'M' AS LOOKUP_CODE,
        'Male' AS LOOKUP_NAME,
        'Male employee' AS DESCRIPTION,
        10 AS DISPLAY_SEQUENCE
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'GENDER'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'F',
        'Female',
        'Female employee',
        20
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'GENDER'
) src
ON
(
       tgt.LOOKUP_TYPE_ID = src.LOOKUP_TYPE_ID
   AND tgt.LOOKUP_CODE    = src.LOOKUP_CODE
)

WHEN MATCHED THEN
    UPDATE SET
        tgt.LOOKUP_NAME      = src.LOOKUP_NAME,
        tgt.DESCRIPTION      = src.DESCRIPTION,
        tgt.DISPLAY_SEQUENCE = src.DISPLAY_SEQUENCE,
        tgt.ACTIVE_YN        = 'Y'

WHEN NOT MATCHED THEN
    INSERT
    (
        LOOKUP_TYPE_ID,
        LOOKUP_CODE,
        LOOKUP_NAME,
        DESCRIPTION,
        DISPLAY_SEQUENCE,
        ACTIVE_YN
    )
    VALUES
    (
        src.LOOKUP_TYPE_ID,
        src.LOOKUP_CODE,
        src.LOOKUP_NAME,
        src.DESCRIPTION,
        src.DISPLAY_SEQUENCE,
        'Y'
    );


/*==============================================================================
  EMPLOYEE STATUS
==============================================================================*/

MERGE INTO HRM_LOOKUPS tgt
USING
(
    SELECT
        LOOKUP_TYPE_ID,
        'ACTIVE' AS LOOKUP_CODE,
        'Active' AS LOOKUP_NAME,
        'Currently employed' AS DESCRIPTION,
        10 AS DISPLAY_SEQUENCE
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'EMP_STATUS'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'INACTIVE',
        'Inactive',
        'Currently not active',
        20
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'EMP_STATUS'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'TERMINATED',
        'Terminated',
        'Employment has ended',
        30
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'EMP_STATUS'
) src
ON
(
       tgt.LOOKUP_TYPE_ID = src.LOOKUP_TYPE_ID
   AND tgt.LOOKUP_CODE    = src.LOOKUP_CODE
)

WHEN MATCHED THEN
    UPDATE SET
        tgt.LOOKUP_NAME      = src.LOOKUP_NAME,
        tgt.DESCRIPTION      = src.DESCRIPTION,
        tgt.DISPLAY_SEQUENCE = src.DISPLAY_SEQUENCE,
        tgt.ACTIVE_YN        = 'Y'

WHEN NOT MATCHED THEN
    INSERT
    (
        LOOKUP_TYPE_ID,
        LOOKUP_CODE,
        LOOKUP_NAME,
        DESCRIPTION,
        DISPLAY_SEQUENCE,
        ACTIVE_YN
    )
    VALUES
    (
        src.LOOKUP_TYPE_ID,
        src.LOOKUP_CODE,
        src.LOOKUP_NAME,
        src.DESCRIPTION,
        src.DISPLAY_SEQUENCE,
        'Y'
    );


/*==============================================================================
  LEAVE TYPE
==============================================================================*/

MERGE INTO HRM_LOOKUPS tgt
USING
(
    SELECT
        LOOKUP_TYPE_ID,
        'ANNUAL' AS LOOKUP_CODE,
        'Annual Leave' AS LOOKUP_NAME,
        'Annual vacation leave' AS DESCRIPTION,
        10 AS DISPLAY_SEQUENCE
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'LEAVE_TYPE'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'SICK',
        'Sick Leave',
        'Leave due to illness',
        20
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'LEAVE_TYPE'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'CASUAL',
        'Casual Leave',
        'Short personal leave',
        30
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'LEAVE_TYPE'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'UNPAID',
        'Unpaid Leave',
        'Leave without salary',
        40
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'LEAVE_TYPE'
) src
ON
(
       tgt.LOOKUP_TYPE_ID = src.LOOKUP_TYPE_ID
   AND tgt.LOOKUP_CODE    = src.LOOKUP_CODE
)

WHEN MATCHED THEN
    UPDATE SET
        tgt.LOOKUP_NAME      = src.LOOKUP_NAME,
        tgt.DESCRIPTION      = src.DESCRIPTION,
        tgt.DISPLAY_SEQUENCE = src.DISPLAY_SEQUENCE,
        tgt.ACTIVE_YN        = 'Y'

WHEN NOT MATCHED THEN
    INSERT
    (
        LOOKUP_TYPE_ID,
        LOOKUP_CODE,
        LOOKUP_NAME,
        DESCRIPTION,
        DISPLAY_SEQUENCE,
        ACTIVE_YN
    )
    VALUES
    (
        src.LOOKUP_TYPE_ID,
        src.LOOKUP_CODE,
        src.LOOKUP_NAME,
        src.DESCRIPTION,
        src.DISPLAY_SEQUENCE,
        'Y'
    );


/*==============================================================================
  ATTENDANCE STATUS
==============================================================================*/

MERGE INTO HRM_LOOKUPS tgt
USING
(
    SELECT
        LOOKUP_TYPE_ID,
        'PRESENT' AS LOOKUP_CODE,
        'Present' AS LOOKUP_NAME,
        'Employee attended work' AS DESCRIPTION,
        10 AS DISPLAY_SEQUENCE
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'ATT_STATUS'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'ABSENT',
        'Absent',
        'Employee absent from work',
        20
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'ATT_STATUS'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'REMOTE',
        'Remote',
        'Employee working remotely',
        30
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'ATT_STATUS'

    UNION ALL

    SELECT
        LOOKUP_TYPE_ID,
        'VACATION',
        'Vacation',
        'Employee on vacation',
        40
    FROM HRM_LOOKUP_TYPES
    WHERE LOOKUP_TYPE_CODE = 'ATT_STATUS'
) src
ON
(
       tgt.LOOKUP_TYPE_ID = src.LOOKUP_TYPE_ID
   AND tgt.LOOKUP_CODE    = src.LOOKUP_CODE
)

WHEN MATCHED THEN
    UPDATE SET
        tgt.LOOKUP_NAME      = src.LOOKUP_NAME,
        tgt.DESCRIPTION      = src.DESCRIPTION,
        tgt.DISPLAY_SEQUENCE = src.DISPLAY_SEQUENCE,
        tgt.ACTIVE_YN        = 'Y'

WHEN NOT MATCHED THEN
    INSERT
    (
        LOOKUP_TYPE_ID,
        LOOKUP_CODE,
        LOOKUP_NAME,
        DESCRIPTION,
        DISPLAY_SEQUENCE,
        ACTIVE_YN
    )
    VALUES
    (
        src.LOOKUP_TYPE_ID,
        src.LOOKUP_CODE,
        src.LOOKUP_NAME,
        src.DESCRIPTION,
        src.DISPLAY_SEQUENCE,
        'Y'
    );


COMMIT;
