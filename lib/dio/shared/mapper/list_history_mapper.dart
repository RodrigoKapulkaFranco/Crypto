import '../../../shared/model/history_list_view_data.dart';
import '../../repository/responses/history_list/history_response.dart';

extension CriptoHistoryMapper on HistoryResponse {
  HistoryListViewData toViewData() {
    return HistoryListViewData(
      prices: prices,
    );
  }
}
