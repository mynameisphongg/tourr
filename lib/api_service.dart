import 'package:tourr/post.dart';

class ApiService {
  List<Post> _posts = [
    Post(
      id: 1,
      title: {'vi': 'Tour Hà Nội', 'en': 'Hanoi Tour'},
      content: {
        'vi': 'Hà Nội - Thủ đô ngàn năm văn hiến với lịch sử hào hùng và các công trình kiến trúc nổi tiếng.',
        'en': 'Hanoi - The thousand-year-old capital with its rich history and renowned landmarks.'
      },
      imageUrls: [
        'assets/images/tour_hanoi.jpg',
        'assets/images/tour_hanoi1.jpg',
      ],
      details: {
        'vi': [
          'Hồ Hoàn Kiếm là trái tim của thủ đô Hà Nội, nơi gắn liền với truyền thuyết trả gươm của vua Lê Lợi. Xung quanh hồ là những hàng cây xanh mát và đường đi bộ nhộn nhịp, là điểm đến lý tưởng cho cả người dân và du khách.',
          'Văn Miếu - Quốc Tử Giám là nơi thờ Khổng Tử và các bậc hiền triết, đồng thời là trường đại học đầu tiên của Việt Nam. Với kiến trúc cổ kính và các bia đá ghi danh các tiến sĩ, nơi đây thể hiện sự trọng học của dân tộc ta.'
        ],
        'en': [
          'Hoan Kiem Lake is the heart of Hanoi, associated with the legend of King Le Loi returning the sword. Surrounded by lush green trees and vibrant walkways, it is a perfect destination for locals and tourists.',
          'The Temple of Literature, dedicated to Confucius and scholars, is Vietnam’s first university. With its ancient architecture and stone steles honoring scholars, it reflects the nation’s reverence for education.'
        ],
      },
    ),
    Post(
      id: 2,
      title: {'vi': 'Tour Sapa', 'en': 'Sapa Tour'},
      content: {
        'vi': 'Sapa - Thiên đường trên mây với cảnh sắc hùng vĩ và nền văn hóa đa dạng.',
        'en': 'Sapa - A heavenly destination with majestic landscapes and diverse cultures.'
      },
      imageUrls: [
        'assets/images/tour_sapa.jpg',
        'assets/images/tour_sapa1.jpg',
      ],
      details: {
        'vi': [
          'Ruộng bậc thang Sapa là tuyệt tác do con người và thiên nhiên tạo nên, trải dài trên các sườn núi. Vào mùa lúa chín, khung cảnh vàng óng ánh tạo nên vẻ đẹp như tranh vẽ.',
          'Bản Cát Cát - Ngôi làng cổ của người H’Mông, là nơi lưu giữ nhiều giá trị văn hóa truyền thống. Tại đây, bạn có thể tham gia trải nghiệm nghề thủ công truyền thống như dệt vải, trồng lanh, và thưởng thức các món ăn đặc sản địa phương.'
        ],
        'en': [
          'Sapa’s terraced fields are masterpieces of human and nature, stretching across mountain slopes. During the harvest season, the golden scenery creates a picturesque view.',
          'Cat Cat Village - An ancient village of the Hmong people, preserving traditional cultural values. Here, you can experience traditional crafts like weaving, hemp cultivation, and enjoy local delicacies.'
        ],
      },
    ),
    Post(
      id: 3,
      title: {'vi': 'Tour Đà Nẵng', 'en': 'Da Nang Tour'},
      content: {
        'vi': 'Đà Nẵng - Thành phố đáng sống với các bãi biển tuyệt đẹp và địa danh nổi tiếng.',
        'en': 'Da Nang - A livable city with stunning beaches and famous landmarks.'
      },
      imageUrls: [
        'assets/images/tour_danang.jpg',
        'assets/images/tour_danang1.jpg',
      ],
      details: {
        'vi': [
          'Cầu Rồng - Cây cầu biểu tượng của Đà Nẵng, có khả năng phun lửa và nước vào mỗi tối cuối tuần. Đây không chỉ là công trình giao thông mà còn là điểm tham quan thu hút hàng ngàn lượt khách mỗi năm.',
          'Ngũ Hành Sơn là một danh thắng nổi tiếng với những ngọn núi đá vôi hùng vĩ và hệ thống hang động huyền bí. Du khách có thể khám phá những ngôi chùa linh thiêng và tận hưởng không gian thiên nhiên yên bình.'
        ],
        'en': [
          'Dragon Bridge - The symbol of Da Nang, capable of spewing fire and water every weekend night. It is not only a transportation structure but also an attraction drawing thousands of visitors annually.',
          'Marble Mountains is a famous scenic area with majestic limestone peaks and mystical caves. Visitors can explore sacred temples and enjoy the serene natural atmosphere.'
        ],
      },
    ),
    Post(
      id: 4,
      title: {'vi': 'Tour Huế', 'en': 'Hue Tour'},
      content: {
        'vi': 'Huế - Vùng đất cố đô với những di sản văn hóa thế giới.',
        'en': 'Hue - The ancient capital with world cultural heritage sites.'
      },
      imageUrls: [
        'assets/images/tour_hue.jpg',
        'assets/images/tour_hue1.jpg',
      ],
      details: {
        'vi': [
          'Kinh thành Huế là nơi hội tụ các giá trị văn hóa, lịch sử của triều Nguyễn. Các cung điện nguy nga, đền đài cổ kính tại đây đã tạo nên một không gian lịch sử đặc biệt.',
          'Sông Hương - Dòng sông biểu tượng của Huế, với vẻ đẹp thơ mộng. Du khách có thể trải nghiệm du thuyền nghe nhã nhạc cung đình hoặc thả đèn hoa đăng vào ban đêm.'
        ],
        'en': [
          'The Hue Citadel is a convergence of cultural and historical values of the Nguyen Dynasty. The magnificent palaces and ancient temples here create a unique historical space.',
          'Perfume River - The symbolic river of Hue with its poetic beauty. Visitors can enjoy royal court music on a boat cruise or release lanterns at night.'
        ],
      },
    ),
    Post(
      id: 5,
      title: {'vi': 'Tour Nha Trang', 'en': 'Nha Trang Tour'},
      content: {
        'vi': 'Nha Trang - Thành phố biển sôi động với những bãi biển đẹp mê hồn.',
        'en': 'Nha Trang - A vibrant coastal city with mesmerizing beaches.'
      },
      imageUrls: [
        'assets/images/tour_nhatrang.jpg',
        'assets/images/tour_nhatrang1.jpg',
      ],
      details: {
        'vi': [
          'Bãi biển Trần Phú là trung tâm du lịch của Nha Trang với bờ cát trắng mịn và nước biển trong xanh. Đây là nơi lý tưởng để tận hưởng không khí biển và tham gia các hoạt động giải trí.',
          'Vinpearl Land - Khu tổ hợp vui chơi giải trí đẳng cấp, nơi mang lại trải nghiệm thú vị cho cả gia đình. Du khách có thể tham gia cáp treo vượt biển và khám phá công viên nước hiện đại.'
        ],
        'en': [
          'Tran Phu Beach is the tourism hub of Nha Trang with its fine white sand and clear blue waters. It is an ideal place to enjoy the sea air and engage in recreational activities.',
          'Vinpearl Land - A premium entertainment complex offering exciting experiences for the whole family. Visitors can take the oversea cable car and explore the modern water park.'
        ],
      },
    ),
    Post(
      id: 6,
      title: {'vi': 'Tour Phú Quốc', 'en': 'Phu Quoc Tour'},
      content: {
        'vi': 'Khám phá đảo ngọc Phú Quốc với bãi biển trong xanh và những khu nghỉ dưỡng đẳng cấp.',
        'en': 'Discover the pearl island of Phu Quoc with clear blue beaches and luxurious resorts.'
      },
      imageUrls: [
        'assets/images/tour_phuquoc.jpg',
        'assets/images/tour_phuquoc1.jpg',
      ],
      details: {
        'vi': [
          'Bãi Sao - Bãi biển đẹp nhất Phú Quốc với cát trắng mịn như kem và làn nước xanh ngọc bích. Đây là nơi lý tưởng để tắm biển, tham gia các hoạt động dưới nước và ngắm hoàng hôn.',
          'Làng chài Hàm Ninh - Một ngôi làng cổ với vẻ đẹp mộc mạc và thanh bình. Du khách có thể tìm hiểu đời sống ngư dân và thưởng thức các món hải sản tươi ngon ngay tại làng.'
        ],
        'en': [
          'Sao Beach - The most beautiful beach in Phu Quoc with creamy white sand and emerald green waters. It is perfect for swimming, water activities, and watching the sunset.',
          'Ham Ninh Fishing Village - An ancient village with rustic and serene beauty. Visitors can learn about fishermen’s lives and enjoy fresh seafood right in the village.'
        ],
      },
    ),
    Post(
      id: 7,
      title: {'vi': 'Tour TP.HCM', 'en': 'Ho Chi Minh City Tour'},
      content: {
        'vi': 'Khám phá TP.HCM - trung tâm kinh tế và văn hóa của miền Nam Việt Nam.',
        'en': 'Explore Ho Chi Minh City - The economic and cultural center of southern Vietnam.'
      },
      imageUrls: [
        'assets/images/tour_tphcm.jpg',
        'assets/images/tour_tphcm1.jpg',
      ],
      details: {
        'vi': [
          'Dinh Độc Lập - Một biểu tượng lịch sử, nơi từng là trung tâm chính trị quan trọng của miền Nam. Kiến trúc độc đáo và các hiện vật lịch sử tại đây kể lại những câu chuyện quan trọng của Việt Nam.',
          'Nhà thờ Đức Bà - Một công trình kiến trúc Gothic nổi bật giữa lòng thành phố với hai tháp chuông cao vút. Đây không chỉ là nơi linh thiêng mà còn là điểm check-in quen thuộc của du khách.'
        ],
        'en': [
          'Independence Palace - A historical symbol that was once the political hub of southern Vietnam. Its unique architecture and historical artifacts narrate significant stories of Vietnam.',
          'Notre Dame Cathedral - A Gothic architectural masterpiece with two towering bell towers. It is not only a sacred place but also a popular check-in spot for tourists.'
        ],
      },
    ),
    Post(
      id: 8,
      title: {'vi': 'Tour Cần Thơ', 'en': 'Can Tho Tour'},
      content: {
        'vi': 'Cần Thơ - Trái tim của miền Tây sông nước với văn hóa đặc trưng và cảnh đẹp tự nhiên.',
        'en': 'Can Tho - The heart of the Mekong Delta with its unique culture and natural beauty.'
      },
      imageUrls: [
        'assets/images/tour_cantho.jpg',
        'assets/images/tour_cantho1.jpg',
      ],
      details: {
        'vi': [
          'Chợ nổi Cái Răng - Một nét văn hóa độc đáo của miền Tây, nơi các thuyền ghe buôn bán tấp nập. Du khách có thể thưởng thức trái cây tươi ngon và cảm nhận không khí nhộn nhịp tại đây.',
          'Bến Ninh Kiều - Nơi giao thoa giữa dòng sông Hậu và thành phố Cần Thơ. Du khách có thể đi thuyền ngắm cảnh hoàng hôn hoặc dạo bộ thư giãn trên cầu đi bộ.'
        ],
        'en': [
          'Cai Rang Floating Market - A unique cultural feature of the Mekong Delta, where boats and barges are bustling with trade. Visitors can enjoy fresh fruits and soak in the vibrant atmosphere.',
          'Ninh Kieu Wharf - Where the Hau River meets Can Tho city. Visitors can take a boat to watch the sunset or stroll along the pedestrian bridge for relaxation.'
        ],
      },
    ),
    Post(
      id: 9,
      title: {'vi': 'Tour Hạ Long', 'en': 'Ha Long Bay Tour'},
      content: {
        'vi': 'Hạ Long - Kỳ quan thiên nhiên thế giới với những đảo đá và hang động độc đáo.',
        'en': 'Ha Long - A world natural wonder with unique islands and caves.'
      },
      imageUrls: [
        'assets/images/tour_halong.jpg',
        'assets/images/tour_halong1.jpg',
      ],
      details: {
        'vi': [
          'Đảo Titop - Một trong những điểm đến nổi bật nhất ở Vịnh Hạ Long. Từ đỉnh đảo, du khách có thể ngắm nhìn toàn cảnh vịnh biển tuyệt đẹp.',
          'Hang Sửng Sốt - Hang động lớn và đẹp nhất ở Hạ Long, với những nhũ đá lung linh và kỳ vĩ. Đây là nơi lý tưởng cho những ai yêu thích khám phá thiên nhiên.'
        ],
        'en': [
          'Titop Island - One of the most prominent destinations in Ha Long Bay. From the island’s peak, visitors can admire the breathtaking panoramic view of the bay.',
          'Surprise Cave - The largest and most beautiful cave in Ha Long, with sparkling and magnificent stalactites. It is perfect for nature enthusiasts seeking exploration.'
        ],
      },
    ),
    Post(
      id: 10,
      title: {'vi': 'Tour Hội An', 'en': 'Hoi An Tour'},
      content: {
        'vi': 'Hội An - Phố cổ thơ mộng với vẻ đẹp hoài cổ và nền văn hóa đặc sắc.',
        'en': 'Hoi An - A charming ancient town with nostalgic beauty and vibrant culture.'
      },
      imageUrls: [
        'assets/images/tour_hoian.jpg',
        'assets/images/tour_hoian1.jpg',
      ],
      details: {
        'vi': [
          'Phố cổ Hội An - Một bức tranh sống động với những ngôi nhà cổ kính và con đường lung linh ánh đèn lồng. Du khách có thể tham gia các hoạt động văn hóa và thưởng thức các món ăn đặc sản địa phương.',
          'Sông Hoài - Dòng sông thơ mộng chảy qua lòng phố cổ. Tại đây, du khách có thể thả đèn hoa đăng và ngắm cảnh đẹp về đêm trong không gian yên bình.'
        ],
        'en': [
          'Hoi An Ancient Town - A vivid picture with ancient houses and streets lit by colorful lanterns. Visitors can join cultural activities and enjoy local specialties.',
          'Hoai River - A poetic river flowing through the ancient town. Here, visitors can release lanterns and admire the serene beauty of the night.'
        ],
      },
    ),

  ];

  Future<List<Post>> getPosts() async {
    return _posts;
  }

  void addPost(Post post) {
    _posts.add(post);
  }

  void updatePost(Post updatedPost) {
    final index = _posts.indexWhere((post) => post.id == updatedPost.id);
    if (index != -1) {
      _posts[index] = updatedPost;
    }
  }

  void deletePost(int id) {
    _posts.removeWhere((post) => post.id == id);
  }
}
