
class EmotionsModel {
  String title;
  String location;
  String image;

  EmotionsModel({
    required this.title,
    required this.location,
    required this.image,
  });
  
  static List<EmotionsModel> getEmotions() {
    List<EmotionsModel> slides = [];
    
    slides.add(
      EmotionsModel(
        title: 'Trips',
        location: 'Canada, Bariff',
        image: 'assets/travelling3.jpeg'
      )
    );

    slides.add(
      EmotionsModel(
        title: 'Everest',
        location: 'USA, New York',
        image: 'assets/mountain.jpeg'
      )
    );

    slides.add(
      EmotionsModel(
        title: 'Nile',
        location: 'Egypt, Cairo',
        image: 'assets/travelling2.jpg'
      )
    );
  
    return slides;
  }
}