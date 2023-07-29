import 'package:flutter/material.dart';
import '../widgets/datepicker.dart';
import '../widgets/dropdownlist.dart';

class HomeForeground extends StatefulWidget {
  const HomeForeground({super.key});

  @override
  State<HomeForeground> createState() => _HomeForegroundState();
}

class _HomeForegroundState extends State<HomeForeground> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.17, left: 24),
                  child: const Text(
                    "Let's explore \nthe world \ntogether",
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: _buildSearchCard(),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: BuildDropdownList(
                  label: 'Location', items: ['Jaipur', 'Delhi', 'Kolkata']),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: BuildDropdownList(
                  label: 'Person', items: ['1', '2', '3', '4']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuildDatePicker(
                label: 'Check-in',
                selectedDate: _checkInDate,
                onChanged: (DateTime? date) {
                  setState(() {
                    _checkInDate = date;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuildDatePicker(
                label: 'Check-out',
                selectedDate: _checkOutDate,
                onChanged: (DateTime? date) {
                  setState(() {
                    _checkOutDate = date;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
