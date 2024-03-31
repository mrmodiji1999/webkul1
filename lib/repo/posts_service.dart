import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;

  @GET("/posts")
  Future<dynamic> fetchPosts();
    @POST("/products")
  Future<dynamic> addPost(@Body() Map<String, dynamic> postData);
}
