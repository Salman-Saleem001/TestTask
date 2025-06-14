import 'package:bloc_demo/main_export.dart';
import '../../collection_detail_export.dart';

class CollectionDetailDataSource{

  Future<Either<Failure, CollectionDetailEntity>> loadCollectionDetailItems() async {
    try {
      final data = CollectionDetail(
        id: "2504",
        title: "Talisker",
        imageUrl: Assets.dummySpringImage,
        yearOld: 18,
        bottleId: "135/184",
        details: BottleDetails(
          distillery: "Talisker",
          region: "Isle of Skye",
          country: "Scotland",
          type: "Single Malt Scotch",
          ageStatement: "18 Years",
          filled: "2003",
          bottled: "2021",
          caskNumber: "2504",
          abv: "45.8%",
          size: "700ml",
          finish: "Oak Cask",
        ),
        tastingNotes: TastingNotes(
          author: "Charles MacLean MBE",
          sections: [
            TastingSection(
              title: "Nose",
              descriptions: [
                "Rich maritime aromas with hints of sea salt.",
                "Subtle peat smoke intertwined with citrus notes.",
                "Vanilla and caramel undertones from oak aging.",
              ],
            ),
            TastingSection(
              title: "Palate",
              descriptions: [
                "Peppery spice that builds gradually.",
                "Complex layers of dried fruit and dark chocolate.",
                "Distinctive briny character with oyster shell minerality.",
              ],
            ),
            TastingSection(
              title: "Finish",
              descriptions: [
                "Long, warming and satisfyingly smoky.",
                "Gentle sweetness lingers with traces of black pepper.",
                "Final notes of oak and sea spray.",
              ],
            ),
          ],
        ),
        history: History(
          videoUrl: "https://example.com/history-video.mp4",
          imageUrl: "https://picsum.photos/200?image=1002", // Added this missing field
          events: [
            HistoryEvent(
              date: DateTime(2003, 1, 1),
              description: "Distilled and filled into oak casks",
            ),
            HistoryEvent(
              date: DateTime(2010, 1, 1),
              description: "Transferred to warehouse for long-term maturation",
              eventImageUrl: "https://example.com/warehouse.jpg",
            ),
            HistoryEvent(
              date: DateTime(2021, 1, 1),
              description: "Bottled and prepared for release",
            ),
          ],
        ),
      );
      final collectionEntity = CollectionDetailEntity(collection: data);
      return Right(collectionEntity);
    } catch (e) {
      return Left(ParsingFailure('Failed to load collection items: ${e.toString()}'));
    }
  }
}