import 'package:bloc_demo/main_export.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key, required this.collectionDetail});

  final CollectionDetail collectionDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ColoredBox(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(12, 16, 0, 16),
          itemCount: collectionDetail.history.events.length,
          itemBuilder: (BuildContext context, int index) {
            final event = collectionDetail.history.events[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      if (index == 0) 5.hp(),
                      DecoratedBox(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.whiteColor),
                        child: SizedBox(height: 30, width: 30),
                      ),
                      SizedBox(
                        height: index == 2 ? 210 : 220,
                        width: 1,
                        child: ColoredBox(color: AppColors.buttonColor),
                      ),
                    ],
                  ),
                ),
                20.wp(),
                Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: collectionDetail.details.distillery, fontSize: 12),
                      10.hp(),
                      CustomText(
                        text: collectionDetail.details.type,
                        fontSize: 22,
                        fontFamily: Assets.ebGaramondMedium,
                      ),
                      10.hp(),
                      CustomText(text: event.description, fontSize: 16),
                      10.hp(),
                      ColoredBox(
                        color: AppColors.greyScaleColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.rotate(
                                    angle: pi / 4,
                                    child: Icon(Icons.attach_file, color: AppColors.whiteColor),
                                  ),
                                  10.wp(),
                                  CustomText(text: "Attachments", fontSize: 12),
                                ],
                              ),
                              5.hp(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children:
                                    List.generate(6, (index) {
                                      if (index % 2 == 0) {
                                        return ColoredBox(
                                          color: AppColors.greyColor1,
                                          child: SizedBox(height: 100, width: 100),
                                        );
                                      } else {
                                        return 10.wp();
                                      }
                                    }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
