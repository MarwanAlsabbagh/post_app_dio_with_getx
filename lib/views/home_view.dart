import 'package:flutter/material.dart';
import 'package:get/get.dart';


final List<_HomeOption> options = [
  _HomeOption(title: 'Posts', route: '/posts', icon: Icons.post_add),
  _HomeOption(title: 'Photos', route: '/photos', icon: Icons.photo),
  _HomeOption(title: 'Todos', route: '/todos', icon: Icons.task_alt),
  _HomeOption(title: 'Users', route: '/users', icon: Icons.person),
];

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options[index];
            return GestureDetector(
              onTap: () => Get.toNamed(option.route),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.deepPurpleAccent.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      size: 48,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(height: 10),
                    Text(
                      option.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HomeOption {
  final String title;
  final String route;
  final IconData icon;

  _HomeOption({required this.title, required this.route, required this.icon});

}
