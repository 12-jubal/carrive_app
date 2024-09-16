// ignore_for_file: overridden_fields

import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum SignupStatus { initial, loading, success, failure }

class SignupState extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? selectedModel;
  final Color? selectedColor;
  final String? carMatricule;
  final String? carId;
  // final SignupStatus? status;

  const SignupState({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.selectedModel,
    this.selectedColor,
    this.carMatricule,
    this.carId,
    // this.status,
  });

  // Create a copyWith method to allow state updates without losing other data
  SignupState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? selectedModel,
    Color? selectedColor,
    String? carMatricule,
    String? carId,
    // SignupStatus? status,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      selectedModel: selectedModel ?? this.selectedModel,
      selectedColor: selectedColor ?? this.selectedColor,
      carMatricule: carMatricule ?? this.carMatricule,
      carId: carId ?? this.carId,
      // status: status ?? this.status,
    );
  }

  // Override the props getter to include all the fields for comparison
  @override
  List<Object?> get props =>
      [selectedModel, selectedColor, carMatricule, carId];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final User user;
  const SignupSuccess({required this.user});
}

class SignupError extends SignupState {
  final String message;

  const SignupError({required this.message});
}

class SignupUnmatched extends SignupState {}

class SignupInvalid extends SignupState {
  final ValidationType? nameValidationType;
  final ValidationType? emailValidationType;
  final ValidationType? passwordValidationType;
  final ValidationType? confirmPasswordValidationType;
  const SignupInvalid({
    this.nameValidationType,
    this.emailValidationType,
    this.passwordValidationType,
    this.confirmPasswordValidationType,
  });
}

class CarRegister extends SignupState {
  final UserType userType;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  const CarRegister({
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
  });
}
