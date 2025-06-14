import 'package:bloc_demo/main_export.dart';

class UserRepositoryImplementation extends CollectionRepo {
  final CollectionDataSource _dataSource;
  UserRepositoryImplementation(this._dataSource);
  @override
  Future<Either<Failure, CollectionEntity>> viewCollection(Map<String, dynamic> data) => _dataSource.loadCollectionItems();
}
