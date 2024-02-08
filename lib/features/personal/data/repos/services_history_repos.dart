import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';

abstract class ServicesHistoryRepo {
  Future fetchhistorydata();
  Future<void> addNewServiceToHistory({required ServiceHistoryModel data});
  Future editServiceInHistory({required ServiceHistoryModel data});
}
