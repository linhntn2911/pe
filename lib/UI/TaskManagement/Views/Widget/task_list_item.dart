import 'package:flutter/material.dart';

import '../../../../data/models/task_item.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.task, required this.onEdit});

  final TaskItem task;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        leading: Icon(_iconFor(task.iconKey), color: const Color(0xFF455A64)),
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 14),
              const SizedBox(width: 6),
              Expanded(child: Text(task.description)),
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: onEdit,
          icon: const Icon(Icons.edit_outlined),
          tooltip: 'Chỉnh sửa công việc',
        ),
      ),
    );
  }

  IconData _iconFor(String iconKey) {
    switch (iconKey) {
      case 'menu_book':
        return Icons.menu_book_outlined;
      case 'desktop_windows':
        return Icons.desktop_windows_outlined;
      case 'article':
        return Icons.article_outlined;
      default:
        return Icons.laptop_mac_outlined;
    }
  }
}
