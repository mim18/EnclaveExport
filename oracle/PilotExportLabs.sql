--LABS
WITH CTE_COHORT_PATIENT_SET AS (
SELECT distinct patient_num
  FROM {crc_schema}.qt_query_instance q
  join  {crc_schema}.qt_query_result_instance r on r.query_instance_id = q.query_instance_id 
  join  {crc_schema}.qt_patient_set_collection ps on ps.result_instance_id = r.result_instance_id and result_type_id = 1
  where  q.query_master_id = {query_master_id}
),
CTE_CODES AS (
    SELECT DISTINCT CONCEPT_CD, NAME_CHAR FROM {crc_schema}.concept_dimension 
    WHERE concept_path like '\ACT\Lab\LOINC\%' 
)
SELECT 
        a.PATIENT_NUM as "PATIENT_NUM"
        ,a.start_date as "START_DATE"
        ,a.end_date as "END_DATE"
        --,b.name_char as "NAME_CHAR" --removed creates huge export files
        ,A.concept_cd as "CONCEPT_CD"
        ,a.units_cd as "UNITS_CD"   
        ,DECODE(a.VALTYPE_CD,'N', a.TVAL_CHAR, NULL) AS "OPERATOR"
        ,a.NVAL_NUM as "NUMERIC_VALUE"
        ,DECODE(a.VALTYPE_CD,'N', NULL,A.TVAL_CHAR) AS "STRING_VALUE"
--        ,a.TVAL_CHAR AS "STRING_VALUE"
        ,a.VALUEFLAG_CD AS "VALUEFLAG_CD"
        ,a.instance_num as "INSTANCE_NUM"   
        ,a.modifier_cd as "MODIFIER_CD"
        --,m.name_char as "MODIFIER_NAME" -- not harmonized across i2b2s and not included in ENACT
        ,a.location_cd as "LOCATION_CD" 
        --,case v.inout_cd  when 'O' then 'Outpatient' when 'I' then 'Inpatient' when 'E' then 'Emergency' else 'Unknown' end as "ENCOUNTER_TYPE"
        ,a.provider_id as "PROVIDER_ID"
        ,to_char(a.encounter_num) as "ENCOUNTER_NUM"
        ,'SITE_NAME' as "SITE"
    FROM {crc_schema}.observation_fact  a 
    JOIN CTE_COHORT_PATIENT_SET c on a.patient_num = c.patient_num
    --WHERE CONCEPT_CD LIKE 'LOINC:%';
    INNER  JOIN CTE_CODES b on a.concept_cd = b.concept_cd;
