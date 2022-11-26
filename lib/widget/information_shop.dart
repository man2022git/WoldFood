import 'package:flutter/material.dart';
import 'package:woldfood/screen/add_info_shop.dart';
import 'package:woldfood/utility/my_style.dart';

class InFormationShop extends StatefulWidget {
  const InFormationShop({super.key});

  @override
  State<InFormationShop> createState() => _InFormationShopState();
}

class _InFormationShopState extends State<InFormationShop> {

  void routeToAddInfo() {
    print('routeToAddInfo Work');
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   'ราย ละเอียด ร้าน'
    // );
    // return Column(
    return Stack(
      children: <Widget>[
        MyStyle()
            .titleCenter(context, 'ยังไม่มี ข้อมูล กรุณาเพิ่มข้อมูลด้วย ค่ะ'),
        addAnEditButton(),
      ],
    );
  }

  Row addAnEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                  child: Icon(Icons.edit), onPressed: () {
                    print('you click floating');
                    routeToAddInfo();
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
