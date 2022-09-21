import '../../../shared/model/cripto_list_view_data.dart';

abstract class GetCriptoUsecaseInterface {
  Future<CriptoListViewData> execute();
}
