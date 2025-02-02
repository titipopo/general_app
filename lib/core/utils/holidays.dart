class Holiday {
  final int dd;
  final int mm;
  final String info;
  final String? details;
  final String? note;
  Holiday({
    required this.dd,
    required this.mm,
    required this.info,
    this.details,
    this.note,
  });
}

class Holidays {
  List<Holiday> vnHolidays = [
    Holiday(dd: 1, mm: 1, info: 'Tết Nguyên Đán'),
    Holiday(dd: 15, mm: 1, info: 'Rằm tháng Giêng'),
    Holiday(dd: 10, mm: 3, info: 'Giỗ Tổ Hùng Vương (10/3 ÂL)'),
    Holiday(dd: 15, mm: 4, info: 'Phật Đản (15/4 ÂL)'),
    Holiday(dd: 5, mm: 5, info: 'Lễ Đoan Ngọ (5/5 ÂL)'),
    Holiday(dd: 15, mm: 7, info: 'Vu Lan (15/7 ÂL)'),
    Holiday(dd: 15, mm: 8, info: 'Tết Trung Thu (Rằm tháng 8)'),
    Holiday(dd: 23, mm: 12, info: 'Ông Táo chầu trời (23/12 ÂL)'),
  ];

  List<Holiday> jpHolidays = [
    Holiday(dd: 1, mm: 1, info: '元日', details: '年のはじめを祝う。'),
    Holiday(
        dd: 99,
        mm: 1,
        info: '成人の日',
        details: 'おとなになったことを自覚し、みずから生き抜こうとする青年を祝いはげます。',
        note: '2'),
    Holiday(dd: 11, mm: 2, info: '建国記念日', details: '建国をしのび、国を愛する心を養う。'),
    Holiday(dd: 23, mm: 2, info: '天皇誕生日', details: '天皇の誕生日を祝う。'),
    Holiday(dd: 99, mm: 99, info: '春分の日', details: '自然をたたえ、生物をいつくしむ。'),
    Holiday(
        dd: 29,
        mm: 4,
        info: '昭和の日',
        details: '激動の日々を経て、復興を遂げた昭和の時代を顧み、国の将来に思いをいたす。'),
    Holiday(dd: 3, mm: 5, info: '憲法記念日', details: '日本国憲法の施行を記念し、国の成長を期する。'),
    Holiday(
        dd: 4, mm: 5, info: 'みどりの日', details: '自然に親しむとともにその恩恵に感謝し、豊かな心をはぐくむ。'),
    Holiday(
        dd: 5,
        mm: 5,
        info: 'こどもの日',
        details: 'こどもの人格を重んじ、こどもの幸福をはかるとともに、母に感謝する。'),
    Holiday(
        dd: 99,
        mm: 7,
        info: '海の日',
        details: '海の恩恵に感謝するとともに、海洋国日本の繁栄を願う。',
        note: '3'),
    Holiday(dd: 11, mm: 8, info: '山の日', details: '山に親しむ機会を得て、山の恩恵に感謝する。'),
    Holiday(
        dd: 99,
        mm: 9,
        info: '敬老の日',
        details: '多年にわたり社会につくしてきた老人を敬愛し、長寿を祝う。',
        note: '3'),
    Holiday(dd: 99, mm: 99, info: '秋分の日', details: '祖先をうやまい、なくなった人々をしのぶ。'),
    Holiday(
        dd: 99,
        mm: 10,
        info: 'スポーツの日',
        details: 'スポーツを楽しみ、他者を尊重する精神を培うとともに、健康で活力ある社会の実現を願う。',
        note: '2'),
    Holiday(dd: 3, mm: 11, info: '文化の日', details: '自由と平和を愛し、文化をすすめる。'),
    Holiday(
        dd: 23, mm: 11, info: '勤労感謝の日', details: '勤労をたっとび、生産を祝い、国民たがいに感謝しあう。'),
  ];
}
