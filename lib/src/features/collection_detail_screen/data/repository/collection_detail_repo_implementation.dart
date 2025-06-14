import 'package:bloc_demo/main_export.dart';

import '../../collection_detail_export.dart';

class CollectionRepoDetailImplementation extends CollectionDetailRepo {
  final CollectionDetailDataSource _dataSource;
  CollectionRepoDetailImplementation(this._dataSource);
  @override
  Future<Either<Failure, CollectionDetailEntity>> viewCollectionDetail(Map<String, dynamic> data) => _dataSource.loadCollectionDetailItems();
}
