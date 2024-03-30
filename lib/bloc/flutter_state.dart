import 'package:equatable/equatable.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/post_status.dart';

class FlutterState extends Equatable{
  String message;
  bool isScaffold;
  bool IsviewList;
  PostStatus postStatus;
  List<Welcome> postlist ;
  FlutterState({this.isScaffold=false,this.IsviewList=false,this.message='',this.postStatus=PostStatus.Loding,this.postlist=const <Welcome>[]});
  FlutterState copyWith({ String? message, bool? isScaffold,
  PostStatus? postStatus,bool? IsviewList,
  List<Welcome>? postlist }){
    return FlutterState(
      isScaffold: isScaffold??this.isScaffold,
      IsviewList: IsviewList ?? this.IsviewList,
      postStatus: postStatus ??this.postStatus,
      message: message??this.message,
      postlist: postlist ?? this.postlist,

    );
  }
  @override

  List<Object?> get props =>[IsviewList,isScaffold];
}