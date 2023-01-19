import boto3
import random
from botocore.config import Config
import time

write_client = boto3.client('timestream-write', config=Config(read_timeout=20, max_pool_connections = 5000, retries={'max_attempts': 10}))

while True:
    time_index = str(int(round(time.time() * 1000)))

    dimensions = [
        {'Name': 'region', 'Value': 'eu-west-1'},
        {'Name': 'az', 'Value': 'az1'},
        {'Name': 'hostname', 'Value': 'host1'}
    ]


    cpu_utilization = {
        'Dimensions': dimensions,
        'MeasureName': 'cpu_utilization',
        'MeasureValue': str(random.randint(0, 10000)/100),
        'MeasureValueType': 'DOUBLE',
        'Time': time_index
    }

    memory_utilization = {
        'Dimensions': dimensions,
        'MeasureName': 'memory_utilization',
        'MeasureValue': str(random.randint(0, 10000)/100),
        'MeasureValueType': 'DOUBLE',
        'Time': time_index
    }

    records = [cpu_utilization, memory_utilization]

    try:
        result = write_client.write_records(
            DatabaseName="pltest-timestream-database",
            TableName="sensors",
            CommonAttributes={},
            Records=records)
        print("WriteRecords Status: [%s]" % result['ResponseMetadata']['HTTPStatusCode'])
    except write_client.exceptions.RejectedRecordsException as err:
           print(err)
    except Exception as err:
        print("Error:", err)
    time.sleep(10)