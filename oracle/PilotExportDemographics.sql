--DEMOGRAPHICS_CSV
WITH CTE_COHORT_PATIENT_SET AS (
FROM {crc_schema}.qt_query_instance q
  join {crc_schema}.qt_query_result_instance r on r.query_instance_id = q.query_instance_id 
  join {crc_schema}.qt_patient_set_collection ps on ps.result_instance_id = r.result_instance_id and result_type_id = 1
  where  q.query_master_id = {query_master_id}
)
SELECT   
      a.PATIENT_NUM as "PATIENT_NUM"
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
      ,a.VITAL_STATUS_CD as "VITAL_STATUS",
      'SITE NAME' as "SITE"
  FROM {crc_schema}.patient_dimension a, 
  CTE_COHORT_PATIENT_SET c 
  where a.patient_num = c.patient_num;
  
  
