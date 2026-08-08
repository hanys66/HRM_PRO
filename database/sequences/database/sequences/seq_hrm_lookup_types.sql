/*==============================================================================
 Project    : HRM_PRO
 File       : seq_hrm_lookup_types.sql
 Object     : SEQ_HRM_LOOKUP_TYPES
 Author     : Hany Shaker
 Created    : 2026-08-08
 Version    : 1.0

 Description:
     Generates primary key values for HRM_LOOKUP_TYPES.

 Notes:
     - Sequence values are surrogate keys.
     - Gaps in sequence values are acceptable.
     - The sequence is not intended to provide business numbering.

==============================================================================*/

CREATE SEQUENCE SEQ_HRM_LOOKUP_TYPES
    START WITH 1
    INCREMENT BY 1
    CACHE 20
    NOCYCLE;
