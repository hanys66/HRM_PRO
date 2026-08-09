/*==============================================================================
 Project    : HRM_PRO
 File       : seq_hrm_lookups.sql
 Object     : SEQ_HRM_LOOKUPS
 Author     : Hany Shaker
 Created    : 2026-08-09
 Version    : 1.0

 Description:
     Generates primary key values for HRM_LOOKUPS.

 Notes:
     - LOOKUP_ID is a technical surrogate key.
     - Sequence gaps are acceptable.
     - Business codes are maintained separately in LOOKUP_CODE.

==============================================================================*/

CREATE SEQUENCE SEQ_HRM_LOOKUPS
    START WITH 1
    INCREMENT BY 1
    CACHE 20
    NOCYCLE;
