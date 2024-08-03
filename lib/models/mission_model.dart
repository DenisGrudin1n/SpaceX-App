import 'package:intl/intl.dart';

class Mission {
  final String date;
  final String time;
  final String name;
  final String location;
  final String rocketId;

  Mission({
    required this.date,
    required this.time,
    required this.name,
    required this.location,
    required this.rocketId,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    final launchDateTime = json['launch_date_local'] != null
        ? DateTime.tryParse(json['launch_date_local']) ?? DateTime.now()
        : DateTime.now();
    final formattedDate = DateFormat('MM/dd/yyyy').format(launchDateTime);
    final formattedTime = DateFormat('hh:mm a').format(launchDateTime);

    final rocketId = json['rocket']?['rocket_id']?.toString() ?? '';

    return Mission(
      date: formattedDate,
      time: formattedTime,
      name: json['mission_name'] ?? 'Unknown Mission',
      location: json['launch_site']?['site_name_long'] ?? 'Unknown Location',
      rocketId: rocketId,
    );
  }
}
