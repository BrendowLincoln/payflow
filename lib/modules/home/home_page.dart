import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    var pages = [
      Container(color: Colors.green,),
      Container(color: Colors.red,),
    ];
    final HomeController controller = HomeController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          alignment: Alignment.center,
          height: 152,
          color: AppColors.primary,
          child: ListTile(
            title: RichText(
              text: TextSpan(
                  text: "Olá, ",
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: user.name,
                      style: AppTextStyles.titleBoldBackground,
                    ),
                  ]),
            ),
            subtitle: Text(
              "Mantenha suas contas em dia",
              style: AppTextStyles.captionShape,
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                child: Image.network(user.photoUrl!, fit: BoxFit.cover, ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(

        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
            Icons.home,
            color: AppColors.primary,
              ),
              onPressed: () {
                controller.setPage(0);
                setState(() { });
                print("Pagina atual: ${controller.currentPage}");
              },

            ),
            GestureDetector(
              onTap: () {
                print("Clicou!");
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            IconButton(
              icon: Icon(
            Icons.description_outlined,
            color: AppColors.body,
              ),
              onPressed: () {
                setState(() { });
                controller.setPage(1);
                print("Pagina atual: ${controller.currentPage}");

              },
            ),
          ],
        ),
      ),
    );
  }
}
