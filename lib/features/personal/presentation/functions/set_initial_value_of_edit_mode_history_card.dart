import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';

void init(ServiceHistoryModel data) {
  AddServiceHistoryControllers.historyservicecontroller.text = data.service;
  AddServiceHistoryControllers.historydurationcontroller.text = data.duration;
  AddServiceHistoryControllers.historyplacecontroller.text = data.place;
  AddServiceHistoryControllers.historyrolecontroller.text = data.role;
  initialservice = data.service;
  initialrole = data.role;
  initialduration = data.duration;
  initialplace = data.place == "كنيسة مارجرجس" ? data.place : 'اخري';
  initialplaceelse = data.place != 'كنيسة مارجرجس' ? data.place : '';
}
