import 'package:get/get.dart';

class ApplicationLocal implements Translations {
  @override

  // keys mean keys of languages which simply consist of :

  /**
   * 
   */
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'EARNED': 'مكسب',
          'SAVED CO2': 'حفظ Co2',
          'RECYCLED': "اعيد تدويره",
          'Plastic': 'بلاستيك',
          'Glass': 'زجاج',
          'Paper': 'ورق',
          'Eco-friendly tips': 'طرق للحفاظ علي البيئه',
          'View All': 'اظهر الكل',
        },
        'en': {
          'EARNED': 'earned',
          'SAVED CO2': 'saved co2',
          'RECYCLED': "recycled",
          'Plastic': 'plastic',
          'Glass': 'glass',
          'Paper': 'paper',
          'Eco-friendly tips': 'eco-friendly tips',
          'View All': 'view all',
        }
      };
}
