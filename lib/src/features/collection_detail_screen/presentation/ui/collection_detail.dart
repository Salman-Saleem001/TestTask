import 'package:bloc_demo/main_export.dart';


class CollectionDetailScreen extends StatelessWidget {
  const CollectionDetailScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        image: DecorationImage(image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover),
      ),
      child: Center(
        child: BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
          builder: (BuildContext context, state) {
            switch (state) {
              case CollectionDetailFetched():
                final CollectionDetail collectionDetailData = state.collection;
                return DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    backgroundColor: AppColors.transparentColor,
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          60.hp(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: collectionDetailData.title,
                                fontSize: 12,
                                fontFamily: Assets.latoRegular,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: AppColors.backgroundColor, shape: BoxShape.circle),
                                  child: Icon(Icons.clear, size: 24, color: AppColors.whiteColor),
                                ),
                              ),
                            ],
                          ),
                          16.hp(),
                          Image.asset(collectionDetailData.imageUrl, height: 400),
                          16.hp(),
                          Flexible(
                            child: ColoredBox(
                              color: AppColors.containerColor,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: collectionDetailData.bottleId,
                                      fontSize: 12,
                                      fontFamily: Assets.latoRegular,
                                    ),
                                    8.hp(),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Talisker ',
                                        style: TextStyle(
                                          fontFamily: Assets.ebGaramondMedium,
                                          fontSize: 32,
                                          color: AppColors.whiteColor,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '18 Year old ',
                                            style: TextStyle(
                                              fontFamily: Assets.ebGaramondMedium,
                                              fontSize: 32,
                                              color: AppColors.buttonColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '#${collectionDetailData.id} ',
                                            style: TextStyle(
                                              fontFamily: Assets.ebGaramondMedium,
                                              fontSize: 32,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    24.hp(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.backgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TabBar(
                                        indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.buttonColor,
                                        ),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelColor: AppColors.blackColor,
                                        dividerColor: AppColors.transparentColor,
                                        unselectedLabelColor: AppColors.greyColor4,
                                        labelStyle: TextStyle(fontSize: 12, color: AppColors.whiteColor),
                                        unselectedLabelStyle: TextStyle(fontSize: 12),
                                        tabs: [Tab(text: 'Details'), Tab(text: 'Tasting notes'), Tab(text: 'History')],
                                      ),
                                    ),
                                    Flexible(
                                      child: TabBarView(
                                        children: [
                                          DetailsTab(collectionDetail: collectionDetailData),
                                          TestingNotesScreen(collectionDetail: collectionDetailData),
                                          HistoryTab(collectionDetail: collectionDetailData,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: AppColors.buttonColor,
                      icon: const Icon(Icons.add, color: AppColors.blackColor,),
                      label: CustomText(
                        text: "Add to my collection",
                        fontSize: 16,
                        fontFamily: Assets.ebGaramondSemiBold,
                        textColor: AppColors.blackColor,
                      ),
                    ),
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                  ),
                );
              case ErrorInCollectionDetailLoading():
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(text: "Something went wrong", fontSize: 12),
                    5.hp(),
                    GestureDetector(
                      onTap: () {
                        context.read<CollectionDetailBloc>().add(GetCollectionDetail());
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
      ),
    );
  }
}

