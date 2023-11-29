module "test-repo" {
  source = "../modules/repo"

  repo_name = "test-repo"

  # A GHA would read this platform.yaml from the root of test-repo and pass it to TF as a var
  # (I didn't demonstrate the GHA because all my personal repos are public,
  # so anyone would have been able to fork my repo and run the GHA to create more repos in my personal Github)
  # config = null
  config = <<-EOF
    apps:
    - name: "MyApp"
      dockerfile:
        ports: [80, 443]
        csproj_path: "."
        # Paths of other projects that the app is dependent on
        #dependent_project_paths: []
        build_image: "mcr.microsoft.com/dotnet/sdk:6.0"
        runtime_image: "mcr.microsoft.com/dotnet/aspnet:6.0"
    - name: "MyApp2"
      dockerfile:
        ports: [80, 443]
        csproj_path: "./src/"
        # Paths of other projects that the app is dependent on
        #dependent_project_paths: []
        build_image: "mcr.microsoft.com/dotnet/sdk:6.0"
        runtime_image: "mcr.microsoft.com/dotnet/aspnet:6.0"
    EOF
}
