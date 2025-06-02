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
Write-Host "`n✅ Removing unused flavorizr files..."

if (Test-Path "lib/flavors.dart") { Remove-Item "lib/flavors.dart" -Force }
if (Test-Path "lib/app.dart") { Remove-Item "lib/app.dart" -Force }
if (Test-Path "lib/pages") { Remove-Item "lib/pages" -Recurse -Force }
if (Test-Path "lib/main.dart") { Remove-Item "lib/main.dart" -Force }

# === Step 5: Remove Android Studio default and previous main.dart run configs ===
$projectPath = Get-Location
$runConfigPath = Join-Path $projectPath ".idea\runConfigurations"
New-Item -ItemType Directory -Force -Path $runConfigPath | Out-Null

# Delete any run configurations that contain main.dart
$allConfigs = Get-ChildItem "$runConfigPath" -Filter *.xml -ErrorAction SilentlyContinue
foreach ($config in $allConfigs) {
    $content = Get-Content $config.FullName -Raw
    if ($content -match "main.dart") {
        Remove-Item $config.FullName -Force
    }
}

# Also remove default main.dart config from workspace.xml
$workspaceXmlPath = Join-Path $projectPath ".idea\workspace.xml"
if (Test-Path $workspaceXmlPath) {
    [xml]$workspaceXml = Get-Content $workspaceXmlPath
    $configs = $workspaceXml.SelectNodes("//configuration")
    $removedCount = 0
    foreach ($config in $configs) {
        $filePathAttr = $config.SelectSingleNode("option[@name='filePath']")
        if ($filePathAttr -and $filePathAttr.value -like "*main.dart") {
            $null = $config.ParentNode.RemoveChild($config)
            $removedCount++
        }
    }
    if ($removedCount -gt 0) {
        $workspaceXml.Save($workspaceXmlPath)
        Write-Host "`n✅ Removed $removedCount main.dart config(s) from workspace.xml"
    } else {
        Write-Host "`n✅ No main.dart configs found in workspace.xml"
    }
} else {
    Write-Host "`n⚠️ workspace.xml not found. Skipped cleaning default config."
}

# === Step 6: Create new run configs for dev and prod ===
$devEntryPoint = "lib\main\main_development.dart"
$prodEntryPoint = "lib\main\main_production.dart"

$devArgs = "--flavor dev -t $devEntryPoint"
$prodArgs = "--flavor prod -t $prodEntryPoint"

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

$devConfig | Out-File -Encoding UTF8 -FilePath (Join-Path $runConfigPath "dev.xml")
$prodConfig | Out-File -Encoding UTF8 -FilePath (Join-Path $runConfigPath "prod.xml")

# === Done ===
Write-Host "`n✅ Flutter run/debug configurations created for:"
Write-Host "   - dev → $devEntryPoint"
Write-Host "   - prod → $prodEntryPoint"
Write-Host "`n✅ Cleanup completed."
Write-Host "`n✅ Project setup completed successfully!"
Write-Host "`n✅ You are ready to start developing your Flutter app!"
Write-Host "`nℹ️ Create your main functions in:"
Write-Host "   - lib/main/main_development.dart"
Write-Host "   - lib/main/main_production.dart"
Write-Host "`nℹ️ You may need to restart Android Studio to apply changes."
