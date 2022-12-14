# AWS-demo-project
Demo Project for a sample data analytics solution showing various integrations.

## Project description
This will be a demo repo containing a a repo containing a sample project with a data Analytics solution. Data Analytics solution from various sources. 
Sources:
- API (mimic streaming data)
- Flatfiles (xml/json/csv)

ETL:
- Serverless functions: Lambda => to query API and save towards AWS (Dynamo or S3)
- Spark using Glue

End product:
- Query from S3 with Athena (presto) + Visuals in Quicksight
- ML pipeline + with model as endpoint (API)
- Data as a service API

Project description - build out:
- 01: Infrastructure as code (IAC) project bootstrap with Terraform
- 02: Setup a Terraform CI/CD pipeline with Github action (GHA) using OPENID connect for auth from GHA
- 03: Intro to Standardized Formatting -> Pre-commit and standard styling/formatting for Terraform integrated in GHA pipeline
- 04: Codeartifact setup and why you would want it => a pipeline packaging you code to your private (PIP) Artifact (CB or GHA)
- 05: Python formatting with Black/Flake (PEP) (Pre-commit) and unit test (pytest) (integrated with 04 pipeline).  
- 06: Pattern for variable load using a queue - Lambda to write to SQS, Lambda to pull async from SQS save to DynamoDB (3 tier web architecture with seperate scaling example)
- 07: Streaming (Spark streaming or Kafka - TBD) or Kinesis?
- 08: Data Cataloque and crawler (S3/dynamo and RDS), Flatfile CSV towards Postgres database (DMS => RDS) (or graph with Neptune?) 
- 09: Setup 3 Spark processing Job with Glue that pre-processes data of Dynamo, S3 + RDS/Neptune => save towards S3- Perhaps also a Lambda to orchestrate various things in next step.
- 10a: Orchestration of these 3 jobs with Airflow => Deploy airflow with managaged airflow (AWS) setup pipeline and GHA towards it
- 10b: Same as a but with Step Functions?
- 11: Data testing (greater expectations) - visual and included in pipeline or?
- 12: Towards redshift/snowflake? add to orchestration

Extension A (ML application)
- 01: Feature store setup and pre-procesisng job (spark?)
- 02: Model training pipeline (sagemaker pipeline) saving in model registry etc. (MLFLOW or standard sagemaker?)
- 03: Model hosting on endpoint or something else?

Extension B (Dashboard)
- 01: Query data with Athena from S3 and load into Quicksight
- 02: Data into Amazon Opensearch (elastic stack)

Extension C (Data as a Service):
- 01: Make data avaialble through an API (API GATEWAY with some backend (lambda or..?))