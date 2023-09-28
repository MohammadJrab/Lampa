import 'package:flutter/material.dart';

import '../../../../utils/assets.dart';
import '../widgets/for_you_item.dart';

class ForYouListViewBuilder extends StatefulWidget {
  const ForYouListViewBuilder({super.key});

  @override
  State<ForYouListViewBuilder> createState() => _ForYouListViewBuilderState();
}

class _ForYouListViewBuilderState extends State<ForYouListViewBuilder> {
  bool isSaved = false;

  void toggleIsSavedState() {
    setState(() {
      if (isSaved) {
        isSaved = false;
      } else {
        isSaved = true;
      }
    });
  }

  String subtilte = '''العلاقة العاطفية بين الشاب والفتاة
كل يوم عشرات الاستشارات فيما يخصّ موضوع العلاقات العاطفية بين الشبان والفتيات ، التي تبدأ بالإعجاب وغالباً تنتهي بالانفصال .
العلاقات العاطفية موضوع فرض وجوده في ساحات \n المجتمعات العربية، وقد ازداد بنسبة...... ''';
  @override
  Widget build(BuildContext context) {
    return ForYouItem(
      isSaved: isSaved,
      part: "الحب",
      image: AssetsData.relationPicture,
      publisher: "رند حجازي",
      title: "العلاقة العاطفية بين الشاب والفتاة...",
      subtitle: subtilte,
      date: "لمبة  /  11 يونيو 2023",
      toggleIsSavedState: toggleIsSavedState,
    );
  }
}
