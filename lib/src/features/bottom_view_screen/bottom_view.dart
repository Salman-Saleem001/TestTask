import 'package:bloc_demo/main_export.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {

  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _currentIndex==1? AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        elevation: 0,
        title: CustomText(text: 'My collection', fontSize: 32, fontFamily: Assets.ebGaramondMedium),
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child:  Image.asset(Assets.notificationIcon, width: 24, height: 24),
              ),
              Positioned(
                right: 2,
                bottom: 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.redColor),
                  child: SizedBox(height: 7, width: 7),
                ),
              ),
            ],
          ),
          10.wp(),
        ],
      ): null,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          SizedBox(),
          CollectionView(),
          SizedBox(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex= index;
          });
        },
        backgroundColor: AppColors.greyScaleColor,
        elevation: 2.0,
        iconSize: 24,
        selectedLabelStyle: TextStyle(
          inherit: false,
          fontSize: 12,
          fontFamily: Assets.latoRegular,
        ),
        unselectedLabelStyle: TextStyle(
          inherit: false,
        ),
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.greyColor3,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.scanIcon)), label: 'Scan'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.collectionIcon)), label: 'Collection'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.bottleIcon)), label: 'Shop'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.settingIcon)), label: 'Settings'),
        ],
      ),
    );
  }
}
