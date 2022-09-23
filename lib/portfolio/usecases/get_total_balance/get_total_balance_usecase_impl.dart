import 'package:decimal/decimal.dart';

import '../../model/cripto_list_view_data.dart';
import '../../repository/get_cripto/i_get_cripto_repo.dart';
import '../../utils/mapper/list_cripto_mapper.dart';
import 'i_get_total_balance_usecase.dart';

class GetTotalBalanceUsecaseImpl implements GetTotalBalanceUsecaseInterface {
  final GetCriptoRepoInterface _repository;
  GetTotalBalanceUsecaseImpl(
    this._repository,
  );

  @override
  Future<Decimal> execute(List<double> userAmountsCripto) async {
    var response = await _repository.getCriptoCoinList();
    Decimal totalBalance = Decimal.parse('0');
    CriptoListViewData criptoValues = response.toViewData();
    for (var i = 0; i < userAmountsCripto.length; i++) {
      totalBalance += Decimal.parse(userAmountsCripto[i].toString()) *
          criptoValues.criptoViewDataList[i].criptoValue;
    }
    return totalBalance;
  }
}
