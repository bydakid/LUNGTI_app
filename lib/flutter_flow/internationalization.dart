import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl', 'ms', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? tlText = '',
    String? msText = '',
    String? zh_HansText = '',
  }) =>
      [enText, tlText, msText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    '981aperz': {
      'en': 'Cutting food waste, one bite at a time!',
      'ms': 'Memotong sisa makanan, satu gigitan pada satu masa!',
      'tl': 'Pagputol ng basura ng pagkain, isang kagat sa isang pagkakataon!',
      'zh_Hans': '减少食物浪费，一次一小口！',
    },
    '0z9qhkg9': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'xfc3w343': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    'w9z3j1or': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'zk1pyx2f': {
      'en': 'Not yet',
      'ms': 'Belum lagi',
      'tl': 'Hindi pa',
      'zh_Hans': '还没有',
    },
    'ryh6eawk': {
      'en': ' m',
      'ms': 'm',
      'tl': 'm',
      'zh_Hans': '米',
    },
    'enkjftpx': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    '3sim7dwc': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    '7es1m6vh': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'ozth0yq0': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    'ccugrrqx': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'mhlivu51': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'dyjnz1zy': {
      'en': 'Nothing to save today, maybe tomorrow!',
      'ms': 'Tiada apa yang perlu disimpan hari ini, mungkin esok!',
      'tl': 'Walang ipon ngayon, baka bukas!',
      'zh_Hans': '今天没有什么可保存的，也许明天！',
    },
    'v8vshkhq': {
      'en':
          'Thanks for jumping into the action and giving food a second chance!',
      'ms':
          'Terima kasih kerana menyertai aksi dan memberi makanan peluang kedua!',
      'tl':
          'Salamat sa pagsali sa aksyon at pagbibigay ng pagkain ng pangalawang pagkakataon!',
      'zh_Hans': '感谢您积极参与并给食物第二次机会！',
    },
    'tscpuy6q': {
      'en':
          'As we move forward, we\'ll keep expanding and working with new stores.',
      'ms':
          'Semasa kami bergerak ke hadapan, kami akan terus berkembang dan bekerjasama dengan kedai baharu.',
      'tl':
          'Habang sumusulong kami, patuloy kaming magpapalawak at makikipagtulungan sa mga bagong tindahan.',
      'zh_Hans': '随着我们的前进，我们将继续扩张并与新商店合作。',
    },
    'h6vdi3gh': {
      'en': 'Stay up to date on everthing Lungti',
      'ms': 'Ikuti perkembangan terkini Lungti',
      'tl': 'Manatiling up to date sa everthing Lungti',
      'zh_Hans': '了解 Lungti 的最新动态',
    },
    'sr8ddq08': {
      'en': 'Current location',
      'ms': 'Lokasi sekarang',
      'tl': 'Kasalukuyang lokasyon',
      'zh_Hans': '当前位置',
    },
    'oswo8n6h': {
      'en': 'within 5 km',
      'ms': 'dalam 5 km',
      'tl': 'sa loob ng 5 km',
      'zh_Hans': '5公里以内',
    },
    'y9uujy4p': {
      'en': 'Verify email address',
      'ms': 'Sahkan alamat e-mel',
      'tl': 'Kumpirmahin ang Email Address',
      'zh_Hans': '确认电子邮件地址',
    },
    'drbgj8ss': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
  },
  // Profiel
  {
    'x2961uar': {
      'en': ' PHP',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '18arzt83': {
      'en': ' RM',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '2jb3sft4': {
      'en': ' S\$',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '8jl8oh74': {
      'en': 'saved',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'sajgw0nh': {
      'en': ' kg',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '0shcppru': {
      'en': 'food saved',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '38fqpn1s': {
      'en': ' kg',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '7bjac1b7': {
      'en': 'CO2e saved',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'j0aofh5p': {
      'en': 'Your orders',
      'ms': 'Pesanan anda',
      'tl': 'Mga utos mo',
      'zh_Hans': '你的命令',
    },
    'nb5gmvj4': {
      'en': 'Settings',
      'ms': 'tetapan',
      'tl': 'Mga setting',
      'zh_Hans': '设置',
    },
    '10wme1k5': {
      'en': 'Payment',
      'ms': 'Bayaran',
      'tl': 'Pagbabayad',
      'zh_Hans': '支付',
    },
    'xc5bnx48': {
      'en': 'Help',
      'ms': 'Tolong',
      'tl': 'Tulong',
      'zh_Hans': '帮助',
    },
    'fm49hv6h': {
      'en': 'Log Out',
      'ms': 'Log keluar',
      'tl': 'Log Out',
      'zh_Hans': '登出',
    },
    'vujn1g3j': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
  },
  // Map
  {
    'vq3551mj': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'ibmeb9fu': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    'nwdjs9z7': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    '756toxf2': {
      'en': ' m',
      'ms': 'm',
      'tl': 'm',
      'zh_Hans': '米',
    },
    '272l6akm': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    'poept7vj': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'kac3ml48': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    '3hd9h59f': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    'y64l8hg6': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'nkgy1dx1': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'u5nd6p4k': {
      'en': 'Nothing to save today, maybe tomorrow!',
      'ms': 'Tiada apa yang perlu disimpan hari ini, mungkin esok!',
      'tl': 'Walang ipon ngayon, baka bukas!',
      'zh_Hans': '今天没有什么可保存的，也许明天！',
    },
    '279oiqo5': {
      'en':
          'As we move forward, we\'ll keep expanding and working with new stores.',
      'ms':
          'Semasa kami bergerak ke hadapan, kami akan terus berkembang dan bekerjasama dengan kedai baharu.',
      'tl':
          'Habang sumusulong kami, patuloy kaming magpapalawak at makikipagtulungan sa mga bagong tindahan.',
      'zh_Hans': '随着我们的前进，我们将继续扩张并与新商店合作。',
    },
  },
  // Login
  {
    'dmha0z24': {
      'en': 'Welcome to Lungti.',
      'ms': 'Selamat datang ke Lungti.',
      'tl': 'Maligayang pagdating sa Lungti.',
      'zh_Hans': '欢迎来到隆蒂。',
    },
    'vf49izkb': {
      'en': 'An easy way to help the environment and save money!',
      'ms': 'Cara mudah untuk membantu alam sekitar dan menjimatkan wang!',
      'tl':
          'Isang madaling paraan upang matulungan ang kapaligiran at makatipid ng pera!',
      'zh_Hans': '保护环境和省钱的简单方法！',
    },
    'gl5dvgk3': {
      'en': 'Pay in the app & pick up',
      'ms': 'Bayar dalam apl & ambil',
      'tl': 'Magbayad sa app at kunin',
      'zh_Hans': '在应用程序中付款并领取',
    },
    '45f7u87s': {
      'en':
          'Pay in the app and pick up your food for takeout by showing your mobile order.',
      'ms':
          'Bayar dalam apl dan ambil makanan anda untuk dibawa pulang dengan menunjukkan pesanan mudah alih anda.',
      'tl':
          'Magbayad sa app at kunin ang iyong pagkain para sa takeout sa pamamagitan ng pagpapakita ng iyong order sa mobile.',
      'zh_Hans': '在应用程序中付款，然后出示您的手机订单即可领取外卖食品。',
    },
    '3m0bxkqv': {
      'en': 'Never miss a deal',
      'ms': 'Jangan sekali-kali terlepas perjanjian',
      'tl': 'Huwag kailanman palampasin ang isang deal',
      'zh_Hans': '不错过任何优惠',
    },
    'o28szr69': {
      'en':
          'Track your favorites in the app and receive alerts when they have food ready!',
      'ms':
          'Jejaki kegemaran anda dalam apl dan terima makluman apabila mereka menyediakan makanan!',
      'tl':
          'Subaybayan ang iyong mga paborito sa app at makatanggap ng mga alerto kapag may handa na silang pagkain!',
      'zh_Hans': '在应用程序中跟踪您最喜欢的食物，并在食物准备好时收到提醒！',
    },
    '2iu7i9gn': {
      'en': 'Sign with Apple',
      'ms': 'Tandatangan dengan Apple',
      'tl': 'Mag-sign gamit ang Apple',
      'zh_Hans': '与苹果签约',
    },
    'w2sh7u1r': {
      'en': 'Sign with Google',
      'ms': 'Tandatangan dengan Google',
      'tl': 'Mag-sign gamit ang Google',
      'zh_Hans': '与谷歌签约',
    },
    'f7b9v2li': {
      'en': 'Other',
      'ms': 'Tandatangan dengan Google',
      'tl': 'Mag-sign gamit ang Google',
      'zh_Hans': '与谷歌签约',
    },
    '089cpxy7': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Login_Country
  {
    'mj3jgocy': {
      'en': 'Let\'s get started',
      'ms': 'Mari kita mulakan',
      'tl': 'Magsimula na tayo',
      'zh_Hans': '让我们开始吧',
    },
    'azrr10kg': {
      'en': 'Username',
      'ms': 'Negara',
      'tl': 'Bansa',
      'zh_Hans': '国家',
    },
    '0tgtha61': {
      'en': '',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    'qbg151ez': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'ivu496kd': {
      'en': 'Country',
      'ms': 'Negara',
      'tl': 'Bansa',
      'zh_Hans': '国家',
    },
    'hb8djw9v': {
      'en': 'Philippines',
      'ms': 'Filipina',
      'tl': 'Pilipinas',
      'zh_Hans': '菲律宾',
    },
    'fx0jatp1': {
      'en': 'Malaysia',
      'ms': 'Malaysia',
      'tl': 'Malaysia',
      'zh_Hans': '马来西亚',
    },
    '378lzkna': {
      'en': 'Singapore',
      'ms': 'Singapura',
      'tl': 'Singapore',
      'zh_Hans': '新加坡',
    },
    '27tg44hd': {
      'en': '',
      'ms': 'Pilih negara',
      'tl': 'Piliin ang bansa',
      'zh_Hans': '选择国家',
    },
    '166lti9t': {
      'en': 'Search for an item...',
      'ms': 'Cari item...',
      'tl': 'Maghanap ng item...',
      'zh_Hans': '搜索一个项目...',
    },
    'xv005yzw': {
      'en': 'Language',
      'ms': 'Bahasa',
      'tl': 'Wika',
      'zh_Hans': '语言',
    },
    'v7byc6xv': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
    'qhgfpdiq': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Info
  {
    'dcitqej4': {
      'en': 'Explore',
      'ms': 'Meneroka',
      'tl': 'Galugarin',
      'zh_Hans': '探索',
    },
    'it2v1sov': {
      'en':
          'Lungti app welcomes you to explore and rescue Mystery Bags filled with surplus food from your local restaurants, cafes, and stores!',
      'ms':
          'Aplikasi Lungti mengalu-alukan anda untuk meneroka dan menyelamatkan Beg Misteri yang dipenuhi dengan lebihan makanan dari restoran, kafe dan kedai tempatan anda!',
      'tl':
          'Inaanyayahan ka ng Lungti app na tuklasin at iligtas ang mga Mystery Bag na puno ng sobrang pagkain mula sa iyong mga lokal na restaurant, cafe, at tindahan!',
      'zh_Hans': 'Lungti 应用程序欢迎您探索和拯救装满当地餐馆、咖啡馆和商店剩余食物的神秘袋子！',
    },
    'izhjnt7d': {
      'en': 'Reserve',
      'ms': 'Rizab',
      'tl': 'Reserve',
      'zh_Hans': '预订',
    },
    '0au6u6n8': {
      'en':
          'Discover a Mystery Bag you\'d love to rescue, then effortlessly reserve it within the app. Don\'t forget to note the designated pickup time – being right on time is key!',
      'ms':
          'Temui Beg Misteri yang anda ingin selamatkan, kemudian tempah dengan mudah dalam apl. Jangan lupa ambil perhatian masa pengambilan yang ditetapkan – menepati masa adalah kunci!',
      'tl':
          'Tumuklas ng Mystery Bag na gusto mong iligtas, pagkatapos ay i-reserve ito nang walang kahirap-hirap sa loob ng app. Huwag kalimutang tandaan ang itinalagang oras ng pagkuha – ang pagiging tama sa oras ay susi!',
      'zh_Hans': '发现您想要拯救的神秘包，然后在应用程序中轻松预订它。不要忘记记下指定的接送时间 - 准时是关键！',
    },
    '58ilsoqj': {
      'en': 'Collect',
      'ms': 'Kumpul',
      'tl': 'Mangolekta',
      'zh_Hans': '收集',
    },
    'ladwbjti': {
      'en':
          'Upon arriving at the store, effortlessly display your order details on the app. With a triumphant swipe, you will claim your Mystery Bag and contribute to the reducing of food waste.',
      'ms':
          'Apabila tiba di kedai, paparkan butiran pesanan anda pada apl dengan mudah. Dengan leretan yang berjaya, anda akan menuntut Beg Misteri anda dan menyumbang kepada pengurangan sisa makanan.',
      'tl':
          'Pagdating sa tindahan, walang kahirap-hirap na ipakita ang mga detalye ng iyong order sa app. Sa isang matagumpay na pag-swipe, kukunin mo ang iyong Mystery Bag at mag-aambag sa pagbawas ng basura ng pagkain.',
      'zh_Hans': '到达商店后，轻松在应用程序上显示您的订单详细信息。通过胜利的滑动，您将获得您的神秘袋并为减少食物浪费做出贡献。',
    },
    '6yk579dc': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
    '903wg8gf': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Email_check
  {
    'kmtuwzp8': {
      'en': 'Please check your email',
      'ms': 'Sila semak e-mel anda',
      'tl': 'Pakisuri ang iyong email',
      'zh_Hans': '请查看你的邮箱',
    },
    '5kgc3im6': {
      'en': 'We\'we sent the email to',
      'ms': 'Kami telah menghantar e-mel kepada',
      'tl': 'Ipinadala namin ang email sa',
      'zh_Hans': '我们已将电子邮件发送至',
    },
    '2ohf5ycd': {
      'en': 'email',
      'ms': 'emel',
      'tl': 'email',
      'zh_Hans': '电子邮件',
    },
    'xqeqgda2': {
      'en': 'Click the button in the email to verify your account.',
      'ms': 'Klik butang dalam e-mel untuk mengesahkan akaun anda.',
      'tl': 'I-click ang button sa email para i-verify ang iyong account.',
      'zh_Hans': '单击电子邮件中的按钮以验证您的帐户。',
    },
    '3q3gg32c': {
      'en': 'Didn\'t get an email yet?',
      'ms': 'Belum dapat e-mel lagi?',
      'tl': 'Hindi ka pa nakakatanggap ng email?',
      'zh_Hans': '还没有收到电子邮件吗？',
    },
    'lf6hpndx': {
      'en': 'Click here',
      'ms': 'Tekan di sini',
      'tl': 'Pindutin dito',
      'zh_Hans': '点击这里',
    },
    '4o17qvhx': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Support
  {
    'apnn8shh': {
      'en': 'Contact us',
      'ms': 'Hubungi Kami',
      'tl': 'Makipag-ugnayan sa amin',
      'zh_Hans': '联系我们',
    },
    'tbz5qoqg': {
      'en': 'Got a question or an issue?',
      'ms': 'Ada soalan atau isu?',
      'tl': 'May tanong o isyu?',
      'zh_Hans': '有疑问或问题吗？',
    },
    'aa0dax0o': {
      'en':
          'If you are having an issue or a question, fill out the message tab below to contact us. We will reply as soon as possible.',
      'ms':
          'Jika anda menghadapi masalah atau soalan, isi tab mesej di bawah untuk menghubungi kami. Kami akan membalas secepat mungkin.',
      'tl':
          'Kung nagkakaroon ka ng isyu o tanong, punan ang tab ng mensahe sa ibaba upang makipag-ugnayan sa amin. Kami ay tutugon sa lalong madaling panahon.',
      'zh_Hans': '如果您有问题或疑问，请填写下面的消息选项卡与我们联系。我们会尽快回复。',
    },
    'j4yr6isx': {
      'en': 'Message',
      'ms': 'Mesej',
      'tl': 'Mensahe',
      'zh_Hans': '信息',
    },
    'o6dd8t1c': {
      'en': 'Enter your message here',
      'ms': 'Masukkan mesej anda di sini',
      'tl': 'Ilagay ang iyong mensahe dito',
      'zh_Hans': '在此输入您的留言',
    },
    '5m6nm15j': {
      'en': 'Send',
      'ms': 'Hantar',
      'tl': 'Ipadala',
      'zh_Hans': '发送',
    },
    '4rxwutbc': {
      'en': '',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Legal
  {
    '9tx8jgv9': {
      'en': 'Legal',
      'ms': 'sah',
      'tl': 'Legal',
      'zh_Hans': '合法的',
    },
    'oq9m3mfd': {
      'en': 'Privacy Policy',
      'ms': 'Dasar Privasi',
      'tl': 'Patakaran sa Privacy',
      'zh_Hans': '隐私政策',
    },
    'uudyinjd': {
      'en': 'Terms and Conditions',
      'ms': 'Terma dan syarat',
      'tl': 'Mga Tuntunin at Kundisyon',
      'zh_Hans': '条款和条件',
    },
    'z9qh9vly': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Settings
  {
    '925z0vyv': {
      'en': 'Settings',
      'ms': 'tetapan',
      'tl': 'Mga setting',
      'zh_Hans': '设置',
    },
    'g9ldfgrc': {
      'en': 'Account Details',
      'ms': 'Butiran Akaun',
      'tl': 'Mga Detalye ng Account',
      'zh_Hans': '帐户详细资料',
    },
    'd5dl3ct0': {
      'en': '',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Account_details
  {
    'xzslsve3': {
      'en': 'Account Details',
      'ms': 'Butiran Akaun',
      'tl': 'Mga Detalye ng Account',
      'zh_Hans': '帐户详细资料',
    },
    'n85yocq9': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    '3n81b829': {
      'en': 'Language',
      'ms': 'Bahasa',
      'tl': 'Wika',
      'zh_Hans': '语言',
    },
    'fw6c6ek8': {
      'en': 'DELETE ACCOUNT',
      'ms': 'PADAM AKAUN',
      'tl': 'I-DELETE ANG ACCOUNT',
      'zh_Hans': '删除帐户',
    },
    'kyxt5ukl': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Orders
  {
    'as334bqw': {
      'en': 'Your Orders',
      'ms': 'Pesanan anda',
      'tl': 'Mga utos mo',
      'zh_Hans': '你的命令',
    },
    'wvf0dp64': {
      'en': 'Order Number: ',
      'ms': 'Nombor Pesanan:',
      'tl': 'Numero ng order:',
      'zh_Hans': '订单号：',
    },
    'cu5ivsnl': {
      'en': '#',
      'ms': '#',
      'tl': '#',
      'zh_Hans': '#',
    },
    'a2iv97e2': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    '8g6948m8': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'o7qfif2c': {
      'en': 'Order Picked Up:',
      'ms': 'Pesanan Diambil:',
      'tl': 'Nakuha ang Order:',
      'zh_Hans': '订单已取：',
    },
    'nys47kko': {
      'en': 'YES',
      'ms': 'YA',
      'tl': 'OO',
      'zh_Hans': '是的',
    },
    'ctr32qe3': {
      'en': 'Looking a bit empty here?',
      'ms': 'Nampak kosong sikit kat sini?',
      'tl': 'Mukhang walang laman dito?',
      'zh_Hans': '这里看起来有点空虚？',
    },
    '3qrhri7s': {
      'en': 'Let\'s find a Bag for you to rescue!',
      'ms': 'Mari cari Beg untuk anda selamatkan!',
      'tl': 'Maghanap tayo ng Bag para iligtas mo!',
      'zh_Hans': '让我们找到一个包来拯救你！',
    },
    '7jvh5wfc': {
      'en': 'Find a Bag',
      'ms': 'Cari Beg',
      'tl': 'Maghanap ng Bag',
      'zh_Hans': '寻找包袋',
    },
    'e3i25s40': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // store_info
  {
    'dcs4yah0': {
      'en': 'What\'s in the bag?',
      'ms': 'Apa yang ada dalam beg itu?',
      'tl': 'Anong meron sa bag?',
      'zh_Hans': '包里面有什么？',
    },
    'swkngvfh': {
      'en': 'What\' you need to know',
      'ms': 'Apa yang anda perlu tahu',
      'tl': 'Anong kailangan mong malaman',
      'zh_Hans': '你需要知道什么',
    },
    'cucgvxsv': {
      'en':
          'The store will provide packaging for your food, but we encourage you to bring your own bag to carry it home in.',
      'ms':
          'Kedai akan menyediakan pembungkusan untuk makanan anda, tetapi kami menggalakkan anda membawa beg anda sendiri untuk membawanya pulang.',
      'tl':
          'Magbibigay ang tindahan ng packaging para sa iyong pagkain, ngunit hinihikayat ka naming magdala ng sarili mong bag para dalhin ito pauwi.',
      'zh_Hans': '商店将为您的食物提供包装，但我们鼓励您自带袋子将其带回家。',
    },
    'ey2fw7z3': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    '7dpnodzv': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    'cext38ni': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'a3t4jcqk': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    '7c03jp07': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    '6wc6nhb2': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'evc3h5zl': {
      'en': 'PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    '5m9flmh3': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'i3f5xgfa': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'ens81chl': {
      'en': 'Reserve',
      'ms': 'Rizab',
      'tl': 'Reserve',
      'zh_Hans': '预订',
    },
    'iq458off': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Forgot_password
  {
    'o1xir78u': {
      'en': 'Forgot Password',
      'ms': 'Lupa kata laluan',
      'tl': 'Nakalimutan ang password',
      'zh_Hans': '忘记密码',
    },
    'pmvmr1xn': {
      'en':
          'We will provide you with a link to reset your password through email. Kindly enter the email associated with your account below, and proceed to your email inbox to initiate the password reset process.',
      'ms':
          'Kami akan memberikan anda pautan untuk menetapkan semula kata laluan anda melalui e-mel. Sila masukkan e-mel yang dikaitkan dengan akaun anda di bawah, dan teruskan ke peti masuk e-mel anda untuk memulakan proses penetapan semula kata laluan.',
      'tl':
          'Bibigyan ka namin ng link para i-reset ang iyong password sa pamamagitan ng email. Mangyaring ilagay ang email na nauugnay sa iyong account sa ibaba, at magpatuloy sa iyong email inbox upang simulan ang proseso ng pag-reset ng password.',
      'zh_Hans':
          '我们将通过电子邮件向您提供重置密码的链接。请在下面输入与您的帐户关联的电子邮件，然后前往您的电子邮件收件箱启动密码重置过程。',
    },
    '9mshtonn': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    '96fhtq1p': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    'hqlfguol': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
    'rmsx8f3r': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // order_collected
  {
    'qmu4m33l': {
      'en': 'THANK YOU !',
      'ms': 'TERIMA KASIH !',
      'tl': 'SALAMAT !',
      'zh_Hans': '谢谢 ！',
    },
    'l031b4y5': {
      'en': 'YOU JUST SAVED A MEAL FROM BEING WASTED',
      'ms': 'ANDA BARU MENYIMPAN MAKAN DARIPADA DIBAZIR',
      'tl': 'NAG-IPON KA LANG NG PAGKAIN PARA MASASAYANG',
      'zh_Hans': '您刚刚避免了浪费一顿饭',
    },
    '165anqmo': {
      'en': 'Celebrate with your friends and start saving together.\n\n#lungti',
      'ms':
          'Raikan dengan rakan anda dan mulakan menabung bersama-sama.\n\n#lungti',
      'tl':
          'Magdiwang kasama ang iyong mga kaibigan at magsimulang mag-ipon nang sama-sama.\n\n#lungti',
      'zh_Hans': '与您的朋友一起庆祝并开始一起储蓄。\n\n#隆蒂',
    },
    'l7rsx96u': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Payment
  {
    'lj1cmh5q': {
      'en': 'Lungti Pay',
      'ms': 'Lungti Pay',
      'tl': 'Lungti Pay',
      'zh_Hans': '隆蒂佩',
    },
    'z2niklrd': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'i76ygt3s': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'bi5d2ezs': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    '612w4j5s': {
      'en': 'Preload funds and save time with Lungti Pay',
      'ms': 'Pramuat dana dan jimat masa dengan Lungti Pay',
      'tl': 'Mag-preload ng mga pondo at makatipid ng oras sa Lungti Pay',
      'zh_Hans': '使用 Lungti Pay 预存资金并节省时间',
    },
    '3za8q7x5': {
      'en': 'Top Up:',
      'ms': 'Tambah nilai:',
      'tl': 'Top Up:',
      'zh_Hans': '充值：',
    },
    '7x5lj3qv': {
      'en': '300 PHP',
      'ms': '300 PHP',
      'tl': '300 PHP',
      'zh_Hans': '300 菲律宾比索',
    },
    '9m38fsw7': {
      'en': '500 PHP',
      'ms': '500 PHP',
      'tl': '500 PHP',
      'zh_Hans': '500 菲律宾比索',
    },
    '3m7xisus': {
      'en': '1000 PHP',
      'ms': '1000 PHP',
      'tl': '1000 PHP',
      'zh_Hans': '1000 菲律宾比索',
    },
    'mrh5zijy': {
      'en': '10 S\$',
      'ms': '10 S\$',
      'tl': '10 S\$',
      'zh_Hans': '10 新元',
    },
    'o6r8i4cy': {
      'en': '20 S\$',
      'ms': '20 S\$',
      'tl': '20 S\$',
      'zh_Hans': '20 新元',
    },
    'r5u9w751': {
      'en': '50 S\$',
      'ms': '50 S\$',
      'tl': '50 S\$',
      'zh_Hans': '50 新元',
    },
    'tmxc1buy': {
      'en': '30 RM',
      'ms': '30 RM',
      'tl': '30 RM',
      'zh_Hans': '30 令吉',
    },
    'q19az8f2': {
      'en': '50 RM',
      'ms': '50 RM',
      'tl': '50 RM',
      'zh_Hans': '50 令吉',
    },
    'qb1d98do': {
      'en': '100 RM',
      'ms': '100 RM',
      'tl': '100 RM',
      'zh_Hans': '100 令吉',
    },
    'r4s7sh2d': {
      'en': 'Add Funds',
      'ms': 'Tambah dana',
      'tl': 'Magdagdag ng mga Pondo',
      'zh_Hans': '增加资金',
    },
    'ayd4ndcq': {
      'en': 'Add Funds',
      'ms': 'Tambah dana',
      'tl': 'Magdagdag ng mga Pondo',
      'zh_Hans': '增加资金',
    },
    'gy8ome6v': {
      'en': 'Add Funds',
      'ms': 'Tambah dana',
      'tl': 'Magdagdag ng mga Pondo',
      'zh_Hans': '增加资金',
    },
    'zxu0k217': {
      'en': '',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Login_mail
  {
    'snlelfck': {
      'en': 'Let\'s get started',
      'ms': 'Mari kita mulakan',
      'tl': 'Magsimula na tayo',
      'zh_Hans': '让我们开始吧',
    },
    'pvu4iewc': {
      'en': 'Username',
      'ms': 'Negara',
      'tl': 'Bansa',
      'zh_Hans': '国家',
    },
    '8fu8874z': {
      'en': '',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    '22plvxcj': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'dnbkfr9h': {
      'en': '',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    'n3idoc2q': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'nqzfv84y': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
    'd4wd80qk': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Policy_bottom
  {
    'kh1swl77': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    '635dv1bb': {
      'en': 'Terms & Conditions.',
      'ms': 'Terma & Syarat.',
      'tl': 'Mga Tuntunin at Kundisyon.',
      'zh_Hans': '条款和条件。',
    },
    '1hgkml4l': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    '7h6c7owh': {
      'en': 'Privacy Pocily.',
      'ms': 'Polisi Privasi.',
      'tl': 'Patakaran sa Privacy.',
      'zh_Hans': '隐私政策。',
    },
    'ruyhutj1': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
  },
  // Need_to_know
  {
    'ajjg7g5n': {
      'en': 'To keep in mind',
      'ms': 'Untuk diingati',
      'tl': 'Ilagay sa isip',
      'zh_Hans': '要牢记',
    },
    'ogrq8u6z': {
      'en': 'Mystery Bag',
      'ms': 'Beg Misteri',
      'tl': 'Misteryo Bag',
      'zh_Hans': '神秘袋',
    },
    'b0cxnv4y': {
      'en':
          'While we\'d love to provide an exact preview of your mystery bag contents, the thrill lies in its unpredictability! Packed with an assortment of unsold items, handpicked by the store. If you have inquiries about specific ingredients, feel free to inquire on the site.',
      'ms':
          'Walaupun kami ingin memberikan pratonton tepat kandungan beg misteri anda, keseronokan terletak pada ketidakpastiannya! Dikemas dengan pelbagai jenis barang yang tidak terjual, dipilih sendiri oleh kedai. Jika anda mempunyai pertanyaan tentang bahan-bahan tertentu, jangan ragu untuk bertanya di laman web ini.',
      'tl':
          'Bagama\'t gusto naming magbigay ng eksaktong preview ng mga nilalaman ng iyong misteryong bag, ang kilig ay nakasalalay sa hindi mahuhulaan nito! Naka-pack na may iba\'t ibang hindi nabentang item, pinili ng tindahan. Kung mayroon kang mga katanungan tungkol sa mga partikular na sangkap, huwag mag-atubiling magtanong sa site.',
      'zh_Hans':
          '虽然我们很乐意为您提供神秘袋内容的准确预览，但刺激之处在于它的不可预测性！里面装满了商店精心挑选的各种未售出商品。如果您对具体成分有疑问，请随时在网站上查询。',
    },
    '1u5jddul': {
      'en': 'Got it!',
      'ms': 'faham!',
      'tl': 'Nakuha ko!',
      'zh_Hans': '知道了！',
    },
    'jg4smygc': {
      'en': 'Go back',
      'ms': 'Pergi balik',
      'tl': 'Bumalik ka',
      'zh_Hans': '回去',
    },
  },
  // Payment_tab
  {
    '2l8lntgg': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    '7lmy1p1e': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'peq39l92': {
      'en': 'Quantity',
      'ms': 'Kuantiti',
      'tl': 'Dami',
      'zh_Hans': '数量',
    },
    '96hxxtyz': {
      'en': 'By reserving this meal you agree to Lungti',
      'ms': 'Dengan menempah makanan ini anda bersetuju dengan Lungti',
      'tl':
          'Sa pamamagitan ng pagreserba ng pagkain na ito sumasang-ayon ka sa Lungti',
      'zh_Hans': '预订此餐即表示您同意 Lungti',
    },
    'x7nhbtno': {
      'en': 'Terms and Conditions',
      'ms': 'Terma dan syarat',
      'tl': 'Mga Tuntunin at Kundisyon',
      'zh_Hans': '条款和条件',
    },
    'eamqlcqb': {
      'en': 'Total',
      'ms': 'Jumlah',
      'tl': 'Kabuuan',
      'zh_Hans': '全部的',
    },
    '1it3v9dv': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    '45j2sx9q': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'tyuovgo2': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    '4qwk1bkx': {
      'en': 'Payment Method',
      'ms': 'Kaedah Pembayaran',
      'tl': 'Paraan ng Pagbayad',
      'zh_Hans': '付款方式',
    },
    'xlhs6xea': {
      'en': 'Lungti Pay',
      'ms': 'Lungti Pay',
      'tl': 'Lungti Pay',
      'zh_Hans': '隆蒂佩',
    },
    'etqsf4xg': {
      'en': 'Lungti Pay',
      'ms': 'Lungti Pay',
      'tl': 'Lungti Pay',
      'zh_Hans': '隆蒂佩',
    },
    '06k6r1hh': {
      'en': 'Lungti Pay',
      'ms': 'Lungti Pay',
      'tl': 'Lungti Pay',
      'zh_Hans': '隆蒂佩',
    },
    'mf10juoq': {
      'en': 'Credit/Debit Card ',
      'ms': 'Kad Kredit/Debit',
      'tl': 'Credit/Debit Card',
      'zh_Hans': '信用卡/借记卡',
    },
    '3nrupc06': {
      'en': 'Credit/Debit Card ',
      'ms': 'Kad Kredit/Debit',
      'tl': 'Credit/Debit Card',
      'zh_Hans': '信用卡/借记卡',
    },
    'ho90zezz': {
      'en': 'Credit/Debit Card ',
      'ms': 'Kad Kredit/Debit',
      'tl': 'Credit/Debit Card',
      'zh_Hans': '信用卡/借记卡',
    },
  },
  // order_confirmation
  {
    'ha0dheaz': {
      'en': 'Succes!',
      'ms': 'Berjaya!',
      'tl': 'Tagumpay!',
      'zh_Hans': '成功了！',
    },
    'oc9y2egm': {
      'en':
          'Your mystery bag order is locked in! Swing by the store at the set pickup time and don\'t forget to present your order number to the store staff. Get ready to uncover the mystery!',
      'ms':
          'Tempahan beg misteri anda telah dikunci! Berbuai ke kedai pada waktu pengambilan yang ditetapkan dan jangan lupa tunjukkan nombor pesanan anda kepada kakitangan kedai. Bersedia untuk membongkar misteri!',
      'tl':
          'Naka-lock ang order mong mystery bag! Dumuyan sa tindahan sa itinakdang oras ng pagkuha at huwag kalimutang ipakita ang iyong numero ng order sa kawani ng tindahan. Humanda upang matuklasan ang misteryo!',
      'zh_Hans': '您的神秘袋订单已锁定！在设定的取货时间前往商店，不要忘记向商店工作人员出示您的订单号。准备好揭开谜底吧！',
    },
    'mk1el5j0': {
      'en': 'Order Number:',
      'ms': 'Nombor Pesanan:',
      'tl': 'Numero ng order:',
      'zh_Hans': '订单号：',
    },
    'iys9g485': {
      'en': '#',
      'ms': '#',
      'tl': '#',
      'zh_Hans': '#',
    },
    'fji1e0b1': {
      'en': 'Pick Up Time:',
      'ms': 'Masa Ambil:',
      'tl': 'Oras ng pagkuha:',
      'zh_Hans': '接载时间：',
    },
    'vc01ylpt': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'tjl1tdy5': {
      'en': 'Track Order',
      'ms': 'Susunan Jejak',
      'tl': 'Subaybayan ang Order',
      'zh_Hans': '追踪订单',
    },
  },
  // search_tab
  {
    'kds5ukso': {
      'en': 'Search Store',
      'ms': 'Kedai Carian',
      'tl': 'Search Store',
      'zh_Hans': '搜索商店',
    },
    'l8dgeseu': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    '9dc1telt': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    'c1est1cd': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'j8n2biwg': {
      'en': 'No',
      'ms': 'Tidak',
      'tl': 'Hindi',
      'zh_Hans': '不',
    },
    'ptvmth8i': {
      'en': ' m',
      'ms': 'm',
      'tl': 'm',
      'zh_Hans': '米',
    },
    'wy74dh0b': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    'gqojzy7o': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    'h6np6eue': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    'v2h78mkq': {
      'en': ' PHP',
      'ms': 'PHP',
      'tl': 'PHP',
      'zh_Hans': 'PHP',
    },
    'dnnwm4mk': {
      'en': ' S\$',
      'ms': 'S\$',
      'tl': 'S\$',
      'zh_Hans': '新元',
    },
    '9bj4kwb1': {
      'en': ' RM',
      'ms': 'RM',
      'tl': 'RM',
      'zh_Hans': 'R M',
    },
    '98ojdi0e': {
      'en': 'Nothing to save today, maybe tomorrow!',
      'ms': 'Tiada apa yang perlu disimpan hari ini, mungkin esok!',
      'tl': 'Walang ipon ngayon, baka bukas!',
      'zh_Hans': '今天没有什么可保存的，也许明天！',
    },
  },
  // Miscellaneous
  {
    'w138z658': {
      'en':
          ' In order to search stores nearby, this app requires acces to your current location.',
      'ms':
          'Untuk mencari kedai berdekatan, apl ini memerlukan akses ke lokasi semasa anda.',
      'tl':
          'Upang maghanap ng mga tindahan sa malapit, ang app na ito ay nangangailangan ng access sa iyong kasalukuyang lokasyon.',
      'zh_Hans': '为了搜索附近的商店，此应用程序需要访问您当前的位置。',
    },
    'xb354glg': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'ms':
          'Untuk mengambil gambar atau video, aplikasi ini memerlukan kebenaran untuk mengakses kamera.',
      'tl':
          'Upang kumuha ng larawan o video, ang app na ito ay nangangailangan ng pahintulot na ma-access ang camera.',
      'zh_Hans': '为了拍摄照片或视频，此应用程序需要访问相机的权限。',
    },
    'yuff14dj': {
      'en':
          'To upload photos, please grant the app access to your photos in Settings.',
      'ms':
          'Untuk memuat naik foto, sila berikan apl akses kepada foto anda dalam Tetapan.',
      'tl':
          'Upang mag-upload ng mga larawan, mangyaring bigyan ang app ng access sa iyong mga larawan sa Mga Setting.',
      'zh_Hans': '要上传照片，请在“设置”中授予应用程序访问您照片的权限。',
    },
    'jcs2ooyr': {
      'en':
          'Get notified about availability, feature updates, promotions, and more.',
      'ms':
          'Dapatkan pemberitahuan tentang ketersediaan, kemas kini ciri, promosi dan banyak lagi.',
      'tl':
          'Maabisuhan tungkol sa availability, mga update sa feature, mga promosyon, at higit pa.',
      'zh_Hans': '获取有关可用性、功能更新、促销等信息的通知。',
    },
    'owm3xjgc': {
      'en':
          'In order to search stores nearby, this app requires acces to your current location.',
      'ms':
          'Untuk mencari kedai berdekatan, apl ini memerlukan akses ke lokasi semasa anda.',
      'tl':
          'Upang maghanap ng mga tindahan sa malapit, ang app na ito ay nangangailangan ng access sa iyong kasalukuyang lokasyon.',
      'zh_Hans': '为了搜索附近的商店，此应用程序需要访问您当前的位置。',
    },
    'klhrhf9b': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'u3ih4lld': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'lkdt1bsp': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'peotsp07': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'm6q2u3a8': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'o6aon7kn': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'b0doh5vi': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'wy3a2wu9': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'yv698lm2': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '53p6y87l': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '85tydgkb': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'sjwnxp6z': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '2hlj2u4j': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    's3blsatn': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'xacmf9b8': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'w9st2x83': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'jjtupz97': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'zjrwv7yt': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'in6hun8i': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'pzu224nf': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'nfow688b': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'ilyrctg2': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '5e0q19ln': {
      'en': '',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
