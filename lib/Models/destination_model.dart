
class DestinationModel{
  String name;
  String imgURL;
  String city;
  String country;
  double rating;
  String description;
  int price;

  DestinationModel(this.name,this.imgURL,this.city,this.country,this.description,this.rating,this.price);
}

String description = 'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.';

List<DestinationModel> mockDestinationList = [
  DestinationModel('Kuta Beach','assets/destination-images/Kuta-beach.png','Bali','Indonesai',description,4.2,15000),
  DestinationModel('Bagha Beach','assets/destination-images/baga-beach.png','Goa','India',description,4.8,12000),
];

List<DestinationModel> mockPackageList = [
  DestinationModel('Kuta Resort','assets/destination-images/Kuta-resort.png','Bali','Indonesai',description,3.7,15000),
  DestinationModel('Bagha Resort','assets/destination-images/baga-beach.png','Goa','India',description,4.6,16000),
];

