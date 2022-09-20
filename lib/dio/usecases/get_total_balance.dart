import 'package:decimal/decimal.dart';

import '../../shared/model/criptoListViewData.dart';
import '../repository/cripto_repository_impl.dart';
import '../shared/list_cripto_mapper.dart';

class GetTotalBalanceUsecase {
  final CriptoRepositoryImpl repository;
  GetTotalBalanceUsecase({
    required this.repository,
  });

  Future<Decimal> execute(List<double> userAmountsCripto) async {
    var response = await repository.getCriptoCoin();
    Decimal totalBalance = Decimal.parse('0');
    CriptoListViewData criptoValues = response.toViewData();
    for (var i = 0; i < userAmountsCripto.length; i++) {
      totalBalance += Decimal.parse(userAmountsCripto[i].toString()) *
          criptoValues.criptoViewDataList[i].criptoValue;
    }
    return totalBalance;
  }
}
