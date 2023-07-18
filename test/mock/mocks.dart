import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notes_app/core/data/communication_inferface.dart';
import 'package:flutter_notes_app/core/entities/request.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_interface.dart';
import 'package:flutter_notes_app/features/home_page/data/datasources/home_datasource_interface.dart';
import 'package:flutter_notes_app/features/home_page/data/repositories/home_repository_interface.dart';
import 'package:flutter_notes_app/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_notes_app/features/login/domain/repositories/login_repository_interface.dart';
import 'package:flutter_notes_app/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:flutter_notes_app/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_notes_app/firebase_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';

// App native classes
@GenerateMocks([
  AppNavigatorInterface,
])

// Firebase
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
  FirebaseHelper,
  FirebaseAuth,
])

// Google
@GenerateMocks([
  GoogleSignInAuthentication,
  GoogleSignIn,
  GoogleSignInAccount,
  UserCredential,
])

// Datasources
@GenerateMocks([
  CommunicationInterface,
  HomeDatasourceInterface,
  LoginDatasourceInterface,
])

// Entities
@GenerateMocks([
  Request,
  User,
])

// Repositories
@GenerateMocks([
  LoginRepositoryInterface,
  HomeRepositoryInterface,
])

// Use cases
@GenerateMocks([
  LoginWithGoogleUsecase,
])

// Controller
@GenerateMocks([
  LoginController,
])
void main() {}
