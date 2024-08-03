import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:spacex_app/controllers/missions_controller.dart';
import 'package:spacex_app/models/rocket_model.dart';
import 'package:spacex_app/services/rockets_service.dart';

class RocketsController extends GetxController {
  var rockets = <Rocket>[].obs;

  final Logger logger = Logger();

  final MissionsController missionsController = Get.find<MissionsController>();

  @override
  void onInit() {
    super.onInit();
    fetchRockets();
  }

  void fetchRockets() async {
    try {
      var fetchedRockets = await RocketsService().fetchRockets();
      rockets.assignAll(fetchedRockets);

      if (rockets.isNotEmpty) {
        missionsController.fetchMissionsForRocket(rockets.first.rocketId);
      }
    } catch (e, stacktrace) {
      logger.e('Error fetching rockets', error: e, stackTrace: stacktrace);
    }
  }
}
