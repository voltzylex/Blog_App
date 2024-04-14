import 'dart:io';

import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/usecases/usercase.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/repositories/blog_repositories.dart';
import 'package:fpdart/src/either.dart';

class UploadBlog implements UserCase<Blog, UploadBlogParams> {
  final BlogRepoistory blogRepoistory;

  UploadBlog({required this.blogRepoistory});
  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) {
    return blogRepoistory.uploadBlog(
        image: params.image,
        title: params.title,
        content: params.content,
        postId: params.posterId,
        topics: params.topics,);
  }
}

class UploadBlogParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
