terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Provider is handled by a different file to not upload credentials to github.

resource "github_repository" "lab-terraform-example" {
  name        = "lab-terraform-example"
  description = "My awesome codebase"
  auto_init   = true

  visibility = "public"
}

resource "github_branch" "feature-1" {
  repository    = "lab-terraform-example"
  source_branch = "main"
  branch        = "feature/1"
  depends_on    = [github_repository.lab-terraform-example]
}

resource "github_branch" "feature-2" {
  repository    = "lab-terraform-example"
  source_branch = "main"
  branch        = "feature/2"
  depends_on    = [github_repository.lab-terraform-example]
}

resource "github_branch" "feature-3" {
  repository    = "lab-terraform-example"
  source_branch = "main"
  branch        = "feature/3"
  depends_on    = [github_repository.lab-terraform-example]
}
