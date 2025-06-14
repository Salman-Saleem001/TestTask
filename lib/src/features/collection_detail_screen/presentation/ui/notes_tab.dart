
import 'package:bloc_demo/main_export.dart';

class TestingNotesScreen extends StatefulWidget {
  final CollectionDetail collectionDetail;
  const TestingNotesScreen({super.key, required this.collectionDetail});

  @override
  State<TestingNotesScreen> createState() => _TestingNotesScreenState();
}

class _TestingNotesScreenState extends State<TestingNotesScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller =
    VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    )
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.hp(),
          Center(
            child:
            _isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  if (!_controller.value.isPlaying)
                    IconButton(
                      icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
                      onPressed: _togglePlayPause,
                    )
                  else
                    GestureDetector(onTap: _togglePlayPause),
                ],
              ),
            )
                : const CircularProgressIndicator(),
          ),
          14.hp(),
          CustomText(
            text: "Tasting notes",
            fontSize: 22,
            fontFamily: Assets.ebGaramondMedium,
            textColor: AppColors.whiteColor,
          ),
          4.hp(),
          CustomText(
            text: widget.collectionDetail.tastingNotes.author,
            fontSize: 16,
            fontFamily: Assets.latoRegular,
            textColor: AppColors.whiteColor,
          ),
          16.hp(),

          notesSection(widget.collectionDetail.tastingNotes.sections[0].title, [
            widget.collectionDetail.tastingNotes.sections[0].descriptions[0],
            widget.collectionDetail.tastingNotes.sections[0].descriptions[1],
            widget.collectionDetail.tastingNotes.sections[0].descriptions[2],
          ], AppColors.sectionColor),
          notesSection(widget.collectionDetail.tastingNotes.sections[1].title, [
            widget.collectionDetail.tastingNotes.sections[1].descriptions[0],
            widget.collectionDetail.tastingNotes.sections[1].descriptions[1],
            widget.collectionDetail.tastingNotes.sections[1].descriptions[2],
          ], AppColors.sectionColor),
          notesSection(widget.collectionDetail.tastingNotes.sections[2].title, [
            widget.collectionDetail.tastingNotes.sections[2].descriptions[0],
            widget.collectionDetail.tastingNotes.sections[2].descriptions[1],
            widget.collectionDetail.tastingNotes.sections[2].descriptions[2],
          ], AppColors.sectionColor),
          30.hp(),
        ],
      ),
    );
  }

  Widget tabItem(String title, {bool isSelected = false, Color? highlightColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? highlightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.black : Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget notesSection(String title, List<String> descriptions, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, fontSize: 22, fontFamily: Assets.ebGaramondMedium, textColor: AppColors.whiteColor),
          8.hp(),
          for (var desc in descriptions)
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: CustomText(
                  text: desc,
                  fontSize: 16,
                  fontFamily: Assets.latoRegular,
                  textColor: AppColors.whiteColor,
                  maxLines: 4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}