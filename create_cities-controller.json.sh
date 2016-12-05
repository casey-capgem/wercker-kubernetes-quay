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
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "gcr.io/analytical-rain-151012/c-test",
            "name": "cities",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 5000,
                "protocol": "TCP"
              }
            ],
            "command": [ "echo", "SUCCESS" ]
          }
        ]
      }
    }
  }
}
EOF
