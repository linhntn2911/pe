import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/task_item.dart';
import '../../../data/reposistories/task_repository.dart';

part 'task_list_view_model.g.dart';

@riverpod
TaskRepository taskRepository(Ref ref) => TaskRepository();

@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  @override
  Future<List<TaskItem>> build() {
    return ref.watch(taskRepositoryProvider).getTasks();
  }

  Future<void> reload() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> updateTask(TaskItem task) async {
    await ref.read(taskRepositoryProvider).updateTask(task);
    ref.invalidateSelf();
    await future;
  }
}
