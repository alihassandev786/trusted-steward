import 'package:flutter/material.dart';
import '../../../../data/models/giving_form.dart';
import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';


class EditGivingScreen extends StatelessWidget {
  const EditGivingScreen({super.key, required this.transaction, this.onSave,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second});
  final GivingTransaction transaction;
  final SaveGiving? onSave;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  @override
  Widget build(BuildContext context) => GivingForm(initial: transaction, onSave: onSave,
    firstImage: firstImage, secondImage: secondImage);
}
