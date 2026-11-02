

part of 'task_list_view_model.dart';


@ProviderFor(taskRepository)
final taskRepositoryProvider = TaskRepositoryProvider._();

final class TaskRepositoryProvider
    extends $FunctionalProvider<TaskRepository, TaskRepository, TaskRepository>
    with $Provider<TaskRepository> {
  TaskRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskRepositoryHash();

  @$internal
  @override
  $ProviderElement<TaskRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TaskRepository create(Ref ref) {
    return taskRepository(ref);
  }

  Override overrideWithValue(TaskRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskRepository>(value),
    );
  }
}

String _$taskRepositoryHash() => r'c37d339a0e4aa4f70fce2c08e907a8819818da53';

@ProviderFor(TaskListViewModel)
final taskListViewModelProvider = TaskListViewModelProvider._();

final class TaskListViewModelProvider
    extends $AsyncNotifierProvider<TaskListViewModel, List<TaskItem>> {
  TaskListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListViewModelHash();

  @$internal
  @override
  TaskListViewModel create() => TaskListViewModel();
}

String _$taskListViewModelHash() => r'7e625321b7eb4de565bf18f3cbbabbc2851153f1';

abstract class _$TaskListViewModel extends $AsyncNotifier<List<TaskItem>> {
  FutureOr<List<TaskItem>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<TaskItem>>, List<TaskItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TaskItem>>, List<TaskItem>>,
              AsyncValue<List<TaskItem>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
