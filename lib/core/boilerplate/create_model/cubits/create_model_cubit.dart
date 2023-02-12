import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/api/core_models/base_result_model.dart';

import 'package:meta/meta.dart';
import '../../../../core/api/errors/net_error.dart';
import '../../../api/core_models/base_response_model.dart';
import '../../../api/errors/base_error.dart';
part 'create_model_state.dart';

typedef RepositoryCallBack = Future<BaseResultModel> Function(dynamic data);

class CreateModelCubit<Model> extends Cubit<CreateModelState> {
  final RepositoryCallBack? getData;

  CreateModelCubit(this.getData) : super(CreateModelInitial());

  createModel(dynamic requestData) async {
    emit(Loading());
    try {
      var response = await getData!(requestData);
      debugPrint('responseeeeeeeeeeeee = ${(response)}');

      if (response is Model) {
        emit(CreateModelSuccessfully(response));
      } else if (response is ServerError)
        emit(Error(
            response.message.toString() + '\n' + (response.details ?? '')));
      else if (response is BaseError)
        emit(Error(response.message));
      else if (response is NetError) emit(Error(response.message ?? ""));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
