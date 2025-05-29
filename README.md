
# 🚀 Flutter Template Project

A powerful and clean Flutter starter template built with scalable architecture, theming, localization, dependency injection, and much more — ready for production-level apps.

![Flutter](https://img.shields.io/badge/Flutter-Template-blue?logo=flutter)


---

## 🧱 Project Structure

```
lib
├── main
│   ├── main_common.dart
│   ├── main_development.dart
│   ├── main_production.dart
│   └── my_app.dart
├── core
│   ├── assets
│   │   ├── fonts.dart
│   │   ├── icons.dart
│   │   └── images.dart
│   ├── constants
│   │   ├── api_endpoints.dart
│   │   ├── app_keys.dart
│   │   ├── app_strings.dart
│   │   ├── icons.dart
│   │   ├── padding.dart
│   │   ├── radius.dart
│   │   ├── sized_box.dart
│   │   └── text_styles.dart
│   ├── error
│   │   ├── custom_exceptions.dart
│   │   ├── error_handler.dart
│   │   ├── error_messages.dart
│   │   └── failure.dart
│   ├── locale
│   │   ├── en.dart
│   │   └── er.dart
│   ├── themes
│   │   ├── app_colors.dart
│   │   ├── app_theme.dart
│   │   ├── dark_theme.dart
│   │   └── light_theme.dart
│   └── utils
│       ├── custom_button.dart
│       ├── custom_text_form_field.dart
│       ├── date_formatter.dart
│       ├── logger.dart
│       └── validators.dart
├── config
│   ├── di
│   │   ├── di.config.dart
│   │   └── di.dart
│   ├── env
│   │   ├── .env
│   │   ├── app_config.dart
│   │   ├── env.dart
│   │   └── env.g.dart
│   └── router
│       ├── app_router.dart
│       ├── guards.dart
│       └── routes.dart
├── data
│   ├── caching
│   │   ├── secure_storage_helper.dart
│   │   └── shared_prefs_helper.dart
│   └── network
│       ├── api_services.dart
│       ├── dio_factory.dart
│       ├── interceptors.dart
│       └── network_info.dart
├── features
│   ├── auth
│   │   ├── data
│   │   │   ├── models
│   │   │   │   ├── login_model.dart
│   │   │   │   └── user_model.dart
│   │   │   ├── repos
│   │   │   │   └── auth_repository_impl.dart              #Entity
│   │   │   └── sources
│   │   │       ├── local
│   │   │       │   └── auth_local_datasource.dart
│   │   │       └── remote
│   │   │           └── auth_remote_datasource.dart        #Model
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   ├── login_entity.dart
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories
│   │   │   │   └── auth_repository.dart                   #Entity
│   │   │   └── usecases
│   │   │       ├── login_user.dart                        #Entity
│   │   │       └── sign_up.dart                           #Entity
│   │   └── presentation
│   │       ├── blocs
│   │       │   ├── auth_bloc.dart                         #Events
│   │       │   ├── auth_event.dart                        #Entity
│   │       │   └── auth_state.dart                        #Entity
│   │       ├── pages
│   │       │   ├── login_page.dart
│   │       │   └── register_page.dart
│   │       └── widgets
│   │           └── login_form.dart
│   └── home
│       ├── data
│       │   ├── models
│       │   │   └── home_model.dart
│       │   ├── repositories_impl
│       │   │   └── post_repository_impl.dart
│       │   └── sources
│       │       ├── local
│       │       │   └── home_local_datasource.dart
│       │       └── remote
│       │           └── post_remote_datasource.dart
│       ├── domain
│       │   ├── entities
│       │   │   └── home_entity.dart
│       │   ├── repositories
│       │   │   └── home_repository.dart
│       │   └── usecases
│       │       └── fetch_posts.dart
│       └── presentation
│           ├── blocs
│           │   ├── home_bloc.dart
│           │   ├── home_event.dart
│           │   └── home_state.dart
│           ├── pages
│           │   └── home_page.dart
│           └── widgets
│               └── post_card.dart
└── assets
    ├── fonts
    │   └── font
    ├── icons
    │   └── icon
    ├── images
    │   └── image
    └── translations
        ├── ar
        └── en


```

## 🛠️ Folder Structure Generator (Optional Python Script)



To save time and ensure consistency, you can use this Python script to auto-generate the entire folder structure used in this Flutter template:

<details> <summary>📂 Click to view the script</summary>
  
 ```
import os

root_dir = "lib"

structure = [
    "main/my_app.dart",
    "main/main_production.dart",
    "main/main_development.dart",
    "main/main_common.dart",
    "core/assets/icons.dart",
    "core/assets/images.dart",
    "core/assets/fonts.dart",
    "core/locale/er.dart",
    "core/locale/en.dart",
    "core/constants/app_keys.dart",
    "core/constants/app_strings.dart",
    "core/constants/api_endpoints.dart",
    "core/constants/icons.dart",
    "core/constants/padding.dart",
    "core/constants/radius.dart",
    "core/constants/sized_box.dart",
    "core/constants/text_styles.dart",
    "core/themes/app_theme.dart",
    "core/themes/light_theme.dart",
    "core/themes/dark_theme.dart",
    "core/themes/app_colors.dart",
    "core/utils/validators.dart",
    "core/utils/date_formatter.dart",
    "core/utils/logger.dart",
    "core/utils/custom_button.dart",
    "core/utils/custom_text_form_field.dart",
    "core/error/error_handler.dart",
    "core/error/error_messages.dart",
    "core/error/custom_exceptions.dart",
    "core/error/failure.dart",
    "config/env/env.dart",
    "config/env/.env",
    "config/env/env.g.dart",
    "config/env/app_config.dart",
    "config/di/di.dart",
    "config/di/di.config.dart",
    "config/router/app_router.dart",
    "config/router/routes.dart",
    "config/router/guards.dart",
    "data/network/network_info.dart",
    "data/network/dio_factory.dart",
    "data/network/api_services.dart",
    "data/network/interceptors.dart",
    "data/caching/shared_prefs_helper.dart",
    "data/caching/secure_storage_helper.dart",
    "features/auth/data/sources/remote/auth_remote_datasource.dart",
    "features/auth/data/sources/local/auth_local_datasource.dart",
    "features/auth/data/models/user_model.dart",
    "features/auth/data/models/login_model.dart",
    "features/auth/data/repos/auth_repository_impl.dart",
    "features/auth/domain/entities/user_entity.dart",
    "features/auth/domain/entities/login_entity.dart",
    "features/auth/domain/repositories/auth_repository.dart",
    "features/auth/domain/usecases/login_user.dart",
    "features/auth/domain/usecases/sign_up.dart",
    "features/auth/presentation/blocs/auth_bloc.dart",
    "features/auth/presentation/blocs/auth_event.dart",
    "features/auth/presentation/blocs/auth_state.dart",
    "features/auth/presentation/pages/login_page.dart",
    "features/auth/presentation/pages/register_page.dart",
    "features/auth/presentation/widgets/login_form.dart",
    "features/home/data/sources/remote/post_remote_datasource.dart",
    "features/home/data/sources/local/home_local_datasource.dart",
    "features/home/data/models/home_model.dart",
    "features/home/data/repositories_impl/post_repository_impl.dart",
    "features/home/domain/entities/home_entity.dart",
    "features/home/domain/repositories/home_repository.dart",
    "features/home/domain/usecases/fetch_posts.dart",
    "features/home/presentation/blocs/home_bloc.dart",
    "features/home/presentation/blocs/home_event.dart",
    "features/home/presentation/blocs/home_state.dart",
    "features/home/presentation/pages/home_page.dart",
    "features/home/presentation/widgets/post_card.dart",
    "assets/images/image",
    "assets/fonts/font",
    "assets/icons/icon",
    "assets/translations/ar",
    "assets/translations/en"
]

def create_file(file_path):
    if file_path.endswith('/'):
        return
    full_path = os.path.join(root_dir, file_path)
    dir_name = os.path.dirname(full_path)
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    if not os.path.exists(full_path):
        with open(full_path, 'w', encoding='utf-8') as f:
            pass

def create_structure():
    for path in structure:
        create_file(path)

if __name__ == "__main__":
    create_structure()
    print(f"Folder structure created under '{root_dir}' directory.")
```
</details>



▶️ How to Use

1- Save the script as generate_structure.py.

2- Run it with Python: python generate_structure.py

3- It will create all necessary folders and .dart files under lib/.




## 📦 Dependencies Overview

### ➤ Dependencies

| Package                                                                      | Purpose                                                                                     |
|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `flutter_bloc`                                                               | State management using BLoC pattern                                                         |
| `equatable`                                                                  | Simplifies value comparison in state classes                                                |
| `dartz`                                                                      | Functional programming utilities (e.g., `Either`, `Option`)                                 |
| `get_it`                                                                     | Simple and effective service locator                                                        |
| `injectable`                                                                 | Code generator for `get_it`                                                                 |
| `dio`                                                                        | Robust HTTP client with interceptors, error handling, etc.                                  |
| `pretty_dio_logger`                                                          | Logs Dio requests/responses clearly                                                         |
| `intl`                                                                       | Internationalization and date formatting utilities                                          |
| `shared_preferences`                                                         | Lightweight key-value storage                                                               |
| `flutter_secure_storage`                                                     | Secure storage for sensitive data                                                           |
| `talker`, `talker_flutter`, `talker_dio_logger`, `talker_bloc_logger`        | Powerful logging and debugging solution                                                     |
| `go_router`                                                                  | Declarative and scalable navigation system                                                  |
| `easy_localization`                                                          | Manage translations with JSON files                                                         |
| `envied`                                                                     | Secure environment variable management                                                      |
| `permission_handler`                                                         | Request and handle permissions                                                              |
| `connectivity_plus`                                                          | Monitor internet connection changes                                                         |
| `cupertino_icons`, `font_awesome_flutter`, `flutter_svg`                     | Icon and vector image support                                                               |
| `google_fonts`                                                               | Use Google Fonts easily                                                                     |
| `carousel_slider`                                                            | Create image sliders and banners                                                            |
| `shimmer`                                                                    | Placeholder loading animations                                                              |
| `cached_network_image`                                                       | Optimized image caching and loading                                                         |
| `flex_color_scheme`                                                          | Advanced theming support with Material 3 support                                            |
| `flutter_screenutil`                                                         | Responsive layout adaptation for various screen sizes                                       |
| `device_preview`                                                             | Preview app responsiveness on different devices                                             |



### ➤ Dev Dependencies

| Package                    | Purpose                                              |
|----------------------------|------------------------------------------------------|
| `flutter_test`             | Built-in testing utilities                           |
| `build_runner`             | Code generation runner                               |
| `injectable_generator`     | Generates DI boilerplate                             |
| `envied_generator`         | Generates secure env variable access                 |
| `flutter_lints`            | Linting rules for maintaining code quality           |
| `change_app_package_name`  | Easily rename your app’s bundle ID                   |
| `flutter_launcher_icons`   | Generate launcher icons for Android/iOS              |
| `flutter_flavorizr`        | Setup and manage flavors (e.g., dev/prod)            |



## 🔧 Configuration

### 🏷️ Flavors (via `flutter_flavorizr`)

Supports separate configurations for development and production environments:

```yaml
flavorizr:
  app:
    android:
      flavorDimensions: "app"
#    ios:
#      targets:
#        Runner:
#          bundleId: "com.example.myapp"
  flavors:
    dev:
      app:
        name: "MyApp Dev"
      android:
        applicationId: "com.example.myapp.dev"
#      ios:
#        bundleId: "com.example.myapp.dev"
    prod:
      app:
        name: "MyApp"
      android:
        applicationId: "com.example.myapp"
#      ios:
#        bundleId: "com.example.myapp"
```

### 📁 Assets

```yaml
assets:
  - assets/images/
  - assets/icons/
  - assets/fonts/
  - assets/translations/
```


## 🎯 Features

- 🧩 **Clean Architecture** (Presentation, Domain, Data layers)
- 🗂️ **Modular & Scalable Folder Structure**
- 🛠️ **Dependency Injection** with `get_it` and `injectable`
- 🌐 **API Handling** using `Dio`
- 🌍 **Localization** with `easy_localization`
- 🧪 **Unit & Widget Testing Ready**
- 💾 **Secure and Shared Storage**
- 🎨 **Dynamic Theming** with `flex_color_scheme`
- 📱 **Responsive UI** with `flutter_screenutil`
- 🚀 **Flavor Support** for dev/prod using `flutter_flavorizr`



## 🚀 Getting Started

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate DI and env code
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run the app with dev flavor
flutter run --flavor dev -t lib/main/main_development.dart

# 4. Run the app with prod flavor
flutter run --flavor prod -t lib/main/main_production.dart
```


## 👥 Authors

- **Mohamed Atef** – [GitHub Profile](https://github.com/MohamedAatef12)



## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

