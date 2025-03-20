import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController namaController = TextEditingController();
  final key = GlobalKey<FormState>();
  List<Map<String, dynamic>> daftarNama = [];
  String? selectedDate;

  Future<void> pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          selectedDate = DateFormat('dd-MM-yyyy HH:mm').format(finalDateTime);
        });
      }
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Form Page',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Task Date:', style: TextStyle(fontSize: 16)),
                      Text(selectedDate ?? 'Select a Date',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
              
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
