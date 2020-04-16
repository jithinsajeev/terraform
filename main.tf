resource "docker_image" "httpd" {
        name = "httpd:latest"
}

resource "docker_container" "httpd" {
        image = docker_image.httpd.latest
        name = "testwebserver"
        ports {
        internal = 80 
        external = 8002
        }
}
