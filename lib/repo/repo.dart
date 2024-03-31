// import 'dart:convert';

// import 'package:webkul1/model/post_data_model.dart';
// import 'package:http/http.dart' as http;
// class  postrepo {
  

// Future<List<Welcome>?> PostEvent ()async{
// final  response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
// try{
//   if(response.statusCode == 200){
//     final result = json.decode(response.body) as List;
//     print(result);
//    return result.map((e){
//    return Welcome(userId: e['userId'], id: e['id'], title:e ['title'], body: e['body']);
//    }).toList();
//   }
//   else{return [];
//     print('Something went wrong');
//   }

// }
// catch(e)
// {return []; print(e.toString());}


// }}