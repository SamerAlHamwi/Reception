import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../API/errors/base_error.dart';
import '../../../api/core_models/base_response_model.dart';
import '../../../api/core_models/base_result_model.dart';
import '../models/GetListRequest.dart';
part 'pagination_state.dart';

typedef RepositoryCallBack = Future<BaseResultModel> Function(dynamic data);

class PaginationCubit<ListModel> extends Cubit<PaginationState> {
  final RepositoryCallBack getData;

  PaginationCubit(this.getData) : super(PaginationInitial());
  List<ListModel> list = [];
  Map<String, dynamic> params = {};
  int maxResultCount = 25;
  int skipCount = 0;
  String? keyword;

  getList(
      {bool loadMore = false,
      Map<String, dynamic>? param,
      String? keyword}) async {
    if (getData == null) return;
    if (!loadMore) {
      skipCount = 0;
      if (list.isEmpty) emit(Loading());
    } else
      skipCount += maxResultCount;

    if (param != null) params.addAll(param);

    var requestData = GetListRequest(
        maxResultCount: maxResultCount,
        skipCount: skipCount,
        extraParams: params,
        keyword: keyword ?? '');
    var response = await getData(requestData);

    if (response is ListResultModel<ListModel>) {
      if (loadMore)
        list.addAll(response.list!);
      else
        list = response.list!;

      emit(GetListSuccessfully(
          list: list, noMoreData: response.list!.length == 0 && loadMore));
    } else if (response is BaseError) {
      emit(Error((response as BaseError).message!));
    } else if (response is ServerError) {
      emit(Error((response).message ?? ""));
    }
  }
}
