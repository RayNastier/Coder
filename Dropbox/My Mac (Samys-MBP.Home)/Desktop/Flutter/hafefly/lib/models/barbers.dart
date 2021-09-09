class Barber {
  Barber({
    required this.firstName,
    required this.lastName,
    required this.experience,
    required this.phoneNumber,
    required this.bio,
    required this.rating,
    required this.workingHours,
    required this.latitude,
    required this.longitude,
    required this.instagram
  });
  String firstName;
  String lastName;
  int experience;
  double rating;
  String instagram;
  String bio;
  double latitude;
  double longitude;
  String phoneNumber;
  String workingHours;
}

List<Barber> barbers = [
  Barber(
      firstName: 'salah',
      lastName: 'messoud',
      bio: 'time to fresh up your self',
      rating: 4.5,
      workingHours: '8:30 => 18:30',
      experience: 3,
      phoneNumber: '0554343567',
      latitude: 32.09332,
      longitude: 36.3223, 
      instagram: 'salahMessoud'),
  Barber(
      firstName: 'kamal',
      lastName: 'rabah',
      bio: 'help me help your hair',
      rating: 3.9,
      workingHours: '9:30 => 19:30',
      experience: 2,
      phoneNumber: '0654768798',
      latitude: 32.09332,
      longitude: 36.3223,
      instagram: 'x_kamal_rabah_x'),
  Barber(
      firstName: 'aissa',
      lastName: 'mefti',
      bio: 'your barber is your hero',
      rating: 4.6,
      workingHours: '10:30 => 20:30',
      experience: 5,
      phoneNumber: '0665342389',
      latitude: 32.09332,
      longitude: 36.3223,
      instagram: 'mft_aissa'),
  Barber(
      firstName: 'mensouh',
      lastName: 'larba',
      bio: 'i\'ll do it for you',
      rating: 4.0,
      workingHours: '8:00 => 20:30',
      experience: 3,
      phoneNumber: '0775449878',
      latitude: 32.09332,
      longitude: 36.3223,
      instagram: 'men.s_larba'),
];
