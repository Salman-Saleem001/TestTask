import 'package:bloc_demo/main_export.dart';
import '../../collection_detail_export.dart';

abstract class CollectionDetailRepo{
  Future<Either<Failure, CollectionDetailEntity>> viewCollectionDetail(Map<String, dynamic> data);
}