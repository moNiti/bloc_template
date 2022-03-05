part of 'form_type_cubit.dart';

enum FormType { login, signup }

class FormTypeState extends Equatable {
  const FormTypeState(this.formType);
  final FormType formType;

  @override
  List<Object> get props => [formType];

  FormTypeState copyWith(FormType type) {
    return FormTypeState(type);
  }
}
