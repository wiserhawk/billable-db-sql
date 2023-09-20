-- PROCEDURE: public.createinvoicejson(integer, timestamp without time zone, integer, character varying, timestamp without time zone)

-- DROP PROCEDURE IF EXISTS public.createinvoicejson(integer, timestamp without time zone, integer, character varying, timestamp without time zone);

CREATE OR REPLACE PROCEDURE public.createinvoicejson(
	IN version integer,
	IN created_date timestamp without time zone,
	IN org_id integer,
	IN status character varying,
	IN last_update timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

INSERT INTO INVOICEJSON (
    version,
    createddate,
    orgid,
    status,
    lastupdate
)
VALUES (
           version,
           created_date,
           org_id,
           status,
           last_update
       );
COMMIT;
END
$BODY$;
ALTER PROCEDURE public.createinvoicejson(integer, timestamp without time zone, integer, character varying, timestamp without time zone)
OWNER TO postgres;
