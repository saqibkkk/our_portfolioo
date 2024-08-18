class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? driveLink;
  final String? gitLink;

  ProjectUtils(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.androidLink,
      this.iosLink,
      this.webLink,
      this.driveLink,
      this.gitLink});
}

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/chatting.jpg',
      title: "Chatting Application",
      subtitle: 'Flutter based chatting mobile application with amazing features like fingerprint authentication and custom themes.',
      driveLink: 'https://drive.google.com/drive/folders/1-1-xbSOpoMa6BncMiRW5J219KCGS0J5u?usp=sharing',
    gitLink: 'https://github.com/saqibkkk/chatting_application'
  ),
  ProjectUtils(
      image: 'assets/projects/vpn.jpg',
      title: "Free VPN",
      subtitle: 'Free Vpns for up to 100 location all over the world with Google ads integrated.',
  gitLink: 'https://github.com/saqibkkk/Free-VPN'),
];

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/emood.png',
      title: "EmoodBook",
      subtitle: 'A flutter based web admin panel for psychology ill patients.',
      driveLink: 'https://drive.google.com/file/d/1UTgpYGZ7CkWk3RrbLJv7fdboaDLoMKiO/view?usp=drive_link'),
  ProjectUtils(
      image: 'assets/projects/goodmovers.png',
      title: "My Good Movers",
      subtitle: 'React based web application, which connect you with reliable movers across the USA. ',
      webLink: 'https://mygoodmovers.com/'),
  ProjectUtils(
      image: 'assets/projects/accounting.jpg',
      title: "Accounting Application",
      subtitle: 'A flutter based under development accounting application with completed frontend.',
      driveLink: 'https://drive.google.com/file/d/15P-P5B3O29rMal9UiST_y0LwNJrhyBSq/view?usp=sharing'),
  ProjectUtils(
      image: 'assets/projects/movingjourney.png',
      title: "My Moving Journey",
      subtitle: 'React based web application. A user-friendly platform to empower individuals to navigate their moves.',
      webLink: 'https://mymovingjourney.com/'),
  ProjectUtils(
      image: 'assets/projects/jobjoy.png',
      title: "Job Joy",
      subtitle: 'A flutter based UI with firebase integrated, special application for employees with great and amazing deals.',
      driveLink: 'https://drive.google.com/file/d/1P1-qBuDgyrpY9AXS1KtmnX6H-ZICqJgc/view?usp=drive_link'),
  ProjectUtils(
      image: 'assets/projects/thetutor.png',
      title: "The Tutor",
      subtitle: 'React based web application which access the Best Online Tutors.',
      webLink: 'https://thetutor.me/'),
  ProjectUtils(
      image: 'assets/projects/varcity.png',
      title: "Varcity",
      subtitle: 'React based web application. Varcity is a trading simulator with real-time market data that helps traders at all levels.',
      webLink: 'https://varcity.io/'),
];
