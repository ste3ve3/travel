
class WelcomeModel {
  String title;
  String subTitle;
  String description;
  String bgImage;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.bgImage,
  });
  
  static List<WelcomeModel> getSlides() {
    List<WelcomeModel> slides = [];
    
    slides.add(
      WelcomeModel(
        title: 'Trips',
        subTitle: 'Mountain',
        description: "Mountian hikes gives you an incredible sense of freedom along with endurance tests",
        bgImage: 'assets/welcome-one.png'
      )
    );

    slides.add(
      WelcomeModel(
        title: 'Everest',
        subTitle: 'Forest',
        description: "Mountian hikes gives you an incredible sense of freedom along with endurance tests",
        bgImage: 'assets/welcome-two.png'
      )
    );

    slides.add(
      WelcomeModel(
        title: 'Nile',
        subTitle: 'River',
        description: "Mountian hikes gives you an incredible sense of freedom along with endurance tests",
        bgImage: 'assets/welcome-three.png'
      )
    );
  
    return slides;
  }
}