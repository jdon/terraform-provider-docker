resource "docker_image" "foo" {
  name = "nginx:latest"
}

resource "docker_container" "foo" {
  name  = "tf-test"
  image = docker_image.foo.image_id

  device_requests {
    driver = "cdi"
    device_ids = ["nvidia.com/gpu=all"]
  }
}