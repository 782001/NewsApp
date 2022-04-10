
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/network/local/cacheHelper.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/shared/blocObserver.dart';
import 'cubit/states.dart';
import 'homeLayOut.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {},
    blocObserver: MyBlocObserver(),
  );
DioHelper.init();
await CacheHelper.init();
bool? isDark= CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
final bool isDark;
MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..GetBusiness()
        ..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit ,NewsStates>(
        listener: (context ,state){},
        builder: (context ,state){
        return  MaterialApp(

         theme: ThemeData( scaffoldBackgroundColor: Colors.white,
           appBarTheme: AppBarTheme(
             iconTheme:IconThemeData(
               color: Colors.black,
               size: 30,
             ),
           elevation: 0,

          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness:  Brightness.dark,
          ),
        ),
           bottomNavigationBarTheme:BottomNavigationBarThemeData (
           type: BottomNavigationBarType.fixed,
           selectedItemColor: Colors.deepOrange
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              )
          ),
          primarySwatch: Colors.deepOrange,
        ),
         darkTheme:  ThemeData(
          scaffoldBackgroundColor: HexColor('333739'),

          appBarTheme: AppBarTheme(
          elevation: 0,
          titleSpacing: 20,
          iconTheme:IconThemeData(
            color:Colors.white,
            size: 30,
          ),

              color: HexColor('333739'),
            titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          ),

          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness:  Brightness.light,
          ),
          ),

          bottomNavigationBarTheme:BottomNavigationBarThemeData (
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          backgroundColor: HexColor('333739'),
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
              )
            ),
          primarySwatch: Colors.deepOrange,
          ),
         themeMode:NewsCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light,
         debugShowCheckedModeBanner: false,
          home:NewsApp(),
          );
        }
      )
    );
  }
}


