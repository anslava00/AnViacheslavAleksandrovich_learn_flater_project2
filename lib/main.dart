import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = 'Ан Вячеслав Александрович';
  TextEditingController fullNameController = TextEditingController();
  String status = 'Online';
  int age = 24;

  void changeStatus() {
    setState(() {
      status = status == 'Online' ? 'Offline' : 'Online';
    });
  }

  void addAge() {
    setState(() {
      age += 1;
    });
  }
  void subAge() {
    setState(() {
      age -= 1;
    });
  }
  void changeFullName() {
    setState(() {
      fullName = fullNameController.text;
      fullNameController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой профиль'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.person, size: 80), // Иконка профиля

            Text('Имя: $fullName'), // ФИО профиля

            SizedBox(width: 600,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                          hintText: 'Введите новое ФИО'
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1, // Задаем вес кнопке, чтобы была адаптивная ширина
                    child: ElevatedButton(
                      onPressed: changeFullName,
                      child: Text('Изменить ФИО'),
                    ),
                  ),
                ],
              ),
            ),

            Text('Возраст: $age'), // Возраст пользователя
            TextButton(  // Кнопка для увеличения возраста пользователя
              onPressed: addAge,
              child: Text('Увеличить возраст'),
            ),
            TextButton(  // Кнопка для уменьшения возраста пользователя
              onPressed: subAge,
              child: Text('Уменьшить возраст'),
            ),

            Text('Статус: $status'), // Статус пользователя (online/offline)
            TextButton(  // Кнопка для изменения статуса профиля(online/offline)
              onPressed: changeStatus,
              child: Text('Изменить статус'),
            ),
          ],
        ),
      ),
    );
  }
}



