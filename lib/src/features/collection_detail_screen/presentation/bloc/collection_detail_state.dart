import 'package:bloc_demo/main_export.dart';
import '../../business/entity/collection_detail_entity.dart';

sealed class CollectionDetailState extends Equatable{
  const CollectionDetailState();

  @override
  List<Object> get props => [];
}

class CollectionDetailInitialState extends CollectionDetailState{}
class CollectionDetailLoading extends CollectionDetailState{}
class ErrorInCollectionDetailLoading extends CollectionDetailState{}
class CollectionDetailFetched extends CollectionDetailState{
  final CollectionDetail collection;
  const CollectionDetailFetched({required this.collection});
  @override
  List<Object> get props => [collection];
  @override
  bool get stringify => true;

}