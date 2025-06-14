import 'package:bloc_demo/main_export.dart';
import '../../collection_detail_export.dart';

class CollectionDetailBloc extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  final CollectionDetailUseCase _collectionDetailUseCase = sl.get();
  CollectionDetailBloc() : super(CollectionDetailInitialState()) {
    on<GetCollectionDetail>(_getCollectionData);
  }

  Future<void> _getCollectionData(GetCollectionDetail event, emit) async {
    debugPrint("event is $event");
    emit(CollectionDetailLoading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _collectionDetailUseCase(CollectionDetailParams(data: {}));
    result.fold((failure) {
      debugPrint("error is ${(failure.message)}");
      emit(ErrorInCollectionDetailLoading());
    }, (collection) {
      debugPrint("users are ${collection.collection}");
      emit(CollectionDetailFetched(collection: collection.collection));
    });
  }
}
