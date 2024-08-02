import 'package:get/get.dart';
import 'package:spacex_app/models/mission_model.dart';
import 'package:spacex_app/services/missions_service.dart';
import 'package:logger/logger.dart';

class MissionsController extends GetxController {
  var missions = <Mission>[].obs;
  var isLoading = false.obs;
  final Logger logger = Logger();

  void fetchMissionsForRocket(int rocketId) async {
    try {
      isLoading.value = true;
      logger.d('Fetching missions...');
      var fetchedMissions = await MissionsService().fetchMissions();
      logger.d('Missions fetched: ${fetchedMissions.length}');
      var filteredMissions = fetchedMissions
          .where((mission) => mission.rocketId == rocketId)
          .toList();
      logger.d('Filtered missions: ${filteredMissions.length}');
      missions.assignAll(filteredMissions);
    } catch (e, stacktrace) {
      logger.e('Error fetching missions', error: e, stackTrace: stacktrace);
    } finally {
      isLoading.value = false;
      logger.d('Loading state set to false');
    }
  }
}
