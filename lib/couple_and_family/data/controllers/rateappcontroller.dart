import 'package:get/get.dart';

class RateAppController extends GetxController {
  static RateAppController get to => Get.find();

  /// HEADER
  final String pageTitle = "Rate App";

  /// RATING SECTION
  final int initialRating = 3;
  final int maxRating = 5;
  final String heading = "How was your experience?";
  final String feedbackHint = "Share your experience about the App....";

  /// SUBMIT
  final String submitLabel = "Submit";
}