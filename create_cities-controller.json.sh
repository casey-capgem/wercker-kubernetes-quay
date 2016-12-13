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
            "image": "$GCR_REPO_IMAGE",
            "name": "cities",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 5000,
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
