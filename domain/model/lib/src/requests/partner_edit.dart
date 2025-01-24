import 'package:core/core.dart';

class PartnerEdit extends Equatable {
  final String nickname;
  final String phone;
  final String comment;

  const PartnerEdit({
    required this.nickname,
    required this.phone,
    required this.comment,
  });

  @override
  List<Object?> get props => [nickname, phone, comment];
}