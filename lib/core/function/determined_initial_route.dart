import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';

String determinedInitialRoute() {
  if (CacheHelper.getData(key: kUserId) != null) {
    return CacheHelper.getData(key: kHomeView);
  } else {
    return GetPages.kSplashView;
  }
}
