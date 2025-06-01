# === Step 1: Generate project structure ===
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MohamedAatef12/Flutter-Template/refs/heads/master/generate_structure.dart" -OutFile "generate_structure.dart"
dart run generate_structure.dart
Remove-Item generate_structure.dart

# === Step 2: Preserve pubspec top and replace the rest ===
$lines = Get-Content pubspec.yaml
$head = $lines[0..($lines.IndexOf("environment:") + 2)]
$head | Set-Content pubspec.yaml

@"
dependencies:
  flutter:
    sdk: flutter

  # UI & Design
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  font_awesome_flutter: ^10.8.0
  carousel_slider: ^5.0.0
  shimmer: ^3.0.0
  flex_color_scheme: ^8.2.0
  flutter_svg: ^2.1.0
  cached_network_image: ^3.4.1
  flutter_screenutil: ^5.9.3
  device_preview: ^1.2.0

  # State Management & Architecture
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  dartz: ^0.10.1
  get_it: ^8.0.3
  injectable: ^2.5.0

  # Networking
  dio: ^5.8.0+1
  pretty_dio_logger: ^1.4.0
  intl: ^0.19.0

  # Caching & Storage
  shared_preferences: ^2.5.3
  flutter_secure_storage: ^9.2.4

  # Logging & Debugging
  talker: ^4.8.0
  talker_flutter: ^4.8.0
  talker_dio_logger: ^4.8.0
  talker_bloc_logger: ^4.8.0

  # Routing & Navigation
  go_router: ^15.1.2

  # Localization & Translations
  easy_localization: ^3.0.7+1

  # Configuration & Environment
  envied: ^1.1.1

  # Permissions & Connectivity
  permission_handler: ^12.0.0+1
  connectivity_plus: ^6.1.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.15
  injectable_generator: ^2.7.0
  envied_generator: ^1.1.1
  flutter_lints: ^5.0.0
  change_app_package_name: ^1.5.0
  flutter_launcher_icons: ^0.14.3
  flutter_flavorizr: ^2.4.1

flavorizr:
  app:
    android:
      flavorDimensions: "app"
  flavors:
    dev:
      app:
        name: "MyApp Dev"
      android:
        applicationId: "com.example.myapp.dev"
    prod:
      app:
        name: "MyApp"
      android:
        applicationId: "com.example.myapp"

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
    - assets/fonts/
    - assets/translations/
"@ | Add-Content pubspec.yaml

# === Step 3: Install dependencies and generate files ===
flutter pub get
flutter pub run flutter_flavorizr

# === Step 4: Cleanup generated flavorizr files/folders ===

# Remove the "flavorizr" folder
Write-Host "Removing unused flavorizr files..."

# Remove the "lib/flavors.dart" file
if (Test-Path "lib/flavors.dart") {
    Remove-Item "lib/flavors.dart" -Force
}

# Remove the "lib/app.dart" file
if (Test-Path "lib/app.dart") {
    Remove-Item "lib/app.dart" -Force
}

# Remove the "pages" folder
if (Test-Path "lib/pages") {
    Remove-Item "lib/pages" -Recurse -Force
}

# Remove lib/main.dart
if (Test-Path "lib/main.dart") {
    Remove-Item "lib/main.dart" -Force
}

Write-Host "Cleanup completed."
Write-Host "Project setup completed successfully!"

# === Step 5: Run the app ===
# Get current directory (assumes script is run from root of Flutter project)
$projectPath = Get-Location
$runConfigPath = Join-Path $projectPath ".idea\runConfigurations"

# Ensure the .idea/runConfigurations directory exists
New-Item -ItemType Directory -Force -Path $runConfigPath | Out-Null

# Paths to entry point files
$devEntryPoint = "lib\main\main_development.dart"
$prodEntryPoint = "lib\main\main_production.dart"

# Flutter run args
$devArgs = "--flavor dev -t $devEntryPoint"
$prodArgs = "--flavor prod -t $prodEntryPoint"

# XML content for dev
$devConfig = @"
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="dev" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$($projectPath)\$devEntryPoint" />
    <option name="buildFlavor" value="dev" />
    <option name="additionalArgs" value="$devArgs" />
    <method v="2" />
  </configuration>
</component>
"@

# XML content for prod
$prodConfig = @"
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="prod" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$($projectPath)\$prodEntryPoint" />
    <option name="buildFlavor" value="prod" />
    <option name="additionalArgs" value="$prodArgs" />
    <method v="2" />
  </configuration>
</component>
"@

# Write config files
$devConfig | Out-File -Encoding UTF8 -FilePath (Join-Path $runConfigPath "dev.xml")
$prodConfig | Out-File -Encoding UTF8 -FilePath (Join-Path $runConfigPath "prod.xml")

Write-Host "`n✅ Flutter run/debug configurations created for:"
Write-Host "   - dev → $devEntryPoint"
Write-Host "   - prod → $prodEntryPoint"
Write-Host "`n📁 Location: $runConfigPath"
Write-Host "`nℹ️ Please restart Android Studio or run 'File → Synchronize' to apply changes."


