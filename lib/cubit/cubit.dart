
// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/businessScreen/buisness.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/local/cacheHelper.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/scienceScreen/science.dart';
import 'package:news/sportsScreen/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(initialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem>BottomItems = [

    BottomNavigationBarItem(
        icon: Icon(Icons.business,),
        label: 'business'

    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports,),
        label: 'sports'

    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science,),
        label: 'science'

    ),
  ];

  void changeNavBar(index) {
    currentIndex = index;

    if(index==1)
      GetsportsData();
    if(index==2)
      GetScienceData();

    emit(ChangeBottonNavBar());
  }

  List <Widget>Screens = [
    buisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic> business=[];
  void GetBusiness(){
emit(GetBusinesDataloadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'775f366c248847ca82b9840fd0ac32a0',
        }
    ).then((value) {
      business=value.data['articles'];
      print('Sucsseddddddddddddddddddddddddddddddddddddddddddddddddded');
      emit(GetBusinessSucssesState());
    }).catchError((error){
      print('${error.toString()}');
      emit(GetBusinessDataerrorState(
        error.toString()
      ));
    });
  }
  List<dynamic> sports=[];
  void GetsportsData(){
emit(GetSportsDataloadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'775f366c248847ca82b9840fd0ac32a0',
        }
    ).then((value) {
      sports=value.data['articles'];
      print('Sucsseddddddddddddddddddddddddddddddddddddddddddddddddded');
      emit(GetSportsDataSucssesState());
    }).catchError((error){
      print('${error.toString()}');
      emit(GetSportsDataerrorState(
        error.toString()
      ));
    });
  }
  List<dynamic> science=[];
  void GetScienceData(){
emit(GetScienceDataloadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'775f366c248847ca82b9840fd0ac32a0',
        }
    ).then((value) {
      science=value.data['articles'];
      print('Sucsseddddddddddddddddddddddddddddddddddddddddddddddddded');
      emit(GetScienceDataSucssesState());
    }).catchError((error){
      print('${error.toString()}');
      emit(GetScienceDataerrorState(
        error.toString()
      ));
    });
  }
  bool isDark=false;
  void changeAppMode({
    bool? fromShared
      }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(changeAppModeState());
    }

    else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).
      then((value) {
        emit(changeAppModeState());
      });
    }
  }
  List<dynamic> search=[];
  void GetSearchData( value){

    emit(GetSportsDataloadingState());
    search=[];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'775f366c248847ca82b9840fd0ac32a0',
        }
    ).then((value) {
      search=value.data['articles'];
      print('Sucsseddddddddddddddddddddddddddddddddddddddddddddddddded');
      emit(GetSearchDataSucssesState());
    }).catchError((error){
      print('${error.toString()}');
      emit(GetSearchDataerrorState(
          error.toString()
      ));
    });
  }
  }