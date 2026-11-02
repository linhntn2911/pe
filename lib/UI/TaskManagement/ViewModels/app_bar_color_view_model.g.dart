
part of 'app_bar_color_view_model.dart';


@ProviderFor(appPreferencesRepository)
final appPreferencesRepositoryProvider = AppPreferencesRepositoryProvider._();

final class AppPreferencesRepositoryProvider
    extends
        $FunctionalProvider<
          AppPreferencesRepository,
          AppPreferencesRepository,
          AppPreferencesRepository>
    with $Provider<AppPreferencesRepository> {
  AppPreferencesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPreferencesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPreferencesRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppPreferencesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppPreferencesRepository create(Ref ref) {
    return appPreferencesRepository(ref);
  }
  Override overrideWithValue(AppPreferencesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppPreferencesRepository>(value),
    );
  }
}

String _$appPreferencesRepositoryHash() =>
    r'0508db5911de055ff0836e3bf96f146de8d271a9';

@ProviderFor(AppBarColorViewModel)
final appBarColorViewModelProvider = AppBarColorViewModelProvider._();

final class AppBarColorViewModelProvider
    extends $AsyncNotifierProvider<AppBarColorViewModel, AppBarColorOption> {
  AppBarColorViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appBarColorViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appBarColorViewModelHash();

  @$internal
  @override
  AppBarColorViewModel create() => AppBarColorViewModel();
}

String _$appBarColorViewModelHash() =>
    r'cb20d8568223fa1c9c01e9667fd80c5dc0c27c28';

abstract class _$AppBarColorViewModel
    extends $AsyncNotifier<AppBarColorOption> {
  FutureOr<AppBarColorOption> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AppBarColorOption>, AppBarColorOption>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppBarColorOption>, AppBarColorOption>,
              AsyncValue<AppBarColorOption>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
