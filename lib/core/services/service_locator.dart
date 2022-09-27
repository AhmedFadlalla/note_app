
import 'package:get_it/get_it.dart';
import 'package:note_app/domain/use_case/get_Interest_data_use_case.dart';
import 'package:note_app/domain/use_case/insert_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_data_use_case.dart';

import '../../data/data_source/base_local_data_source.dart';
import '../../data/data_source/base_remote_data_source.dart';
import '../../data/repository/note_repo.dart';
import '../../domain/repository/base_note_repo.dart';
import '../../domain/use_case/add_user_user_case.dart';
import '../../domain/use_case/get_note_use_case.dart';
import '../../domain/use_case/get_notes_use_case.dart';
import '../../domain/use_case/get_user_image_use_case.dart';
import '../../domain/use_case/get_users_data.dart';
import '../../presentation/controller/note_bloc.dart';
import '../../presentation/controller/user/user_bloc.dart';





final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc


    sl.registerFactory<NoteBloc>(() =>NoteBloc(sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory<UserBloc>(() =>UserBloc(sl(),sl(),sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case

    sl.registerLazySingleton<GetNotesUseCase>(() => GetNotesUseCase(sl()));
    sl.registerLazySingleton<GetNoteUseCase>(() => GetNoteUseCase(sl()));
    sl.registerLazySingleton<GetUsersDataUseCase>(() => GetUsersDataUseCase(sl()));
    sl.registerLazySingleton<UpdateNoteDataUseCase>(() => UpdateNoteDataUseCase(sl()));
    sl.registerLazySingleton<AddUserDataUseCase>(() => AddUserDataUseCase(sl()));
    sl.registerLazySingleton<GetUserImageUseCase>(() => GetUserImageUseCase(sl()));
    sl.registerLazySingleton<GetInterestDataUseCase>(() => GetInterestDataUseCase(sl()));
    sl.registerLazySingleton<InsertNoteUseCase>(() => InsertNoteUseCase(sl()));
    //Repository

    sl.registerLazySingleton<BaseNoteRepository>(() =>NoteRepository(sl(),sl()) );
    //data source

    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource() );
    sl.registerLazySingleton<BaseLocalDataSource>(() =>LocalDataSource() );

  }

}