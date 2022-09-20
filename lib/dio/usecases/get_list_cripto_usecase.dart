import '../../shared/model/criptoListViewData.dart';
import '../repository/cripto_repository_impl.dart';
import '../shared/list_cripto_mapper.dart';

class GetListCriptoCoinUsecase {
  final CriptoRepositoryImpl repository;
  GetListCriptoCoinUsecase({
    required this.repository,
  });

  Future<CriptoListViewData> execute() async {
    var response = await repository.getCriptoCoin();
    return response.toViewData();
  }
}
