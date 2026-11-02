import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/reposistories/app_preferences_repository.dart';

part 'app_bar_color_view_model.g.dart';

enum AppBarColorOption {
  blue('blue', 'Xanh dương', Color(0xFF1976D2)),
  green('green', 'Xanh lá', Color(0xFF388E3C)),
  purple('purple', 'Tím', Color(0xFF7B1FA2)),
  teal('teal', 'Xanh ngọc', Color(0xFF00796B)),
  orange('orange', 'Cam', Color(0xFFF57C00)),
  red('red', 'Đỏ', Color(0xFFD32F2F)),
  pink('pink', 'Hồng', Color(0xFFC2185B)),
  indigo('indigo', 'Chàm', Color(0xFF303F9F));

  const AppBarColorOption(this.storageValue, this.label, this.color);

  final String storageValue;
  final String label;
  final Color color;

  static AppBarColorOption fromStorageValue(String? value) {
    return AppBarColorOption.values.firstWhere(
      (option) => option.storageValue == value,
      orElse: () => AppBarColorOption.blue,
    );
  }
}

@riverpod
AppPreferencesRepository appPreferencesRepository(Ref ref) {
  return AppPreferencesRepository();
}

@riverpod
class AppBarColorViewModel extends _$AppBarColorViewModel {
  @override
  Future<AppBarColorOption> build() async {
    final colorCode = await ref
        .watch(appPreferencesRepositoryProvider)
        .getAppBarColorCode();
    return AppBarColorOption.fromStorageValue(colorCode);
  }

  Future<void> selectColor(AppBarColorOption option) async {
    final previousState = state;
    state = AsyncData(option);

    try {
      await ref
          .read(appPreferencesRepositoryProvider)
          .saveAppBarColorCode(option.storageValue);
    } catch (error, stackTrace) {
      state = previousState;
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
