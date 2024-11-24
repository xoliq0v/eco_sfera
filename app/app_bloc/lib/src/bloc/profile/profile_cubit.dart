import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:model/model.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit({
    required this.fetchUserProfile,
    required this.getUserProfile,
    required this.getToken
  }): super(ProfileState.init()){
    _profileSubscription = getUserProfile.watch().listen((event) {
      if(event == null) return;
      emit(ProfileState.user(userProfile: event));
    });
  }

  final GetUserProfile getUserProfile;
  final FetchUserProfile fetchUserProfile;
  final GetToken getToken;

  late StreamSubscription<UserProfile?> _profileSubscription;

  Future<void> initUser() async {
    emit(const ProfileState.loading());
    final profile = getUserProfile.get();
    if (profile != null) {
      emit(ProfileState.user(userProfile: profile));
      return;
    }
    final token = await getToken.get();
    if(token != null){
      final res = await fetchUserProfile.fetch();
      if(res == null){
        emit(ProfileState.error(''));
        return;
      }
      return;
    }
    emit(ProfileState.error(''));
  }

  @override
  Future<void> close() {
    _profileSubscription.cancel();
    return super.close();
  }
}