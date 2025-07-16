resource "aws_cloudwatch_log_group" "api_gateway" {
  name              = "API-Gateway-Execution-Logs_${var.api_name}/${var.stage_name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "api_4xx_errors" {
  alarm_name          = "${var.api_name}-4xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "4XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300
  statistic           = "Sum"
  threshold           = 5
  alarm_description   = "Alarma para errores 4XX en el API Gateway"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ApiName = var.api_name
    Stage   = var.stage_name
  }

  alarm_actions = var.alarm_actions
}

resource "aws_cloudwatch_metric_alarm" "api_5xx_errors" {
  alarm_name          = "${var.api_name}-5xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarma para errores 5XX en el API Gateway"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ApiName = var.api_name
    Stage   = var.stage_name
  }

  alarm_actions = var.alarm_actions
}

resource "aws_cloudwatch_dashboard" "api_dashboard" {
  dashboard_name = "${var.api_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ApiGateway", "4XXError", "ApiName", var.api_name, "Stage", var.stage_name, { "stat": "Sum", "period": 300 }],
            ["AWS/ApiGateway", "5XXError", "ApiName", var.api_name, "Stage", var.stage_name, { "stat": "Sum", "period": 300 }]
          ]
          period = 300
          stat   = "Sum"
          region = var.region_monitoreo
          title  = "Errores API"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ApiGateway", "Count", "ApiName", var.api_name, "Stage", var.stage_name, { "stat": "Sum", "period": 300 }]
          ]
          period = 300
          stat   = "Sum"
          region = var.region_monitoreo
          title  = "Total de peticiones"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ApiGateway", "Latency", "ApiName", var.api_name, "Stage", var.stage_name, { "stat": "Average", "period": 300 }]
          ]
          period = 300
          stat   = "Average"
          region = var.region_monitoreo
          title  = "Latencia promedio (ms)"
        }
      }
    ]
  })
}