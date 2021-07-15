import 'package:bloc/bloc.dart';
import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/comman/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthCubit authCubit;
  String _counteryCode = '+966';
  String get counterCode => _counteryCode;
  SignInCubit(this.authCubit) : super(SignInInitial());
  final _auth = FirebaseAuth.instance;
  ConfirmationResult? _phoneConfrimResult;

  Future<void> signInWithPhone(String phone) async {
    try {
      log('رقم الهاتف'+_counteryCode + phone);
      emit(SignInLoading());
      _phoneConfrimResult = await _auth.signInWithPhoneNumber(_counteryCode + phone,RecaptchaVerifier(
        container: 'recaptcha',
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark,

      ),
      );
      emit(SignInSucess(SignInResult.confrimCode));
    } catch (e) {
      emit(SignInFail(e.toString()));
     log(e.toString());
    }
  }

  Future<void> confirmSignInCode(String code) async {
    try {
      emit(SignInLoading());
      await _phoneConfrimResult!.confirm(code);
      // TODO :: if user is newcomer create new profile for him
      emit(SignInSucess(SignInResult.sucess));
      return authCubit.checkUserAuthStats();
    } catch (e) {
      emit(SignInFail(e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(SignInLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSucess(SignInResult.confrimCode));
      return authCubit.checkUserAuthStats();
    } catch (e) {
      emit(SignInFail(e.toString()));
    }
  }

  void setCountreyCode(String code) {
    _counteryCode = code;
    emit(SignInInitial());
  }
}
