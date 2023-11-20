
class InspirationsModel {
  String title;
  String location;
  String image;

  InspirationsModel({
    required this.title,
    required this.location,
    required this.image,
  });
  
  static List<InspirationsModel> getInspirations() {
    List<InspirationsModel> slides = [];
    
    slides.add(
      InspirationsModel(
        title: 'Mountain',
        location: 'Kigali, Rwanda',
        image: 'assets/travelling3.jpeg'
      )
    );

    slides.add(
      InspirationsModel(
        title: 'Everest',
        location: 'USA, New York',
        image: 'assets/travelling3.jpeg'
      )
    );

    slides.add(
      InspirationsModel(
        title: 'Nile',
        location: 'Egypt, Cairo',
        image: 'assets/mountain.jpeg'
      )
    );
  
    return slides;
  }
}