import 'dart:convert';
import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/data/services/auth_services.dart';
import 'package:carrive_app/src/helpers/validation_helpers.dart';
import 'package:carrive_app/src/presentation/logic/signup/signup_state.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/storage/user_sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  // Instantiate the TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController carIdController = TextEditingController();
  final TextEditingController carMatriculeController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final UserType userType;
  final AppLocalizations localizations;

  SignupCubit({required this.userType, required this.localizations})
      : super(SignupInitial());

  // Handle car color selection
  Color onCarColorSelected(Color color) {
    emit(state.copyWith(selectedColor: color));
    return color;
  }

  // Handle car model selection
  String onCarModelSelected(String model) {
    emit(state.copyWith(selectedModel: model));
    return model;
  }

  // Handle car matriculation change
  String onCarMatriculationChange(String matricule) {
    emit(state.copyWith(carMatricule: matricule));
    return matricule;
  }

  // Handle car id change
  String onCarIdChange(String id) {
    emit(state.copyWith(carId: id));
    return id;
  }

  // Listen to name changes and update validation type
  void onNameChanged(String name) {
    final nameValidationType = ValidationHelpers.validateName(name: name);
    emit(state.copyWith(name: name));
    emit(SignupInvalid(
        nameValidationType: nameValidationType,
        emailValidationType:
            ValidationHelpers.validateEmail(email: emailController.text),
        passwordValidationType: ValidationHelpers.validatePassword(
            password: passwordController.text),
        confirmPasswordValidationType: ValidationHelpers.validatePassword(
            password: confirmPasswordController.text)));
  }

  // Listen to email changes and update validation type
  void onEmailChanged(String email) {
    final emailValidationType = ValidationHelpers.validateEmail(email: email);
    emit(state.copyWith(email: email));
    emit(SignupInvalid(
        nameValidationType:
            ValidationHelpers.validateName(name: nameController.text),
        emailValidationType: emailValidationType,
        passwordValidationType: ValidationHelpers.validatePassword(
            password: passwordController.text),
        confirmPasswordValidationType: ValidationHelpers.validatePassword(
            password: confirmPasswordController.text)));
  }

  // Listen to password changes and update validation type
  void onPasswordChanged(String password) {
    final passwordValidationType =
        ValidationHelpers.validatePassword(password: password);
    emit(state.copyWith(password: password));
    emit(SignupInvalid(
        nameValidationType:
            ValidationHelpers.validateName(name: nameController.text),
        emailValidationType:
            ValidationHelpers.validateEmail(email: emailController.text),
        passwordValidationType: passwordValidationType,
        confirmPasswordValidationType: ValidationHelpers.validatePassword(
            password: confirmPasswordController.text)));
  }

  // Listen to confirm password changes and update validation type
  void onConfirmPasswordChanged(String password) {
    final confirmPasswordValidationType =
        ValidationHelpers.validatePassword(password: password);
    emit(state.copyWith(confirmPassword: password));
    emit(SignupInvalid(
        nameValidationType:
            ValidationHelpers.validateName(name: nameController.text),
        emailValidationType:
            ValidationHelpers.validateEmail(email: emailController.text),
        passwordValidationType: ValidationHelpers.validatePassword(
            password: passwordController.text),
        confirmPasswordValidationType: confirmPasswordValidationType));
  }

  // Handle signup
  void signup({
    required UserType userType,
  }) async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(SignupError(message: localizations.inputFields));
    } else if (password != confirmPassword) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(SignupUnmatched());
    } else if (ValidationHelpers.validateName(name: name) ==
            ValidationType.valid &&
        ValidationHelpers.validateEmail(email: email) == ValidationType.valid &&
        ValidationHelpers.validatePassword(password: password) ==
            ValidationType.valid &&
        ValidationHelpers.validatePassword(password: confirmPassword) ==
            ValidationType.valid) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(SignupLoading());
      try {
        User user = await AuthService.signup(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          userType: userType,
        );
        // Convert User object to JSON string
        final userJson = jsonEncode(user.toJson());
        await UserSharedPreferencesHelper.saveUser(userJson: userJson);

        emit(SignupSuccess(user: user));
      } catch (e) {
        emit(SignupError(message: e.toString()));
      }
    } else {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(SignupError(message: localizations.unExpectedError));
    }
  }

  void onContinue() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(const SignupError(message: "Input all fields"));
    } else if (password != confirmPassword) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(SignupUnmatched());
    } else if (ValidationHelpers.validateName(name: name) ==
            ValidationType.valid &&
        ValidationHelpers.validateEmail(email: email) == ValidationType.valid &&
        ValidationHelpers.validatePassword(password: password) ==
            ValidationType.valid &&
        ValidationHelpers.validatePassword(password: confirmPassword) ==
            ValidationType.valid) {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(
        CarRegister(
          userType: userType,
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
    } else {
      emit(state.copyWith()); // Maintain the state if any field is empty
      emit(const SignupError(message: "Unexpected Error"));
    }
  }

  // Handle driver's signup method
  void driverSignup({
    required name,
    required email,
    required password,
    required confirmPassword,
  }) async {
    final carId = carIdController.text;
    final carMatricule = carMatriculeController.text;
    Color? selectedColor = state.selectedColor;
    String? selectedModel = state.selectedModel;

    // log(selectedColor.toString().substring(8, 16));

    if (carId.isEmpty ||
        carMatricule.isEmpty ||
        selectedColor == null ||
        selectedModel == null) {
      // Emit error message
      emit(SignupError(message: localizations.inputFields));
      // Emit the current state while preserving the selected values
      emit(state.copyWith(
        selectedModel: selectedModel,
        selectedColor: selectedColor,
        carMatricule: carMatricule,
        carId: carId,
      ));
    } else {
      emit(SignupLoading());
      // Call API for registration
      try {
        User user = await AuthService.signup(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          userType: userType,
          idCar: carId,
          matriculation: carMatricule,
          color: selectedColor.toString().substring(8, 16),
          carModel: selectedModel,
        );
        // Convert User object to JSON string
        final userJson = jsonEncode(user.toJson());
        await UserSharedPreferencesHelper.saveUser(userJson: userJson);

        emit(SignupSuccess(user: user));
      } catch (e) {
        emit(SignupError(message: e.toString()));
        // Emit the current state while preserving the selected values
        emit(state.copyWith(
          selectedModel: selectedModel,
          selectedColor: selectedColor,
          carMatricule: carMatricule,
          carId: carId,
        ));
        // print(e);
      }
    }
  }

  // // Dispose of the controllers
  // @override
  // Future<void> close() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   nameController.dispose();
  //   carIdController.dispose();
  //   carMatriculeController.dispose();
  //   confirmPasswordController.dispose();
  //   return super.close();
  // }
}
