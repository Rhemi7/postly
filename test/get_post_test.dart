import 'package:Postly/data/repository/data_repository/post_services.dart';
import 'package:Postly/models/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PostServicesMock extends Mock implements PostServices {}

void main() {
  List<Post> testPosts = [
    Post(id: 1, userId: 2, title: "First Post", body: "First post to test"),
    Post(id: 2, userId: 2, title: "Second Post", body: "Second post to test"),
    Post(id: 3, userId: 2, title: "Third Post", body: "Third post to test"),
    Post(id: 4, userId: 2, title: "Four Post", body: "Four post to test"),
  ];
  PostServicesMock postService = PostServicesMock();

  test('Testing get post to see if it returns list of post object', () async {
    when(postService.getPosts()).thenAnswer((_) async => testPosts);
    var result = await postService.getPosts();
    expect(result, testPosts);
    verify(postService.getPosts());
    verifyNoMoreInteractions(postService);
  });
}
