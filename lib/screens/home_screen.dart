import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/medicine_provider.dart';
import 'add_medicine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MedicineProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Reminder')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMedicineScreen()),
          );
        },
      ),
      body: provider.medicines.isEmpty
          ? const Center(child: Text('No medicines added'))
          : ListView.builder(
              itemCount: provider.medicines.length,
              itemBuilder: (_, i) {
                final med = provider.medicines[i];
                return ListTile(
                  title: Text(med.name),
                  subtitle: Text(
                    '${med.dose} • ${DateFormat.jm().format(med.time)}',
                  ),
                );
              },
            ),
    );
  }
}
