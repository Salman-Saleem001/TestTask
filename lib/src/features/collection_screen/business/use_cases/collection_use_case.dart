import 'package:bloc_demo/main_export.dart';

class CollectionUseCase implements UseCase<CollectionEntity, MessageParams> {
  final CollectionRepo _collectionRepo;
  CollectionUseCase(this._collectionRepo);
  @override
  Future<Either<Failure, CollectionEntity>> call(MessageParams params) => _collectionRepo.viewCollection(params.data);
}

class MessageParams extends Equatable {
  final Map<String, dynamic> data;
  const MessageParams({required this.data});

  @override
  List<Object> get props => [data];
}
