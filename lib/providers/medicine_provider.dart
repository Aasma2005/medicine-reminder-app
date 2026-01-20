import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/medicine.dart';
import '../services/notification_service.dart';

class MedicineProvider extends ChangeNotifier {
  final Box<Medicine> _box = Hive.box<Medicine>('medicines');

  List<Medicine> get medicines {
    final list = _box.values.toList();
    list.sort((a, b) => a.time.compareTo(b.time));
    return list;
  }

  void addMedicine(Medicine medicine) {
    _box.add(medicine);
    NotificationService.scheduleNotification(medicine);
    notifyListeners();
  }
}
