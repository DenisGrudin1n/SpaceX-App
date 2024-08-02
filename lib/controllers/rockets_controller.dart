import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:spacex_app/models/rocket_model.dart';
import 'package:spacex_app/services/rockets_service.dart';

class RocketsController extends GetxController {
  var rockets = <Rocket>[].obs;

  final Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    fetchRockets();
  }

  void fetchRockets() async {
    try {
      var fetchedRockets = await RocketsService().fetchRockets();
      rockets.assignAll(fetchedRockets);
    } catch (e, stacktrace) {
      logger.e('Error fetching rockets', error: e, stackTrace: stacktrace);
    }
  }
}
