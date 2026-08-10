/*==============================================================================
 Project    : HRM_PRO
 File       : seq_hrm_departments.sql
 Object     : SEQ_HRM_DEPARTMENTS
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Generates primary key values for HRM_DEPARTMENTS.

==============================================================================*/

CREATE SEQUENCE SEQ_HRM_DEPARTMENTS
    START WITH 1
    INCREMENT BY 1
    CACHE 20
    NOCYCLE;
