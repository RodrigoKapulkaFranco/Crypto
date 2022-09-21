import '../../../shared/model/cripto_list_view_data.dart';
import '../../repository/get_cripto/i_get_cripto_repo.dart';
import '../../shared/mapper/list_cripto_mapper.dart';
import 'i_get_cripto_usecase.dart';

class GetCriptoUsecaseImpl implements GetCriptoUsecaseInterface {
  final GetCriptoRepoInterface _repository;
  GetCriptoUsecaseImpl(
    this._repository,
  );

  @override
  Future<CriptoListViewData> execute() async {
    var response = await _repository.getCriptoCoinList();
    return response.toViewData();
  }
}
