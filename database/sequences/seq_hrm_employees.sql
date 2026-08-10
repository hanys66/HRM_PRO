/*==============================================================================
 Project    : HRM_PRO
 File       : seq_hrm_employees.sql
 Object     : SEQ_HRM_EMPLOYEES
 Author     : Hany Shaker
 Created    : 2026-08-10
 Version    : 1.0

 Description:
     Generates primary key values for HRM_EMPLOYEES.

==============================================================================*/

CREATE SEQUENCE SEQ_HRM_EMPLOYEES
    START WITH 1
    INCREMENT BY 1
    CACHE 20
    NOCYCLE;
