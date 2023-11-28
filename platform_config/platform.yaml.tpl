apps:
- name: "MyApp"
  dockerfile:
    ports: [80, 443]
    csproj_path: "."
    # Paths of other projects that the app is dependent on
    #dependent_project_paths: []
    build_image: "mcr.microsoft.com/dotnet/sdk:6.0"
    runtime_image: "mcr.microsoft.com/dotnet/aspnet:6.0"
