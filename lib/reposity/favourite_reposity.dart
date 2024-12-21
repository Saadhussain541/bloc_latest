import 'package:bloc1/model/favourite_item_model.dart';

class FavouriteReposity
{
  Future<List<FavouriteItemModel>> fetchList() async
  {
    await Future.delayed(const Duration(seconds: 2));
    return _generateList(10);

  }

  List<FavouriteItemModel> _generateList(int length)
  {
    return List.generate(length, (index) => FavouriteItemModel(id: index.toString(), value: 'Item $index'),);
  }



}