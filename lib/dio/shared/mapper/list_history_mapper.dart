import '../../../shared/model/history_list_view_data.dart';
import '../../repository/responses/history_list/history_response.dart';

extension CriptoHistoryMapper on HistoryResponse {
  HistoryListViewData toViewData() {
    List<List<num>> temp = [];
    for (int i = 0; i < prices.length; i++) {
      temp.add([
        prices[i][0],
        prices[90 - i][1],
      ]);
    }
    return HistoryListViewData(
      prices: temp,
    );
  }
}
