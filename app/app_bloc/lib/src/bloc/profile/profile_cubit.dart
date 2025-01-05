import 'dart:async';

import '../../../app_bloc.dart';
import 'package:model/model.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit({
    required this.fetchUserProfile,
    required this.getUserProfile,
    required this.fetchPartnerProfile,
    required this.getPartnerProfile,
    required this.getToken,
    required this.getType,
  }): super(ProfileState.init()){
    _profileSubscription = getUserProfile.watch().listen((event) {
      if(event == null) return;
      init();
    });
  }

  final FetchPartnerProfile fetchPartnerProfile;
  final GetPartnerProfile getPartnerProfile;

  final GetUserProfile getUserProfile;
  final FetchUserProfile fetchUserProfile;

  final GetToken getToken;
  final GetAuthType getType;

  late StreamSubscription<DriverData?> _profileSubscription;

  Future<void> initDriver() async {
    emit(const ProfileState.loading());
    final profile = getUserProfile.get();
    if (profile != null) {
      emit(ProfileState.user(driverProfile: profile));
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

  Future<void> initPartner() async {
    emit(const ProfileState.loading());
    final profile = getPartnerProfile.get();
    if (profile != null) {
      emit(ProfileState.user(partnerProfile: profile));
      return;
    }
    final token = await getToken.get();
    if(token != null){
      final res = await fetchPartnerProfile.fetch();
      if(res == null){
        emit(ProfileState.error(''));
        return;
      }
      return;
    }
    emit(ProfileState.error(''));
  }

  Future<void> init() async{
    if(await type() == AuthType.driver){
      await initDriver();
    }else{
      await initPartner();
    }
  }

  /// need complete
  Future<void> checkStatus()async{
    return;
  }

  Future<AuthType> type() async{
    final type = await getType.get();
    return type;
  }

  @override
  Future<void> close() {
    _profileSubscription.cancel();
    return super.close();
  }
}