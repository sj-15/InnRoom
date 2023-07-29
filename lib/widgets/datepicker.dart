import 'package:flutter/material.dart';

class BuildDatePicker extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime?) onChanged;

  const BuildDatePicker({
    super.key,
    required this.label,
    this.selectedDate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.arrow_drop_down_sharp),
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        );

        if (pickedDate != null && pickedDate != selectedDate) {
          onChanged(pickedDate);
        }
      },
      subtitle: Text(
        selectedDate != null
            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
            : 'Select date',
      ),
    );
  }
}
