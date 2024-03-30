import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';
import 'package:webkul1/bloc/flutter_state.dart';
import 'package:webkul1/repo/post_status.dart';

class PostDataPage extends StatefulWidget {
  const PostDataPage({super.key});

  @override
  State<PostDataPage> createState() => _PostDataPageState();
}

class _PostDataPageState extends State<PostDataPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FlutterBloc>().add(PostFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlutterBloc, FlutterState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FilledButton(
                onPressed: () {
                  context.read<FlutterBloc>().add(ViewEvent());
                },
                child: Icon(Icons.add)),

            backgroundColor:state.isScaffold ? Colors.white24:Color.fromARGB(255, 68, 49, 96),
            appBar: AppBar(
              actions: [
                IconButton(onPressed: () {
                  context.read<FlutterBloc>().add(ScaffoldEvent());
                }, icon:state.isScaffold? Icon(Icons.lightbulb,color: Colors.yellow,):Icon(Icons.lightbulb))
              ],
              title: Text('post api'),
            ),
            body: BlocBuilder<FlutterBloc, FlutterState>(
                builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.Failuer:
                  return Text('fail');
                case PostStatus.Loding:
                  return CircularProgressIndicator();
                case PostStatus.Succes:
                  print('posst saucces');
                  print(state.postlist.length);
                  if (state.IsviewList) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(100, (index) {
                        return Center(
                          child: Text(
                            'Item $index',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        );
                      }),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: state.postlist.length,
                        itemBuilder: (context, index) {
                          final item = state.postlist[index];

                          return ListTile(
                              leading: Text(index.toString()),
                              title: Text(item.title),
                              subtitle: Text(item.body));
                        });
                  }
              }
            }));
      },
    );
  }
}
