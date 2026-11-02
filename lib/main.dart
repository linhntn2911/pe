import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'UI/TaskManagement/Views/Screen/task_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: TaskManagerApp()));
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý công việc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF37474F)),
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
