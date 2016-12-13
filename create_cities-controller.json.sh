#!/bin/bash

cat > cities-controller.json <<EOF
{
  "kind": "ReplicationController",
  "apiVersion": "v1",
  "metadata": {
    "name": "cities",
    "labels": {
      "name": "cities"
    }
  },
  "spec": {
    "replicas": 3,
    "selector": {
      "name": "cities"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "cities",
          "deployment": "latest"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "emilevauge/whoami",
            "name": "cities",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 80,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    }
  }
}
EOF
