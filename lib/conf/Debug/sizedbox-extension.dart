import 'package:dclinic/Conf/Debug/screen-stability.dart';
import 'package:flutter/material.dart';

extension SpaceXY on double {
  SizedBox get spaceX => SizedBox(width: ScreenStability.width(this));

  SizedBox get spaceY => SizedBox(height: ScreenStability.height(this));
}
