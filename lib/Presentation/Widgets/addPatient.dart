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
      decoration: BoxDecoration(
        color: AppTheme.white242,
      ),
      child: Column(
        children: [
          Text('Add Patient',
              style: AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor),
          AppTextField(iconData: Icons.person, hint: 'Patient Name'),
          AppTextField(iconData: Icons.person, hint: 'Phone'),
          AppTextField(iconData: Icons.person, hint: 'Address'),
          DropdownButton<String>(
            isExpanded: true,
            hint: Text('Select Treatment'),
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
          AppTextField(iconData: Icons.person, hint: 'Price'),
          AppTextField(iconData: Icons.person, hint: 'Tooth Number'),
          AppTextField(iconData: Icons.person, hint: 'Notes'),
          AppTextField(iconData: Icons.person, hint: 'Notes'),
          Spacer(),
          Row(
            children: [
              Spacer(),
              Button('Add Group  ', () => null, Icons.group_add,color: AppTheme.darkBlue9),
              Button('Add Patient  ', () => null, Icons.person_add,color: AppTheme.darkBlue9),
            ],
          )
        ],
      ),
    );
  }
}
