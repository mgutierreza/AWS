resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  name              = "API-Gateway-Execution-Logs_${var.api_name}/${var.stage_name}"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_dashboard" "api_dashboard" {
  dashboard_name = "${var.api_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 24
        height = 6
        properties = {
          metrics = [
            ["AWS/ApiGateway", "Count", "ApiName", var.api_name, "Stage", var.stage_name, { "stat": "Sum", "period": 300 }],
            [".", "4XXError", ".", ".", ".", ".", { "stat": "Sum", "period": 300 }],
            [".", "5XXError", ".", ".", ".", ".", { "stat": "Sum", "period": 300 }],
            [".", "Latency", ".", ".", ".", ".", { "stat": "Average", "period": 300 }]
          ]
          period = 300
          stat   = "Sum"
          region = var.region
          title  = "Métricas de API Gateway"
        }
      }
    ]
  })
}