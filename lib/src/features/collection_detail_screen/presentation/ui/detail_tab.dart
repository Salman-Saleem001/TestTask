import 'package:bloc_demo/main_export.dart';

class DetailsTab extends StatelessWidget {
  final CollectionDetail collectionDetail;
  const DetailsTab({super.key, required this.collectionDetail});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Distillery",
      "Region",
      "Country",
      "Type",
      "Age statement",
      "Filled",
      "Bottled",
      "Cask number",
      "ABV",
      "Size",
      "Finish",
    ];
    List<String> values = [
      collectionDetail.details.distillery,
      collectionDetail.details.region,
      collectionDetail.details.country,
      collectionDetail.details.type,
      collectionDetail.details.ageStatement,
      collectionDetail.details.filled,
      collectionDetail.details.bottled,
      collectionDetail.details.caskNumber,
      collectionDetail.details.abv,
      collectionDetail.details.size,
      collectionDetail.details.filled,
    ];
    Widget buildDetailRow(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: label, fontSize: 16, fontFamily: Assets.latoRegular, textColor: AppColors.whiteColor),
          CustomText(text: value, fontSize: 16, fontFamily: Assets.latoRegular, textColor: AppColors.whiteColor),
        ],
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        return buildDetailRow(title[index], values[index]);
      },
      separatorBuilder: (context, index) {
        return 12.hp();
      },
      itemCount: title.length,
    );
  }
}