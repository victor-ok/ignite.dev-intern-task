provider "null" {
  alias = "kubectl"
}

resource "null_resource" "apply_manifest" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "kubectl apply -f deployment.yaml"
    environment = {
      KUBECONFIG = file("kubeconfig")
    }
  }
}

# Include your Kubernetes Deployment manifest in the same directory
data "template_file" "deployment" {
  template = file("deployment.yaml")
}

# Save the rendered manifest to a file
resource "local_file" "deployment" {
  content  = data.template_file.deployment.rendered
  filename = "deployment.yaml"
}

