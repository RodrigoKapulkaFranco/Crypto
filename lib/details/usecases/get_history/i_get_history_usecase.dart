import '../../model/history_list_view_data.dart';

abstract class GetHistoryUsecaseInterface {
  Future<HistoryListViewData> execute(String id);
}
