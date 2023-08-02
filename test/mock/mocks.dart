import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notes_app/core/data/communication_inferface.dart';
import 'package:flutter_notes_app/core/entities/request.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_interface.dart';
import 'package:flutter_notes_app/core/state/scaffold_app_state.dart';
import 'package:flutter_notes_app/features/home_page/data/datasources/home_datasource_interface.dart';
import 'package:flutter_notes_app/features/home_page/data/error/home_error_handler.dart';
import 'package:flutter_notes_app/features/home_page/data/repositories/home_repository_interface.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/usecases/get_notes_usecase.dart';
import 'package:flutter_notes_app/features/home_page/domain/usecases/search_notes_usecase.dart';
import 'package:flutter_notes_app/features/home_page/presentation/controller/home_controller.dart';
import 'package:flutter_notes_app/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_notes_app/features/login/domain/repositories/login_repository_interface.dart';
import 'package:flutter_notes_app/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:flutter_notes_app/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_notes_app/features/new_note/data/datasources/new_note_datasource_interface.dart';
import 'package:flutter_notes_app/features/new_note/domain/repositories/new_note_repository_interface.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/create_note_usecase.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/delete_note_usecase.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/edit_note_usecase.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/get_note_by_id.dart';
import 'package:flutter_notes_app/core/authentication/firebase_helper.dart';
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
  NewNoteDatasourceInterface,
])

// Entities
@GenerateMocks([
  AppRequest,
  User,
  Note,
])

// ErrorHandlers
@GenerateMocks([
  HomeErrorHandler,
])

// Repositories
@GenerateMocks([
  LoginRepositoryInterface,
  HomeRepositoryInterface,
  NewNoteRepositoryInterface,
])

// Use cases
@GenerateMocks([
  LoginWithGoogleUsecase,
  GetNotesUsecase,
  SearchNotesUsecase,
  GetNoteByIdUseCase,
  CreateNoteUseCase,
  EditNoteUsecase,
  DeleteNoteUseCase,
])

// Controller
@GenerateMocks([
  ScaffoldAppState,
  LoginController,
  HomeController,
])
void main() {}
