terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Define content for the file
locals {
  app_code = <<-EOT
    console.log("Hello from Terraform-generated app!");
  EOT
}

# Create the file in a nested directory
resource "local_file" "webapp_app" {
  filename = "${path.module}/webapp/src/index.js"
  content  = local.app_code
}

# Output the path to the created file
output "webapp_file_path" {
  value       = local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
