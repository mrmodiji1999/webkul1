import 'package:equatable/equatable.dart';

 abstract class FlutterEvent extends Equatable{
  @override
  List<Object?> get props =>[];

}
class PostFetchEvent extends FlutterEvent{}

class ViewEvent extends FlutterEvent{}
class ScaffoldEvent extends FlutterEvent{}