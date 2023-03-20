import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:set_color/set_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _colorPrefsKey = 'selectedColorKey';

///StateNotifierProviderにsetColorViewModelを設定
final setColorViewModel = StateNotifierProvider<SetColorViewModel, Color>(
    (ref) => SetColorViewModel());

///クラスを定義(初期値の色は0xffee0000とする)
class SetColorViewModel extends StateNotifier<Color> {
  SetColorViewModel() : super(Color(0xffee0000)) {
    readColor();
  }

  ///sharedPreferencesをインスタンスを取得
  Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  ///appbarに色を設定するメソッド
  void setSelectColor(Color color) async {
    state = color;
    //sharedPreferencesをインスタンス化
    SharedPreferences _sharedPreferences = await getInstance();
    //sharedPreferenceにcolorを入れる
    _sharedPreferences.setString(_colorPrefsKey, color.toString());
  }

  ///タスクキルした際のSharedPreferenceの色を読む
  void readColor() async {
    //sharedPreferencesをインスタンス化
    SharedPreferences _sharedPreferences = await getInstance();
    //_colorPrefsKeyに保存されている値を取得
    var result = _sharedPreferences.getString(_colorPrefsKey) ?? "";
    if (result.isEmpty) return;
    //colorの0xがあると読み込めないためresultからとってきた値から取り除く
    try {
      Color color =
          Color(int.parse(result.split('(0x')[1].split(')')[0], radix: 16));
      state = color;
    } catch (e, s) {
      print('error');
    }
  }
}
