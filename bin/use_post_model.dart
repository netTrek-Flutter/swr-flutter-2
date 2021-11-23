import 'rest/post_model.dart';
import 'rest/post_service.dart';

void main(List<String> arguments) async {
  PostService service =
      PostService('https://jsonplaceholder.typicode.com/posts');
  PostModel post5 = await service.getPostById(
      5); /*PostModel.fromJson({
    "userId": 1,
    "id": 5,
    "title": "nesciunt quas odio",
    "body":
        "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
  });*/

  print(post5);
}
