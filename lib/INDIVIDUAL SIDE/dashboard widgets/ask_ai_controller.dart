import 'package:get/get.dart';

class AskAIController extends GetxController {
  RxList<Map<String, String>> messages = <Map<String, String>>[].obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add({"sender": "user", "message": text});

    Future.delayed(const Duration(seconds: 1), () {
      messages.add({
        "sender": "ai",

        "message":
            "Thank you for sharing. Reflect on how this connects with your stewardship journey.",
      });
    });
  }

  @override
  void onInit() {
    super.onInit();

    messages.addAll([
      {
        "sender": "ai",

        "message":
            "AI guidance may be imperfect and is not financial, legal, medical, pastoral, or other professional advice.",
      },
    ]);
  }
}
