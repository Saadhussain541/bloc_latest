import 'package:bloc/bloc.dart';
import 'package:bloc1/bloc/favourite_bloc/favourite_event.dart';
import 'package:bloc1/bloc/favourite_bloc/favourite_state.dart';
import 'package:bloc1/model/favourite_item_model.dart';
import 'package:bloc1/reposity/favourite_reposity.dart';

class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState>
{
  FavouriteReposity favouriteReposity;
  List<FavouriteItemModel> list=[];
  List<FavouriteItemModel> tempList=[];
  FavouriteBloc(this.favouriteReposity):super(const FavouriteState()){
   on<FetchFavouriteList> (_fetchList);
   on<FavouriteItem> (_addFavourite);
   on<SelectItem> (_selectItem);
   on<UnSelectItem> (_unSelectedItem);
   on<DeleteItem> (_deleteItem);
  }

  void _fetchList(FetchFavouriteList event,Emitter<FavouriteState> emit) async
  {
    list=await favouriteReposity.fetchList();

    emit(state.copyWith(favouriteListl: List.from(list),listStatus:ListStatus.success));
  }

  void _addFavourite(FavouriteItem event,Emitter<FavouriteState> emit) async
  {
    final index=list.indexWhere((element) => element.id==event.item.id,);
    if(event.item.isFavourite)
      {
        if(tempList.contains(list[index]))
          {
            tempList.remove(list[index]);
            tempList.add(event.item);
          }
        else
          {
            if(tempList.contains(list[index]))
              {
                tempList.remove(list[index]);
                tempList.add(event.item);
              }
          }
      }
    list[index]=event.item;

    emit(state.copyWith(favouriteListl: List.from(list),temFavouriteList: List.from(tempList)));

  }

  void _selectItem(SelectItem event,Emitter<FavouriteState> emit) async
  {

    tempList.add(event.item);

    emit(state.copyWith(temFavouriteList: List.from(tempList)));

  }

  void _unSelectedItem(UnSelectItem event,Emitter<FavouriteState> emit) async
  {
    tempList.remove(event.item);

    emit(state.copyWith(temFavouriteList: List.from(tempList)));

  }

  void _deleteItem(DeleteItem event,Emitter<FavouriteState> emit) async
  {
    for(int i=0; i<tempList.length;i++)
      {
        list.remove(tempList[i]);
      }

    tempList.clear();


    emit(state.copyWith(
      favouriteListl: List.from(list),
      temFavouriteList: List.from(tempList)
    ));

  }











}
