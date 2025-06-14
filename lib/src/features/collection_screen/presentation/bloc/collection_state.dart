import 'package:bloc_demo/main_export.dart';

sealed class CollectionState extends Equatable{
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitialState extends CollectionState{}
class CollectionLoading extends CollectionState{}
class ErrorInLoading extends CollectionState{}
class CollectionFetched extends CollectionState{
  final List<CollectionItem> collection;
  const CollectionFetched({required this.collection});
  @override
  List<Object> get props => [collection];
  @override
  bool get stringify => true;

}