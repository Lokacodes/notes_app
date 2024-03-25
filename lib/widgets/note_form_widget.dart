import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  const NoteFormWidget({
    super.key,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.onChangeIsImportant,
    required this.onChangeNumber,
    required this.onChangeDescription,
    required this.onChangeTitle,
  });
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final ValueChanged<bool> onChangeIsImportant;
  final ValueChanged<int> onChangeNumber;
  final ValueChanged<String> onChangeDescription;
  final ValueChanged<String> onChangeTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(value: isImportant, onChanged: onChangeIsImportant),
                Expanded(
                  child: Slider(
                    value: number.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) => onChangeNumber(value.toInt()),
                  ),
                ),
              ],
            ),
            _buildTitleField(),
            const SizedBox(height: 8,),
            _buildDescriptionField(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onChanged: onChangeTitle,
      validator: (title) {
        return title != null && title.isEmpty
            ? 'The title cannot be empty'
            : null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      maxLines: null,
      initialValue: description,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'type something...',
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onChanged: onChangeDescription,
      validator: (description) {
        return description != null && description.isEmpty
            ? 'The description cannot be empty'
            : null;
      },
    );
  }
}
