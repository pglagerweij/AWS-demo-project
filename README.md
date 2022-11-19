# AWS-demo-project
Demo Project for a sample data analytics solution showing various integrations.

## Project description
This will be a demo repo containing a a repo containing a sample project with a data Analytics solution. Data Analytics solution from various sources. 
Sources:
- API (mimic streaming data)
- Flatfiles (xml/json/csv)

ETL:
- Serverless functions: Lambda => to query API and save towards AWS (Dynamo or S3)

Project description - build out:
- 01: Infrastructure as code (IAC) project bootstrap with Terraform
- 02: Setup a Terraform CI/CD pipeline with Github action (GHA) using OPENID connect for auth from GHA
- 03: Intro to Standardized Formatting -> Pre-commit and standard styling/formatting for Terraform integrated in GHA pipeline
- 04: Codeartifact setup and why you would want it => a pipeline packaging you code to your private (PIP) Artifact (CB or GHA)
- 05: Python formatting with Black/Flake (PEP) (Pre-commit) and unit test (pytest) (integrated with 04 pipeline).  
- 06: Pattern for variable load using a queue - Lambda to write to SQS, Lambda to pull async from SQS save to DynamoDB (3 tier web architecture with seperate scaling example)
- 07: Data Cataloque and crawler (S3/dynamo and RDS), Flatfile CSV towards Postgres database (DMS => RDS) (or graph with Neptune?) 
- 08: Setup 3 Spark processing Job with Glue that pre-processes data of Dynamo, S3 + RDS/Neptune => save towards S3- Perhaps also a Lambda to orchestrate various things in next step.
- 09a: Orchestration of these 3 jobs with Airflow => Deploy airflow with managaged airflow (AWS) setup pipeline and GHA towards it
- 09b: Same as a but with Step Functions?
Extension (ML application)
- 11: Feature store setup and pre-procesisng job (spark?)
- 12: Model training pipeline saving in model registry etc. (MLFLOW or standard sagemaker?)
- 13: Model hosting on endpoint or something else?