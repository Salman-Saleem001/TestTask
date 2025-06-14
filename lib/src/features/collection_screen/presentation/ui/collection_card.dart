import 'package:bloc_demo/main_export.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.image,
    required this.name,
    required this.vintage,
    required this.caskNumber,
    required this.availableBottles,
    required this.totalBottles,
    required this.id,
  });

  final int id;
  final String image;
  final String name;
  final int vintage;
  final String caskNumber;
  final int availableBottles;
  final int totalBottles;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.containerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                alignment: Alignment.center,
                image,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                    Center(child: const Icon(Icons.error, color: AppColors.buttonColor, size: 32)),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final val = loadingProgress.cumulativeBytesLoaded;
                  final total = loadingProgress.expectedTotalBytes;
                  final progress = val / total!;
                  return Center(child: CircularProgressIndicator.adaptive(value: progress));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                text: "$name \n$vintage $caskNumber ",
                fontSize: 22,
                fontFamily: Assets.ebGaramondMedium,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                text: "($availableBottles/$totalBottles))",
                fontSize: 12,
                fontFamily: Assets.ebGaramondMedium,
                textColor: AppColors.greyColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}