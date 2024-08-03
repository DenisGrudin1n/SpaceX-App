import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherService {
  Future<void> launchURL(String url) async {
    await launchUrlString(url);
  }
}
