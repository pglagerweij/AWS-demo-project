# resource "aws_kinesis_stream" "test_stream" {
#   name             = "pltest-kinesis-stream"
#   shard_count      = 1
#   retention_period = 24

#   shard_level_metrics = [
#     "IncomingBytes",
#     "OutgoingBytes",
#   ]

#   stream_mode_details {
#     stream_mode = "PROVISIONED"
#   }

#   tags = {
#     Environment = "pltest-realtime"
#   }
# }


# resource "aws_s3_bucket" "example" {
#   bucket = "example-flink-application"
# }

# resource "aws_s3_object" "example" {
#   bucket = aws_s3_bucket.example.bucket
#   key    = "example-flink-application"
#   source = "flink-app.jar"
# }

# resource "aws_kinesisanalyticsv2_application" "example" {
#   name                   = "pltest-flink-application"
#   runtime_environment    = "FLINK-1_15"
#   service_execution_role = aws_iam_role.example.arn

#   application_configuration {
#     application_code_configuration {
#       code_content {
#         s3_content_location {
#           bucket_arn = aws_s3_bucket.example.arn
#           file_key   = aws_s3_object.example.key
#         }
#       }

#       code_content_type = "ZIPFILE"
#     }

#     flink_application_configuration {
#       checkpoint_configuration {
#         configuration_type = "DEFAULT"
#       }

#       monitoring_configuration {
#         configuration_type = "CUSTOM"
#         log_level          = "DEBUG"
#         metrics_level      = "TASK"
#       }

#       parallelism_configuration {
#         auto_scaling_enabled = true
#         configuration_type   = "CUSTOM"
#         parallelism          = 10
#         parallelism_per_kpu  = 4
#       }
#     }
#   }

#   input {
#     kinesis_streams_input = aws_kinesis_stream.test_stream.arn
#   }

#   tags = {
#     Environment = "test"
#   }
# }


resource "aws_timestreamwrite_database" "example" {
  database_name = "pltest-timestream-database"
}

resource "aws_timestreamwrite_table" "example" {
  database_name = aws_timestreamwrite_database.example.database_name
  table_name    = "sensors"

  retention_properties {
    magnetic_store_retention_period_in_days = 1
    memory_store_retention_period_in_hours  = 8
  }

  tags = {
    Name = "example-timestream-table"
  }
}