import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ViewModels/app_bar_color_view_model.dart';
import '../../ViewModels/task_list_view_model.dart';
import 'edit_task_screen.dart';
import '../Widget/app_bar_color_picker.dart';
import '../Widget/task_list_item.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListViewModelProvider);
    final appBarColor = ref.watch(appBarColorViewModelProvider);
    final selectedColor = appBarColor.when(
      data: (color) => color,
      loading: () => AppBarColorOption.blue,
      error: (_, _) => AppBarColorOption.blue,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedColor.color,
        foregroundColor: Colors.white,
        title: const Text('Quản lý công việc'),
        actions: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () => _showColorPicker(context, ref, selectedColor),
            icon: const Icon(Icons.palette_outlined),
            tooltip: 'Chọn màu thanh ứng dụng',
          ),
        ],
      ),
      body: tasks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Không thể tải danh sách công việc.'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () =>
                    ref.read(taskListViewModelProvider.notifier).reload(),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (items) => items.isEmpty
            ? const Center(child: Text('Chưa có công việc nào.'))
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 96),
                itemCount: items.length,
                itemBuilder: (context, index) => TaskListItem(
                  task: items[index],
                  onEdit: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => EditTaskScreen(task: items[index]),
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        shape: CircleBorder(),
        backgroundColor: Color(0xFF37474F),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showColorPicker(
    BuildContext context,
    WidgetRef ref,
    AppBarColorOption selectedColor,
  ) async {
    final chosenColor = await showDialog<AppBarColorOption>(
      context: context,
      builder: (dialogContext) {
        return AppBarColorPicker(
          selectedOption: selectedColor,
        );
      },
    );

    if (chosenColor == null || !context.mounted) return;

    try {
      await ref
          .read(appBarColorViewModelProvider.notifier)
          .selectColor(chosenColor);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể lưu màu đã chọn. Vui lòng thử lại.'),
        ),
      );
    }
  }
}
