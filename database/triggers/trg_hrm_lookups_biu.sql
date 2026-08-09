/*==============================================================================
 Project    : HRM_PRO
 File       : trg_hrm_lookups_biu.sql
 Object     : TRG_HRM_LOOKUPS_BIU
 Author     : Hany Shaker
 Created    : 2026-08-09
 Version    : 1.0

 Description:
     Before Insert/Update trigger for HRM_LOOKUPS.

 Responsibilities:
     - Generate LOOKUP_ID using SEQ_HRM_LOOKUPS.
     - Populate creation audit columns.
     - Populate update audit columns.
     - Preserve original creation information.

==============================================================================*/

CREATE OR REPLACE TRIGGER TRG_HRM_LOOKUPS_BIU
BEFORE INSERT OR UPDATE
ON HRM_LOOKUPS
FOR EACH ROW
BEGIN

    /*==============================================================
      INSERT
    ==============================================================*/

    IF INSERTING THEN

        /* Generate primary key */
        IF :NEW.LOOKUP_ID IS NULL THEN
            :NEW.LOOKUP_ID :=
                SEQ_HRM_LOOKUPS.NEXTVAL;
        END IF;

        /* Creation audit */
        IF :NEW.CREATED_BY IS NULL THEN
            :NEW.CREATED_BY := USER;
        END IF;

        IF :NEW.CREATED_DATE IS NULL THEN
            :NEW.CREATED_DATE := SYSTIMESTAMP;
        END IF;

    END IF;


    /*==============================================================
      UPDATE
    ==============================================================*/

    IF UPDATING THEN

        /* Preserve original creation information */
        :NEW.CREATED_BY   := :OLD.CREATED_BY;
        :NEW.CREATED_DATE := :OLD.CREATED_DATE;

        /* Update audit */
        :NEW.UPDATED_BY   := USER;
        :NEW.UPDATED_DATE := SYSTIMESTAMP;

    END IF;

END;
/
