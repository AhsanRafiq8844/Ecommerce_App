import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use cases/use case.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetUserDetails implements BaseUsecase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetUserDetails(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await profileRepository.getUserDetail();
  }
}
