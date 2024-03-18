terraform {
  required_version = ">= 0.13"

  required_providers {
    opensearch = {
      source  = "opensearch-project/opensearch"
      version = ">= 2.2"
    }
  }
}
