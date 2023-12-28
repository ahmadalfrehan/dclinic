import 'package:dclinic/domain/entites/familyGroup.dart';

class FamilyGroupModel extends FamilyGroup {
  FamilyGroupModel({
    required super.relationship,
    required super.patientId,
    required super.groupId,
  });

  factory FamilyGroupModel.fromJson(Map<String, dynamic> data) {
    return FamilyGroupModel(
      relationship: data['relationship'],
      patientId: data['patientId'],
      groupId: data['groupId'],
    );
  }
}
