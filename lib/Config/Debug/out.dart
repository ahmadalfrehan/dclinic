import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

log(message) {
  if (kDebugMode) {
    dev.log(message.toString(), name: 'ahmadalfrehan');
  }
}
