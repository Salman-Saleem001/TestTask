import 'package:bloc_demo/main_export.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDialogShowing= false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CollectionBloc()),
        BlocProvider(create: (_) => SignInBloc()),
        BlocProvider(create: (_) => CollectionDetailBloc()),
        BlocProvider(create: (_) => ConnectivityBloc(Connectivity())),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparentColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: MaterialApp(
          theme: ThemeData(progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.buttonColor)),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (BuildContext context, state) {
              if(state is ConnectivityOffline){
                isDialogShowing=true;
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_)=> NoInternetView());
              }else if(state is ConnectivityOnline && isDialogShowing){
                Navigator.of(context, rootNavigator: true).pop();
                isDialogShowing=false;
              }
            },
            child: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
