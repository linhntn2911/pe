import 'package:flutter/material.dart';

import '../../ViewModels/app_bar_color_view_model.dart';

class AppBarColorPicker extends StatelessWidget {
  const AppBarColorPicker({
    super.key,
    required this.selectedOption,
  });

  final AppBarColorOption selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chọn màu thanh ứng dụng'),
      content: SizedBox(
        width: 260,
        height: 120,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: AppBarColorOption.values.length,
          itemBuilder: (context, index) {
            final option = AppBarColorOption.values[index];
            final isSelected = option == selectedOption;
            return Semantics(
              button: true,
              label: option.label,
              selected: isSelected,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(option),
                customBorder: const CircleBorder(),
                child: Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: option.color,
                    border: isSelected
                        ? Border.all(color: Colors.white, width: 3)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Đóng'),
        ),
      ],
    );
  }
}
