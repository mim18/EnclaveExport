--DEMOGRAPHICS_CSV
--create table pph_dem as select * from (
WITH CTE_COHORT_PATIENT_SET AS (
SELECT * FROM {crcschema}.qt_patient_set_collection ps
  join {crcschema}.qt_query_master qm on qm.
where qm.qt_query_master_id = 
  result_instance_id = 82788
)
SELECT   
TRANSLATE(TO_CHAR(a.PATIENT_NUM), '1234567890', '2546789013') as "PATIENT_NUM"
      ,to_char(a.BIRTH_DATE,'MM/DD/YYYY') as "BIRTH_DATE"
      ,to_char(a.DEATH_DATE,'MM/DD/YYYY') as "DEATH_DATE"
      ,a.SEX_CD as "GENDER"
      , a.AGE_IN_YEARS_NUM as "AGE_IN_YEARS"
      ,a.LANGUAGE_CD as "PRIMARY_SPOKEN_LANGUAGE"
      ,a.RACE_CD as "RACE"
      ,a.MARITAL_STATUS_CD as "MARTIAL_STATUS"
      ,a.RELIGION_CD as "RELIGION"
      ,a.ZIP_CD as "ZIP_CODE"
      ,a.STATECITYZIP_PATH as "STATE_CITY_ZIP"
      ,a.INCOME_CD as "INCOME"
      ,a.VITAL_STATUS_CD as "VITAL_STATUS"
  FROM ncatsprod_crcdata.patient_dimension a, 
  CTE_COHORT_PATIENT_SET c
  where a.patient_num = c.patient_num;
  );
  
