import 'package:dclinic/Presentation/Home/getx/home-controller.dart';
import 'package:dclinic/Presentation/Widgets/textFields.dart';
import 'package:dclinic/conf/theme/app-themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conf/style/app-text-style.dart';
import 'Button.dart';

class AddPatient extends GetView<HomeController> {
  const AddPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height,
      width: Get.width / 2,
      decoration: const BoxDecoration(
        color: AppTheme.white242,
      ),
      child: Column(
        children: [
          Text('Add Patient',
              style: AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor),
          const AppTextField(iconData: Icons.person, hint: 'Patient Name'),
          const AppTextField(iconData: Icons.person, hint: 'Phone'),
          const AppTextField(iconData: Icons.person, hint: 'Address'),
          DropdownButton<String>(
            isExpanded: true,
            hint: const Text('Select Treatment'),
            items: <String>[
              'محافظة',
              'ترميم',
              'لبية',
              'تتويج',
              'لثوية',
              'قلع',
              'اعادة المعالجة',
              'وتد'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const AppTextField(iconData: Icons.person, hint: 'Price'),
          const AppTextField(iconData: Icons.person, hint: 'Tooth Number'),
          const AppTextField(iconData: Icons.person, hint: 'Notes'),
          const AppTextField(iconData: Icons.person, hint: 'Notes'),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Button(
                'Add Group  ',
                () => null,
                color: AppTheme.darkBlue9,
                textStyle: AppTextStyle.textStyleWith400Weight12SizeWhiteColor,
              ),
              Button(
                'Add Patient  ',
                () => null,
                color: AppTheme.darkBlue9,
                textStyle: AppTextStyle.textStyleWith400Weight12SizeWhiteColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
