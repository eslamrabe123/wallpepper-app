part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}


class PrivacyAndPolicyStateLoading extends AccountState {}
class PrivacyAndPolicyStateSuccess extends AccountState {}
class PrivacyAndPolicyStateError extends AccountState {}
