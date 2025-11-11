resource "local_file" "curl_image_sanity" {
  for_each = var.prompt
  filename        = "curl-image-sanity-${var.model}-${each.key}.sh"
  file_permission = "0755"

  content = <<-EOT
    #!/bin/bash

    HOST_IP="${var.host_ip}"
    PORT="${var.text2image_port}"

    read -r -d '' PAYLOAD <<EOF
    {
        "prompt": "${each.value}",
        "model": "/mnt/models/${var.text2image_model}",
        "stream": false,
        "max_tokens": ${var.max_tokens}
    }
    EOF

    curl -v -s -X POST "$HOST_IP:$PORT/v1/completions" -H "Content-Type: application/json" -d "$PAYLOAD" && echo

  EOT
}