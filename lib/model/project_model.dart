class Project {
  final String name;
  final String description;
  final List<String> images;
  final String link;

  Project(this.name, this.description, this.images, this.link);
}

List<Project> projectList = [
  Project(
    'Mikrotik Laravel',
    'Mikrotik Laravel is a web application that allows you to manage your Mikrotik router with ease. A comprehensive system for managing MikroTik networks with Laravel, Node.js (Express.js), Rsyslog, and Midtrans payment gateway integration.',
    ['images/mikrotik-laravel/login.png', 'images/mikrotik-laravel/dashboard-2.png', 'images/mikrotik-laravel/dashboard-6.png', 'images/mikrotik-laravel/panel-1.png', 'images/mikrotik-laravel/panel-2.png'],
    'https://github.com/ilhamridho04/mikrotik-laravel/wiki',
  ),
];
