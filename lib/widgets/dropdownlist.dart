import 'package:flutter/material.dart';

class BuildDropdownList extends StatefulWidget {
  const BuildDropdownList(
      {super.key, required this.label, required this.items});
  final String label;
  final List<String> items;

  @override
  State<BuildDropdownList> createState() => _BuildDropdownListState();
}

class _BuildDropdownListState extends State<BuildDropdownList> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue; // Store the selected value here
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.label, // Set the label text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      value: selectedValue, // Set the selected value
      onChanged: (value) {
        // Update the selected value when an item is chosen
        setState(() {
          selectedValue = value;
        });
      },
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
