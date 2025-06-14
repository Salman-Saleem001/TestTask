import 'package:bloc_demo/main_export.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (BuildContext context, state) {
          switch (state) {
            case CollectionFetched():
              return RefreshIndicator(
                backgroundColor: AppColors.greyScaleColor,
                color: AppColors.buttonColor,
                onRefresh: () async {
                  context.read<CollectionBloc>().add(GetCollection());
                  return;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (_, index) {
                    final collectionData = state.collection[index];
                    return InkWell(
                      onTap: () {
                        context.read<CollectionDetailBloc>().add(GetCollectionDetail());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CollectionDetailScreen(),
                          ),
                        );
                      },
                      child: CollectionCard(
                        image: collectionData.imageUrl,
                        name: collectionData.name,
                        vintage: collectionData.vintage,
                        caskNumber: collectionData.caskNumber,
                        availableBottles: collectionData.availableBottles,
                        totalBottles: collectionData.totalBottles,
                        id: collectionData.id,
                      ),
                    );
                  },
                ),
              );
            case ErrorInLoading():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: "Something went wrong", fontSize: 12),
                  5.hp(),
                  GestureDetector(
                    onTap: () {
                      context.read<CollectionBloc>().add(GetCollection());
                    },
                    child: CustomText(text: "Try again", fontSize: 12, textColor: AppColors.buttonColor),
                  ),
                ],
              );
            default:
              return CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
