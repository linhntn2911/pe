class TaskItem {
  const TaskItem({
    required this.id,
    required this.title,
    required this.description,
    required this.iconKey,
    required this.isCompleted,
  });

  final int? id;
  final String title;
  final String description;
  final String iconKey;
  final bool isCompleted;

  factory TaskItem.fromMap(Map<String, Object?> map) {
    return TaskItem(
      id: map['id'] as int?,
      title: map['title']! as String,
      description: map['description']! as String,
      iconKey: map['icon_key']! as String,
      isCompleted: (map['is_completed']! as int) == 1,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'icon_key': iconKey,
      'is_completed': isCompleted ? 1 : 0,
    };
  }

  TaskItem copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskItem(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconKey: iconKey,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
