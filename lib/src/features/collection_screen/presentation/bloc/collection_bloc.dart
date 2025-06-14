

import 'package:bloc_demo/main_export.dart';

class CollectionBloc extends Bloc<UserEvent, CollectionState> {
  final CollectionUseCase _collectionUseCase = sl.get();
  CollectionBloc() : super(CollectionInitialState()) {
    on<GetCollection>(_getCollectionData);
  }

  Future<void> _getCollectionData(GetCollection event, emit) async {
    debugPrint("event is $event");
    emit(CollectionLoading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _collectionUseCase(MessageParams(data: {}));
    result.fold((failure) {
      debugPrint("error is ${(failure.message)}");
      emit(ErrorInLoading());
    }, (collection) {
      debugPrint("users are ${collection.collection.first}");
      emit(CollectionFetched(collection: collection.collection));
    });
  }
}
