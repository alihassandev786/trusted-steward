import 'package:flutter/material.dart';
import '../../../../data/models/giving_form.dart';
import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';


class AddGivingScreen extends StatelessWidget {
  const AddGivingScreen({super.key, this.onSave,
    this.firstImage = StewardAssets.first, this.secondImage = StewardAssets.second});
  final SaveGiving? onSave;
  final ImageProvider firstImage;
  final ImageProvider secondImage;
  @override
  Widget build(BuildContext context) => GivingForm(onSave: onSave,
    firstImage: firstImage, secondImage: secondImage);
}
