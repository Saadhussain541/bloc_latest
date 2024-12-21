import 'package:bloc1/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:bloc1/bloc/favourite_bloc/favourite_state.dart';
import 'package:bloc1/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite_bloc/favourite_event.dart';
class FavouriteUi extends StatefulWidget {
  const FavouriteUi({super.key});

  @override
  State<FavouriteUi> createState() => _FavouriteUiState();
}

class _FavouriteUiState extends State<FavouriteUi> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite App'),
      actions: [
        BlocBuilder<FavouriteBloc,FavouriteState>(builder: (context, state) {
          return Visibility(
            visible: state.temFavouriteList.isNotEmpty?true:false,
            child: IconButton(onPressed: (){
              context.read<FavouriteBloc>().add(DeleteItem());
            }, icon: Icon(Icons.delete)),
          );
        },)
      ],
      centerTitle: true,
      ),
      body:BlocBuilder<FavouriteBloc,FavouriteState>(builder: (context, state) {
        switch(state.listStatus)
            {
          case ListStatus.loading:
            return Center(child: CircularProgressIndicator(),);
          case ListStatus.failor:
            return Center(child: Icon(Icons.error,color: Colors.red,),);
          case ListStatus.success:
            return ListView.builder(
              itemCount: state.favouriteListl.length,
              itemBuilder: (context, index) {
              final item=state.favouriteListl[index];
              return Card(child: ListTile(

                leading: Checkbox(value: state.temFavouriteList.contains(item)?true:false,
                    onChanged: (value){
                  if(value!)
                    {
                      context.read<FavouriteBloc>().add(SelectItem(item: item));
                    }
                  else
                    {
                      context.read<FavouriteBloc>().add(UnSelectItem(item: item));
                    }

                }),
                title: Text(item.value.toString()),
                trailing: IconButton(onPressed: (){
                  FavouriteItemModel itemModel=FavouriteItemModel(id: item.id.toString(), value: item.value.toString(),
                  isFavourite: item.isFavourite?false:true

                  );
                  context.read<FavouriteBloc>().add(FavouriteItem(item: itemModel));

                },
                  icon: Icon(item.isFavourite?Icons.favorite:Icons.favorite_border)),),);
            },);
        }

      },) ,
    );
  }
}
