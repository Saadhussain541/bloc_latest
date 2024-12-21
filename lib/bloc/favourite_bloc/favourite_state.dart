import 'package:bloc1/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';


enum ListStatus{loading,success,failor}
class FavouriteState extends Equatable
{
  final List<FavouriteItemModel> favouriteListl;
  final List<FavouriteItemModel> temFavouriteList;
  final ListStatus listStatus;

  const FavouriteState({this.favouriteListl=const [],
  this.listStatus=ListStatus.loading,
    this.temFavouriteList=const[]
  });

  FavouriteState copyWith({List<FavouriteItemModel>? favouriteListl,ListStatus? listStatus,List<FavouriteItemModel>? temFavouriteList})
  {
    return FavouriteState(
        favouriteListl: favouriteListl??this.favouriteListl,
        temFavouriteList: temFavouriteList??this.temFavouriteList,
      listStatus: listStatus??this.listStatus
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [favouriteListl,listStatus,temFavouriteList];

}