import 'package:equatable/equatable.dart';

 abstract class FlutterEvent extends Equatable{
  @override
  List<Object?> get props =>[];

}
class PostFetchEvent extends FlutterEvent{}

class ViewEvent extends FlutterEvent{}
class ScaffoldEvent extends FlutterEvent{}
class ApiDataSendEvent extends FlutterEvent{String email, passwd;

ApiDataSendEvent({required this.email,required this.passwd});
}