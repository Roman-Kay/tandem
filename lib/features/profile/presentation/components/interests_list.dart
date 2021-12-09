import 'package:flutter/material.dart';
import 'package:tandem/features/home/presentation/models/interest_button_ui_model.dart';
import '../../../../core/presentation/widgets/interest_button.dart';

class InterestsList extends StatelessWidget {
  const InterestsList({
    required this.buttons,
    required this.selectedGroup1,
    required this.onTap,
    Key? key}) : super(key: key);

  final List<InterestButtonUiModel> buttons;
  final List<int> selectedGroup1;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 33,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20);
          },
          scrollDirection: Axis.horizontal,
          itemCount: buttons.length + 2 ,
          itemBuilder: (BuildContext context, int index) {

            if(index == 0 ||  index == buttons.length + 1){
              return const SizedBox(width: 0);
            }
            else {
              return InterestButton.altType(
                  onTap:(){
                    onTap(index);
                  },
                  isActive: selectedGroup1.contains(index - 1),
                  buttonUiModel: buttons[index - 1],
                  altType: true);
            }
          }),
    );
  }
}
