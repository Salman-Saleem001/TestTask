import 'package:bloc_demo/main_export.dart';

class CollectionDataSource{
  Future<Either<Failure, CollectionEntity>> getCollectionRemote() async {
    try {
      final response = await MyApiCalls.callGetReq();
      return response.fold(
            (failure) => Left(failure),
            (data) {
          try {
            if (data == null) throw Exception('Null response data');
            final userModel = CollectionModel.fromJson(data);
            return Right(userModel);
          } catch (e) {
            return Left(ParsingFailure('Data parsing failed: $e'));
          }
        },
      );
    } on DioException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('System error: $e'));
    }
  }


  Future<Either<Failure, CollectionEntity>> loadCollectionItems() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/json/collection.json');
      // debugPrint("json is $jsonString");
      final List<dynamic> jsonData = json.decode(jsonString);

      final List<CollectionItem> items = jsonData.map((item) => CollectionItem.fromJson(item)).toList();
      final collectionEntity = CollectionEntity(collection: items);

      return Right(collectionEntity);
    } catch (e) {
      return Left(ParsingFailure('Failed to load collection items: ${e.toString()}'));
    }
  }
}