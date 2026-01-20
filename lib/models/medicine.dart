import 'package:hive/hive.dart';

class Medicine {
  final String name;
  final String dose;
  final DateTime time;

  Medicine({
    required this.name,
    required this.dose,
    required this.time,
  });
}

/* 🔹 MANUAL HIVE ADAPTER */
class MedicineAdapter extends TypeAdapter<Medicine> {
  @override
  final int typeId = 0;

  @override
  Medicine read(BinaryReader reader) {
    final name = reader.readString();
    final dose = reader.readString();
    final time = DateTime.parse(reader.readString());

    return Medicine(
      name: name,
      dose: dose,
      time: time,
    );
  }

  @override
  void write(BinaryWriter writer, Medicine obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.dose);
    writer.writeString(obj.time.toIso8601String());
  }
}
