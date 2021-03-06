provider "google-beta" {
  region = "us-central1"
  zone   = "us-central1-a"
}

data "google_compute_node_types" "central1a" {
  provider = google-beta
  zone     = "us-central1-a"
}

resource "google_compute_node_template" "template" {
  provider = google-beta

  name      = "soletenant-with-licenses-${local.name_suffix}"
  region    = "us-central1"
  node_type = "n1-node-96-624"

  node_affinity_labels = {
    foo = "baz"
  }

  server_binding {
    type = "RESTART_NODE_ON_MINIMAL_SERVERS"
  }
}
