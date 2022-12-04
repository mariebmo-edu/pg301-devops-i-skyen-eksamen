resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.candidate_id
## Jim; seriously! we can use any word here.. How cool is that?
  dashboard_body = <<DASHBOARD
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "carts.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Current number of carts"
      }
    },

    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "carts_value.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Current value of carts"
      }
    },

    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "checkouts.count"
          ]
        ],
        "period": 300,
        "stat": "Sum",
        "region": "eu-west-1",
        "title": "Total number of checkouts"
      }
    },

    {
      "type": "metric",
      "x": 12,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "checkout_time.avg", "exception", "none", "method", "checkout", "class", "no.shoppifly.ShoppingCartController"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-west-1",
        "title": "Average latency of checkouts"
      }
    }
  ]
}
DASHBOARD
}