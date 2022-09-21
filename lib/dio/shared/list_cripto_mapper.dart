import 'package:decimal/decimal.dart';

import '../../shared/model/cripto_list_view_data.dart';
import '../../shared/model/cripto_view_data.dart';
import '../repository/responses/cripto_coin_list/cripto_response.dart';

extension CriptoCoinMapper on List<CriptoResponse> {
  CriptoListViewData toViewData() {
    return CriptoListViewData(
      criptoViewDataList: map(
        (item) => CriptoViewData(
          id: item.id,
          title: item.name,
          subtitle: item.symbol,
          imagePath: item.image,
          criptoValue: Decimal.parse(item.current_price.toString()),
          priceChangePercentage24h: item.price_change_percentage_24h,
        ),
      ).toList(),
    );
  }
}
