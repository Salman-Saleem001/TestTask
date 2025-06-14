import 'package:bloc_demo/main_export.dart';

abstract class CollectionRepo{
  Future<Either<Failure, CollectionEntity>> viewCollection(Map<String, dynamic> data);
}