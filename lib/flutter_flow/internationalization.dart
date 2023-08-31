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
      'en': 'Cutting food waste, one bite at a time!!',
      'ms': 'Memotong sisa makanan, satu gigitan pada satu masa!',
      'tl': 'Pagputol ng basura ng pagkain, isang kagat sa isang pagkakataon!',
      'zh_Hans': '减少食物浪费，一次一小口！',
    },
    '6lp2afxo': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'f0ywfzlj': {
      'en': 'Collect today at ',
      'ms': 'Kumpul hari ini di',
      'tl': 'Kolektahin ngayon sa',
      'zh_Hans': '今天收集于',
    },
    '7mif1oce': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
    },
    'ktqkxqcx': {
      'en': 'No ratings',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'xy56cl50': {
      'en': ' m',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '6rxngowv': {
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
      'en': 'Stay up to date on everthing Lungti, follow us on Instagram.',
      'ms': 'Ikuti perkembangan terkini Lungti, ikuti kami di Instagram.',
      'tl':
          'Manatiling up to date sa everthing Lungti, sundan kami sa Instagram.',
      'zh_Hans': '了解 Lungti 的最新动态，请在 Instagram 上关注我们。',
    },
    'sr8ddq08': {
      'en': 'Your current location',
      'ms': 'Manila',
      'tl': 'Maynila',
      'zh_Hans': '马尼拉',
    },
    'oswo8n6h': {
      'en': 'within 5 km',
      'ms': 'Manila',
      'tl': 'Maynila',
      'zh_Hans': '马尼拉',
    },
    '94b5gxob': {
      'en': 'Search Store',
      'ms': 'Cari',
      'tl': 'Maghanap',
      'zh_Hans': '搜索',
    },
    'y9uujy4p': {
      'en': 'Verify email address',
      'ms': 'Mengesahkan alamat e-mel anda',
      'tl': 'I-verify ang iyong email address',
      'zh_Hans': '确认你的邮件地址',
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
    '0li1frds': {
      'en': 'YOUR IMPACT',
      'ms': 'IMPAK ANDA',
      'tl': 'IYONG EPEKTO',
      'zh_Hans': '您的影响',
    },
    'houi5aae': {
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
      'ms': 'Tolong',
      'tl': 'Tulong',
      'zh_Hans': '帮助',
    },
    'w2jfuxb3': {
      'en': 'Help',
      'ms': 'Tolong',
      'tl': 'Tulong',
      'zh_Hans': '帮助',
    },
    'am8pth0v': {
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
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'u5nd6p4k': {
      'en': 'Nothing to save today, maybe tomorrow!',
      'ms': 'Tiada apa yang perlu disimpan hari ini, mungkin esok!',
      'tl': 'Walang ipon ngayon, baka bukas!',
      'zh_Hans': '今天没有什么可保存的，也许明天！',
    },
  },
  // Login
  {
    '2iu7i9gn': {
      'en': 'Continue with Apple',
      'ms': 'Teruskan dengan Apple',
      'tl': 'Magpatuloy sa Apple',
      'zh_Hans': '继续使用苹果',
    },
    'w2sh7u1r': {
      'en': 'Continue with Google',
      'ms': 'Teruskan dengan Google',
      'tl': 'Magpatuloy sa Google',
      'zh_Hans': '继续使用谷歌',
    },
    'sqyjl70f': {
      'en': 'Continue with email',
      'ms': 'Teruskan dengan e-mel',
      'tl': 'Magpatuloy sa email',
      'zh_Hans': '继续使用电子邮件',
    },
    'dmha0z24': {
      'en': 'Let\'s get started saving food!',
      'ms': 'Mari kita mulakan\nmenjimatkan makanan!',
      'tl': 'Magsimula na tayo\nnagtitipid ng pagkain!',
      'zh_Hans': '让我们开始吧\n节约粮食！',
    },
    'bwxh28zt': {
      'en': 'Lungti',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'rln0w5ec': {
      'en': 'Use the app for a better user experience',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'u4pnh44v': {
      'en': 'Apple',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'blpr3ae5': {
      'en': 'Android',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '089cpxy7': {
      'en': 'Home',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Login_email
  {
    'sdziqe2w': {
      'en': 'Let\'s get started',
      'ms': 'Mari kita mulakan',
      'tl': 'Magsimula na tayo',
      'zh_Hans': '让我们开始吧',
    },
    'ikvq3b1a': {
      'en': 'Login',
      'ms': 'Log masuk',
      'tl': 'Mag log in',
      'zh_Hans': '登录',
    },
    'yaixhhzn': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    'xew9rs3t': {
      'en': 'Password',
      'ms': 'Kata laluan',
      'tl': 'Password',
      'zh_Hans': '密码',
    },
    'rn6bj11r': {
      'en': 'Log in',
      'ms': 'Log masuk',
      'tl': 'Mag log in',
      'zh_Hans': '登录',
    },
    '28z8iehg': {
      'en': 'Forgot Password',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'yg0fv3s6': {
      'en': 'Register',
      'ms': 'Daftar',
      'tl': 'Magrehistro',
      'zh_Hans': '登记',
    },
    'musdow4m': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
    },
    'v48tu0cg': {
      'en': 'Password',
      'ms': 'Kata laluan',
      'tl': 'Password',
      'zh_Hans': '密码',
    },
    '9xsfcgsv': {
      'en': 'Confirm Password',
      'ms': 'Sahkan Kata Laluan',
      'tl': 'Kumpirmahin ang Password',
      'zh_Hans': '确认密码',
    },
    '2h7ljox5': {
      'en': 'Register',
      'ms': 'Daftar',
      'tl': 'Magrehistro',
      'zh_Hans': '登记',
    },
    'yxj56f3q': {
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
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '27tg44hd': {
      'en': 'Choose Country',
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
      'zh_Hans': '发现您想要拯救的神秘包，然后在应用程序中轻松预订它。不要忘记记下指定的接载时间 - 准时是关键！',
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
    '3m0rnnm1': {
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
    'rb01rupb': {
      'en': 'Email',
      'ms': 'E-mel',
      'tl': 'Email',
      'zh_Hans': '电子邮件',
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
      'ms': '',
      'tl': '',
      'zh_Hans': '',
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
      'zh_Hans': '这里看起来有点空？',
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
      'zh_Hans': '今天收集在',
    },
    'cext38ni': {
      'en': ' - ',
      'ms': '-',
      'tl': '-',
      'zh_Hans': '-',
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
      'ms': 'Mari kita mulakan',
      'tl': 'Magsimula na tayo',
      'zh_Hans': '让我们开始吧',
    },
    'pmvmr1xn': {
      'en':
          'We will provide you with a link to reset your password through email. Kindly enter the email associated with your account below, and proceed to your email inbox to initiate the password reset process.',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
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
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'l031b4y5': {
      'en': 'YOU JUST SAVED A MEAL FROM BEING WASTED',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '165anqmo': {
      'en': 'Celebrate with your friends and start saving together.\n\n#lungti',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'l7rsx96u': {
      'en': 'Home',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
  },
  // Payment
  {
    'lj1cmh5q': {
      'en': 'Lungti Pay',
      'ms': 'tetapan',
      'tl': 'Mga setting',
      'zh_Hans': '设置',
    },
    '612w4j5s': {
      'en': 'Preload funds and save time with Lungti Pay',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '3za8q7x5': {
      'en': 'Top Up:',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '7x5lj3qv': {
      'en': '300 PHP',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '9m38fsw7': {
      'en': '500 PHP',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    '3m7xisus': {
      'en': '1000 PHP',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'mrh5zijy': {
      'en': '10 S\$',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'o6r8i4cy': {
      'en': '20 S\$',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'r5u9w751': {
      'en': '50 S\$',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'tmxc1buy': {
      'en': '30 RM',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'q19az8f2': {
      'en': '50 RM',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'qb1d98do': {
      'en': '100 RM',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'r4s7sh2d': {
      'en': 'Add Funds',
      'ms': 'Hantar',
      'tl': 'Ipadala',
      'zh_Hans': '发送',
    },
    'ayd4ndcq': {
      'en': 'Add Funds',
      'ms': 'Hantar',
      'tl': 'Ipadala',
      'zh_Hans': '发送',
    },
    'gy8ome6v': {
      'en': 'Add Funds',
      'ms': 'Hantar',
      'tl': 'Ipadala',
      'zh_Hans': '发送',
    },
    'zxu0k217': {
      'en': '',
      'ms': 'Rumah',
      'tl': 'Bahay',
      'zh_Hans': '家',
    },
  },
  // Policy_bottom
  {
    'ewesi2ar': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    'baohpjid': {
      'en': 'Terms & Conditions.',
      'ms': 'Terma & Syarat.',
      'tl': 'Mga Tuntunin at Kundisyon.',
      'zh_Hans': '条款和条件。',
    },
    '7c5wxbr2': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    'va9axx89': {
      'en': 'Privacy Pocily.',
      'ms': 'Polisi Privasi.',
      'tl': 'Patakaran sa Privacy.',
      'zh_Hans': '隐私政策。',
    },
    'gqkzxeds': {
      'en': 'Continue',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
    },
  },
  // Policy_bottom_apple
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
  // Policy_bottom_google
  {
    '0jzcczce': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    'dx04ttg9': {
      'en': 'Terms & Conditions.',
      'ms': 'Terma & Syarat.',
      'tl': 'Mga Tuntunin at Kundisyon.',
      'zh_Hans': '条款和条件。',
    },
    'eei0799x': {
      'en': 'I accept the ',
      'ms': 'Saya menerima',
      'tl': 'Tinatanggap ko ang',
      'zh_Hans': '我接受',
    },
    'zsvlrdy5': {
      'en': 'Privacy Pocily.',
      'ms': 'Polisi Privasi.',
      'tl': 'Patakaran sa Privacy.',
      'zh_Hans': '隐私政策。',
    },
    '6sm7a38s': {
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
      'ms': 'Apa yang anda perlu tahu',
      'tl': 'Anong kailangan mong malaman',
      'zh_Hans': '你需要知道什么',
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
          'Walaupun kami ingin memberikan pratonton tepat kandungan beg misteri anda, keseronokan terletak pada ketidakpastian! Dikemas dengan pelbagai jenis barang yang tidak terjual, dipilih sendiri oleh kedai. Jika anda mempunyai pertanyaan tentang bahan-bahan tertentu, jangan ragu untuk bertanya di tapak.',
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
      'zh_Hans': '今天收集在',
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
      'ms': 'Dengan menempah hidangan ini anda bersetuju menerima Lungti Food',
      'tl':
          'Sa pamamagitan ng pagreserba ng pagkain na ito sumasang-ayon ka sa Lungti Food',
      'zh_Hans': '预订此餐即表示您同意 Lungti Food',
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
    '4qwk1bkx': {
      'en': 'Payment Method',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'xlhs6xea': {
      'en': 'Lungti Pay',
      'ms': 'bayar',
      'tl': 'Magbayad',
      'zh_Hans': '支付',
    },
    'mf10juoq': {
      'en': 'Credit/Debit Card ',
      'ms': 'bayar',
      'tl': 'Magbayad',
      'zh_Hans': '支付',
    },
    '3nrupc06': {
      'en': 'Credit/Debit Card ',
      'ms': 'bayar',
      'tl': 'Magbayad',
      'zh_Hans': '支付',
    },
    'ho90zezz': {
      'en': 'Credit/Debit Card ',
      'ms': 'bayar',
      'tl': 'Magbayad',
      'zh_Hans': '支付',
    },
  },
  // order_confirmation
  {
    'ha0dheaz': {
      'en': 'Succes!',
      'ms': 'Terima kasih kerana mendaftar kedai anda!',
      'tl': 'Salamat sa pag-sign up sa iyong tindahan!',
      'zh_Hans': '感谢您注册您的商店！',
    },
    'oc9y2egm': {
      'en':
          'Your mystery bag order is locked in! Swing by the store at the set pickup time and don\'t forget to present your order number to the store staff. Get ready to uncover the mystery!',
      'ms': 'Terima kasih kerana mendaftar kedai anda!',
      'tl': 'Salamat sa pag-sign up sa iyong tindahan!',
      'zh_Hans': '感谢您注册您的商店！',
    },
    'mk1el5j0': {
      'en': 'Order Number:',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'fji1e0b1': {
      'en': 'Pick Up Time:',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'vc01ylpt': {
      'en': ' - ',
      'ms': '',
      'tl': '',
      'zh_Hans': '',
    },
    'tjl1tdy5': {
      'en': 'Track Order',
      'ms': 'teruskan',
      'tl': 'Magpatuloy',
      'zh_Hans': '继续',
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
          'Upang maghanap sa mga tindahan sa malapit, ang app na ito ay nangangailangan ng access sa iyong kasalukuyang lokasyon.',
      'zh_Hans': '为了搜索附近的商店，此应用程序需要访问您当前的位置。',
    },
    'xb354glg': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'ms':
          'Untuk mengambil gambar atau video, apl ini memerlukan kebenaran untuk mengakses kamera.',
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
      'ms': '',
      'tl': '',
      'zh_Hans': '',
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
