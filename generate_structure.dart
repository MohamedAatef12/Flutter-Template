import 'dart:io';

void main() {
  final structure = {
    'lib/main': [
      'main_common.dart',
      'main_development.dart',
      'main_production.dart',
      'my_app.dart',
    ],
    'lib/core/assets': ['fonts.dart', 'icons.dart', 'images.dart'],
    'lib/core/constants': [
      'api_endpoints.dart',
      'app_keys.dart',
      'app_strings.dart',
      'icons.dart',
      'padding.dart',
      'radius.dart',
      'sized_box.dart',
      'text_styles.dart',
    ],
    'lib/core/error': [
      'custom_exceptions.dart',
      'error_handler.dart',
      'error_messages.dart',
      'failure.dart',
    ],
    'lib/core/locale': ['en.dart', 'er.dart'],
    'lib/core/themes': [
      'app_colors.dart',
      'app_theme.dart',
      'dark_theme.dart',
      'light_theme.dart',
    ],
    'lib/core/utils': [
      'custom_button.dart',
      'custom_text_form_field.dart',
      'date_formatter.dart',
      'logger.dart',
      'validators.dart',
    ],
    'lib/config/di': ['di.config.dart', 'di.dart'],
    'lib/config/env': ['.env', 'app_config.dart', 'env.dart', 'env.g.dart'],
    'lib/config/router': ['app_router.dart', 'guards.dart', 'routes.dart'],
    'lib/data/caching': [
      'secure_storage_helper.dart',
      'shared_prefs_helper.dart',
    ],
    'lib/data/network': [
      'api_services.dart',
      'dio_factory.dart',
      'interceptors.dart',
      'network_info.dart',
    ],
    'lib/features/auth/data/models': ['login_model.dart', 'user_model.dart'],
    'lib/features/auth/data/repos': ['auth_repository_impl.dart'],
    'lib/features/auth/data/sources/local': ['auth_local_datasource.dart'],
    'lib/features/auth/data/sources/remote': ['auth_remote_datasource.dart'],
    'lib/features/auth/domain/entities': [
      'login_entity.dart',
      'user_entity.dart',
    ],
    'lib/features/auth/domain/repositories': ['auth_repository.dart'],
    'lib/features/auth/domain/usecases': ['login_user.dart', 'sign_up.dart'],
    'lib/features/auth/presentation/blocs': [
      'auth_bloc.dart',
      'auth_event.dart',
      'auth_state.dart',
    ],
    'lib/features/auth/presentation/pages': [
      'login_page.dart',
      'register_page.dart',
    ],
    'lib/features/auth/presentation/widgets': ['login_form.dart'],
    'lib/features/home/data/models': ['home_model.dart'],
    'lib/features/home/data/repositories_impl': ['post_repository_impl.dart'],
    'lib/features/home/data/sources/local': ['home_local_datasource.dart'],
    'lib/features/home/data/sources/remote': ['post_remote_datasource.dart'],
    'lib/features/home/domain/entities': ['home_entity.dart'],
    'lib/features/home/domain/repositories': ['home_repository.dart'],
    'lib/features/home/domain/usecases': ['fetch_posts.dart'],
    'lib/features/home/presentation/blocs': [
      'home_bloc.dart',
      'home_event.dart',
      'home_state.dart',
    ],
    'lib/features/home/presentation/pages': ['home_page.dart'],
    'lib/features/home/presentation/widgets': ['post_card.dart'],
    'assets/fonts': ['font/'],
    'assets/icons': ['icon/'],
    'assets/images': ['image/'],
    'assets/translations': ['ar/', 'en/'],
  };

  structure.forEach((path, files) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Created directory: $path');
    }

    for (var file in files) {
      final f = File('$path/$file');
      if (!f.existsSync()) {
        f.createSync();
        print('Created file: $path/$file');
      }
    }
  });
}
