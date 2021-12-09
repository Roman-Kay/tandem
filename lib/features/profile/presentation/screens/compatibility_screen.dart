import 'package:flutter/material.dart';
import 'package:tandem/core/presentation/widgets/compatibility_card.dart';
import 'package:tandem/core/presentation/widgets/user_app_bar_status.dart';


class CompatibilityScreen extends StatelessWidget {
  const CompatibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: UserAppBarStatus(name: 'Кристина', isOnline: true),
      ),

      body: Column(
        children: [
          CompatibilityCard(title: 'Сердце', percent: 93),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Физический', percent: 77),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Эмоции', percent: 64),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Интеллект', percent: 31),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Творчество', percent: 14),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Интуиция', percent: 92),
          SizedBox(height: 12),

          CompatibilityCard(title: 'Космос', percent: 72),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}


