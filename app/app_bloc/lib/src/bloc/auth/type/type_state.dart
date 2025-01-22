part of 'type_bloc.dart';

abstract class AuthTypeState{}

class Init extends AuthTypeState{}

class Fail extends AuthTypeState{
  Fail(this.message);
  final String message;
}

class PartnerType extends AuthTypeState{}

class DriverType extends AuthTypeState{}