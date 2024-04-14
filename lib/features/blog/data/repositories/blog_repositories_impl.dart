import 'dart:io';

import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/features/blog/data/model/blog_model.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/repositories/blog_repositories.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRepositoryImpl({required this.blogRemoteDataSource});

  @override
  Future<Either<Failure, Blog>> uploadBlog(
      {required File image,
      required String title,
      required String content,
      required String postId,
      required List<String> topics}) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        title: title,
        content: content,
        imageUrl: "",
        posterId: postId,
        updatedAt: DateTime.now(),
        topics: topics,
      );
      final imageUrl = await blogRemoteDataSource.uploadBlogImage(image: image, blog: blogModel);
      blogModel = blogModel.copyWith(imageUrl: imageUrl);
      final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);

      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
