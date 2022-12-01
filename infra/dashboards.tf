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
        "title": "Total number of carts"
      }
    },

    {
      "type": "metric",
      "x": 1,
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
        "title": "Total value of carts"
      }
    },

    {
      "type": "metric",
      "x": 0,
      "y": 1,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "checkouts.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of carts"
      }
    },

    {
      "type": "metric",
      "x": 1,
      "y": 1,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "knr${var.candidate_id}",
            "no.shoppifly.ShoppingCartController.method.timed.avg"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of carts"
      }
    }
  ]
}
DASHBOARD
}