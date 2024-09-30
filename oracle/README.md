ENACT Enclave data exports 
Temporary manual method 
Currently 5 export files Demographics, Diagnosis, Procedures, Medications, Labs
Assumes concept codes will be prefixed with ENACT ontology terminologies (ICD10CM, ICD9CM, ICD10PCS, 'ICD9PROC, CPT4, HCPCS, RXNORM, NDC, LOINC)
Cohort is defined by an ENACT Shrine query that is rerun in local i2b2 to create patient_set_collection
In each script {crc_chema}, {qt_query_master_id} and SITE_NAME need replaced
Date format is MM/DD/YYYY
Currently data needs exported in comma separated values
