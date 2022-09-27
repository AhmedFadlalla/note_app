import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/domain/use_case/get_Interest_data_use_case.dart';
import 'package:note_app/presentation/controller/user/user_event.dart';
import 'package:note_app/presentation/controller/user/user_state.dart';

import '../../../core/use_case/base_use_case.dart';
import '../../../core/utils/enum.dart';
import '../../../domain/use_case/add_user_user_case.dart';
import '../../../domain/use_case/get_user_image_use_case.dart';



class UserBloc extends Bloc<BaseUserEvent, UserState> {
  final AddUserDataUseCase addUserDataUseCase;
  final GetUserImageUseCase getUserImageUseCase;
  final GetInterestDataUseCase getInterestDataUseCase;
  UserBloc(this.addUserDataUseCase,this.getUserImageUseCase,this.getInterestDataUseCase) : super(UserState()) {
    on<AddUserEvent>((event, emit) async{
      final result=await  addUserDataUseCase(
          UserParameter(
              userName: event.userName,
              password: event.password,
              email: event.email,
              image: event.image,
              interstedId: event.interstedId,
              ));
      result.fold((l) => emit(
          state.copyWith(
              userDataMessage: l.message,
              userDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(

                  userDataState: RequestState.loaded
              )
          ));
    });


    on<GetUserImageEvent>((event, emit) async{
      final result=await  getUserImageUseCase(const NoParameters());
      result.fold((l) => emit(
          state.copyWith(
              userImageMessage: l.message,
              userImageState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(
                  userImage: r,
                  userImageState: RequestState.loaded
              )
          ));

    });

    on<GetInterestDataEvent>((event, emit) async{
      final result=await  getInterestDataUseCase(const NoParameters());
      result.fold((l) => emit(
          state.copyWith(
              interestsDataMessage: l.message,
              interestsDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(
                  interestsData: r,
                  interestsDataState: RequestState.loaded
              )
          ));

    });
  }
}
