import '../repository/cripto_repository_impl.dart';
import '../repository/responses/history_list/history_response.dart';

class GetHistoryListUsecase {
  final CriptoRepositoryImpl repository;
  GetHistoryListUsecase({
    required this.repository,
  });

  Future<HistoryResponse> execute(String id, int time) async {
    var response = await repository.getHistoryList(id, time);
    return response;
  }
}
