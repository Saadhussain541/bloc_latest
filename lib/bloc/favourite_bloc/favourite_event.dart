import 'package:bloc1/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable
{
  @override
  List<Object> get props=>[];
}

class FetchFavouriteList extends FavouriteEvent
{}

class FavouriteItem extends FavouriteEvent{
  final FavouriteItemModel item;
  FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvent{
  final FavouriteItemModel item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteEvent{
  final FavouriteItemModel item;
  UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteEvent{}