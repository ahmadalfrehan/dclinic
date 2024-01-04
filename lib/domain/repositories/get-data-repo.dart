import 'package:dartz/dartz.dart';

import '../../Conf/error/Failure.dart';
import '../../data/model/returned.dart';

abstract class GetDataRpo {
  Future<Either<Failure, List<ReturnedModel>>> getData();
}
