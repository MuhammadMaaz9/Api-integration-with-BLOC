import 'package:apibloc/bloc/api_bloc.dart';
import 'package:apibloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ApiBloc api = ApiBloc();

  @override
  void initState() {
    api.add(GetApi());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiBloc, ApiState>(
        bloc: api,
        builder: (context, state) {
          if (state is ApiLoading) {
            return Center(child: const CircularProgressIndicator());
          }

          if (state is ApiLoaded) {
            Welcome model = state.data;
            print(model.msg);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: model.data.length,
              // separatorBuilder: (context, index) {
              //   return Divider();
              // },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    ' ${model.data[index].countryId.toString()}',
                  ),
                  // subtitle: Text(
                  //   'Last Name: ${model.data![index].lastName}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  title: Text(
                    '${model.data[index].name}',
                  ),
                );
              },
            );
          }
          if (state is ApiError) {
            return Text(state.message);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
