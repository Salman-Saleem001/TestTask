import '../../main_export.dart';
import '../features/collection_detail_screen/collection_detail_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerFactory(() => UserBloc());
  // Register datasource
  sl.registerSingleton<CollectionDataSource>(CollectionDataSource());
  sl.registerSingleton<CollectionDetailDataSource>(CollectionDetailDataSource());
  // Register repository
  sl.registerSingleton<CollectionRepo>(UserRepositoryImplementation(sl<CollectionDataSource>()));
  sl.registerSingleton<CollectionDetailRepo>(CollectionRepoDetailImplementation(sl<CollectionDetailDataSource>()));
  // Register use cases
  sl.registerSingleton<CollectionUseCase>(CollectionUseCase(sl<CollectionRepo>()));
  sl.registerSingleton<CollectionDetailUseCase>(CollectionDetailUseCase(sl<CollectionDetailRepo>()));
}
