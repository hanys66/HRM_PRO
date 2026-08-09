/*==============================================================================
 Project    : HRM_PRO
 File       : idx_hrm_lookups_type.sql
 Object     : IDX_HRM_LOOKUPS_TYPE
 Author     : Hany Shaker
 Created    : 2026-08-09
 Version    : 1.0

 Description:
     Indexes the foreign key column HRM_LOOKUPS.LOOKUP_TYPE_ID.

 Purpose:
     - Improve lookup queries by LOOKUP_TYPE_ID.
     - Support efficient parent/child access.
     - Reduce unnecessary table scanning.
     - Support efficient foreign-key related operations.

==============================================================================*/

CREATE INDEX IDX_HRM_LOOKUPS_TYPE
    ON HRM_LOOKUPS
    (
        LOOKUP_TYPE_ID
    );
