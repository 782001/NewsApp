abstract class NewsStates{}
class initialState extends NewsStates{}
class ChangeBottonNavBar extends NewsStates{}
class GetBusinesDataloadingState extends NewsStates{}
class GetBusinessSucssesState extends NewsStates{}
class GetBusinessDataerrorState extends NewsStates{
  final String error;

  GetBusinessDataerrorState(this.error);

}
class GetSportsDataloadingState extends NewsStates{}
class GetSportsDataSucssesState extends NewsStates{}
class GetSportsDataerrorState extends NewsStates{
  final String error;

  GetSportsDataerrorState(this.error);

}
class GetScienceDataloadingState extends NewsStates{}
class GetScienceDataSucssesState extends NewsStates{}
class GetScienceDataerrorState extends NewsStates{
  final String error;

  GetScienceDataerrorState(this.error);

}
class changeAppModeState extends NewsStates{}
class GetSearchDataSucssesState extends NewsStates{}
class GetSearchDataerrorState extends NewsStates{
  final String error;

  GetSearchDataerrorState(this.error);


}
