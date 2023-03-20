import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:set_color/set_color_viewmodel.dart';

class setColor extends ConsumerWidget {
   setColor({Key? key}) : super(key: key);


  var colorList = [const Color(0xffee0000), const Color(0xffFFB831), const Color(0xff33ADEE)];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択したカラーを呼び出す
    var color = ref.watch(setColorViewModel);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: color,
        title: const Text('テーマカラー設定'),
      ),
      body: ListView.builder(
          itemCount: colorList.length,
          itemBuilder:(context,index) {
            var backgroundColor = colorList[index];
            return GestureDetector(
              onTap: () {
                // コンテナーをタップしてカラーを選択する
                ref.read(setColorViewModel.notifier).setSelectColor(backgroundColor);
              },
              child:Container(
                width: 200,
                height: 200,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorList[index],
                ),
              ),
            );
          }
      )
    );
  }
}
