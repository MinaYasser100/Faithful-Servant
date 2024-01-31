import 'package:faithful_servant/core/helper/constant.dart';

String determindChurch({required String churchSelectedItem}) {
  if (churchSelectedItem == saintGeorge) {
    return selectChurch[saintGeorge];
  } else if (churchSelectedItem == virginMary) {
    return selectChurch[virginMary];
  } else if (churchSelectedItem == saintMark) {
    return selectChurch[saintMark];
  } else {
    return selectChurch[saintMain];
  }
}
