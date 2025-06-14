import 'package:bloc_demo/main_export.dart';
import '../../collection_detail_export.dart';

class CollectionDetailUseCase implements UseCase<CollectionDetailEntity, CollectionDetailParams> {
  final CollectionDetailRepo _collectionDetailRepo;
  CollectionDetailUseCase(this._collectionDetailRepo);
  @override
  Future<Either<Failure,CollectionDetailEntity>> call(CollectionDetailParams params) => _collectionDetailRepo.viewCollectionDetail(params.data);
}

class CollectionDetailParams extends Equatable {
  final Map<String, dynamic> data;
  const CollectionDetailParams({required this.data});

  @override
  List<Object> get props => [data];
}
