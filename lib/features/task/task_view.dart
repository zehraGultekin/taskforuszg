import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(
        title: 'Görevlerim',
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        height: 56.0,
        actions: [
          IconButton(
            icon: Icon(Icons.repeat_rounded, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          taskWidget(icon: Icons.calendar_view_day,number: "0",title: "Tamamlanmayı",subtitle: "Bekleyen",color: Colors.amber,),
         SizedBox(width: 10),
          taskWidget(icon: Icons.task_alt_outlined,title: "Başarıyla",subtitle: "Tamamlanan",number: "0",color: Colors.green,),
        SizedBox(width: 10),
         taskWidget(icon: Icons.person_add_disabled, title: "Alınmayı", subtitle: "Bekleyen", number: "5", color: Colors.grey)
          ],
      )
    );
  }
}

class taskWidget extends StatelessWidget {
final IconData icon ;
final String number;
final String title;
  final String subtitle;
  final Color color;
  const taskWidget({
  
    super.key, required this.icon, required this.title, required this.subtitle, required this.number, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Icon(icon, size: 30, color: color),
          SizedBox(height: 8),
          Text(number,style: TextStyle(
            color:color,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 8),
          Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          ),
          Text(subtitle,style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),)
        
                 ] ),
      ),
    );
  }
}