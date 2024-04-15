import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/usecases/usercase.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/repositories/blog_repositories.dart';
import 'package:fpdart/fpdart.dart';


class GetAllBlogs implements UserCase<List<Blog> , NoParams>{
  final BlogRepository blogRepository;

  GetAllBlogs(this.blogRepository);
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params)async {
    
      return await blogRepository.getAllBlogs();
    
  }

}