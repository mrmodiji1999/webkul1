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

            backgroundColor:state.isScaffold ? Colors.blue:Colors.yellow,
            appBar: AppBar(backgroundColor:Colors.transparent,
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
                  return Center(child: CircularProgressIndicator());
                case PostStatus.Succes:
                  print('homepage data reach saucces>>>>>>>>>>>');
                  print(state.postlist[0].data!.length.toString());
                  print(state.postlist[0].data![0].id);
                  print("""end""");
                  int lengthValue = state.postlist[0].data!.length;
                  print(lengthValue);
                  print("""the end""");
                  if (state.IsviewList) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(lengthValue, (index) {
                           final item = state.postlist[0].data![index];
                        
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                index.toString(),
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(item.id.toString())
                            ],
                          ),
                        );
                      }),
                    );
                  } else {print('narendra1');
                    return ListView.builder(
                        itemCount:lengthValue,
                        itemBuilder: (context, index) {
                          final item = state.postlist[0].data![index];
                        
                          return ListTile(
                              leading: Text(index.toString()),
                              title: Text(item.updatedAt.toString()),
                              subtitle: Text(item.path.toString()));
                        });
                  }
              }
            }));
      },
    );
  }
}
