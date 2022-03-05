import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_type_state.dart';

class FormTypeCubit extends Cubit<FormTypeState> {
  FormTypeCubit() : super(const FormTypeState(FormType.login));

  void moveToLogin() {
    emit(state.copyWith(FormType.login));
  }

  void moveToSignUp() {
    emit(state.copyWith(FormType.signup));
  }
}
