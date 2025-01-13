part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.X,
      iconData: FontAwesomeIcons.xTwitter,
      url: StringConst.X_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
    SocialData(
      name: StringConst.FACEBOOK,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
  ];

  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.X,
      iconData: FontAwesomeIcons.xTwitter,
      url: StringConst.X_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.X,
      iconData: FontAwesomeIcons.xTwitter,
      url: StringConst.X_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
    SocialData(
      name: StringConst.FACEBOOK,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
  ];

  static List<String> mobileTechnologies = [
    StringConst.FLUTTER,
    StringConst.DART,
    StringConst.FLAME,
    StringConst.KIVY,
    StringConst.JAVA,
  ];

  static List<String> otherTechnologies = [
    StringConst.PYTHON,
    StringConst.DJANGO,
    StringConst.DJANGO_REST,
    StringConst.MYSQL,
    StringConst.HTML,
    StringConst.CSS,
    StringConst.JAVASCRIPT,
    StringConst.JQUERY,
    StringConst.BOOTSTRAP,
    StringConst.REACT,
    StringConst.WORDPRESS,
    StringConst.CPP,
    StringConst.ORACLE_SQL,
    StringConst.GIT,
    StringConst.JSON,
    StringConst.AJAX,
  ];

  static List<ProjectItemData> projects = [
    Projects.GAMECHANGER,
    Projects.MULHAM,
    Projects.FAIT,
    Projects.ATTENDFY_PRO,
    Projects.MESSAGEME,
    Projects.METATRIS,
    Projects.SPACE_FORTRESS,
    Projects.SPACESCAPE,
    Projects.M074MED_V1,
    Projects.WEBSHOP,
    Projects.JOB_BOARD,
    Projects.LMS,
  ];

  static List<ProjectItemData> recentWorks = projects.sublist(0, 7);

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.FLUTTER_TODO_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER_TODO_APP_TECH,
      projectDescription: StringConst.FLUTTER_TODO_APP_DETAIL,
      gitHubUrl: StringConst.FLUTTER_TODO_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.REACTJS_WEATHER_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.REACTJS_WEATHER_APP_TECH,
      projectDescription: StringConst.REACTJS_WEATHER_APP_DETAIL,
      gitHubUrl: StringConst.REACTJS_WEATHER_APP_GITHUB_URL,
      webUrl: StringConst.REACTJS_WEATHER_APP_WEB_URL,
      isLive: true,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.BOOTSTRAP_AND_JQUERY_TEMPLATE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.BOOTSTRAP,
      projectDescription: StringConst.BOOTSTRAP_AND_JQUERY_TEMPLATE_DETAIL,
      gitHubUrl: StringConst.BOOTSTRAP_AND_JQUERY_TEMPLATE_GITHUB_URL,
      webUrl: StringConst.BOOTSTRAP_AND_JQUERY_TEMPLATE_WEB_URL,
      isLive: true,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.HTML_CSS_AND_JS_TEMPLATE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.HTML,
      projectDescription: StringConst.HTML_CSS_AND_JS_TEMPLATE_DETAIL,
      gitHubUrl: StringConst.HTML_CSS_AND_JS_TEMPLATE_GITHUB_URL,
      webUrl: StringConst.HTML_CSS_AND_JS_TEMPLATE_WEB_URL,
      isLive: true,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SIMPLE_FLUTTER_POSTS_APP_1,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.SIMPLE_FLUTTER_POSTS_APP_1_DETAIL,
      gitHubUrl: StringConst.SIMPLE_FLUTTER_POSTS_APP_1_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SIMPLE_FLUTTER_POSTS_APP_2,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.SIMPLE_FLUTTER_POSTS_APP_2_DETAIL,
      gitHubUrl: StringConst.SIMPLE_FLUTTER_POSTS_APP_2_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_KIVY_PROJECTS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_KIVY_PROJECTS_DETAIL,
      gitHubUrl: StringConst.PYTHON_KIVY_PROJECTS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_WEB_SCRAPING_PROJECT,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_WEB_SCRAPING_PROJECT_DETAIL,
      gitHubUrl: StringConst.PYTHON_WEB_SCRAPING_PROJECT_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.COINS_PRICES_BOT,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.COINS_PRICES_BOT_DETAIL,
      gitHubUrl: StringConst.COINS_PRICES_BOT_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.YOUTUBE_VIDEO_AND_AUDIO_DOWNLOADER,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.YOUTUBE_VIDEO_AND_AUDIO_DOWNLOADER_DETAIL,
      gitHubUrl: StringConst.YOUTUBE_VIDEO_AND_AUDIO_DOWNLOADER_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.TEXT_EDITOR,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.TEXT_EDITOR_DETAIL,
      gitHubUrl: StringConst.TEXT_EDITOR_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PING_PONG,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PING_PONG_DETAIL,
      gitHubUrl: StringConst.PING_PONG_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SNAKE_GAME,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.SNAKE_GAME_DETAIL,
      gitHubUrl: StringConst.SNAKE_GAME_GITHUB_URL,
      isLive: false,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.BSD_CS_AI,
      url: StringConst.BSD_CS_AI_CERT_URL,
      image: ImagePath.BSD_CS_AI_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.BSU,
    ),
    CertificationData(
      title: StringConst.MOBILE_DEV,
      url: StringConst.MOBILE_DEV_2024_CERT_URL,
      image: ImagePath.MOBILE_DEV_2024_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.AUC_GC,
    ),
    CertificationData(
      title: StringConst.MOBILE_DEV,
      url: StringConst.MOBILE_DEV_2023_CERT_URL,
      image: ImagePath.MOBILE_DEV_2023_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.AUC,
    ),
    CertificationData(
      title: StringConst.WEB_DEV,
      url: StringConst.WEB_DEV_1_CERT_URL,
      image: ImagePath.WEB_DEV_1_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY_EGFWD,
    ),
    CertificationData(
      title: StringConst.GRADUATION_PROJECT_COMPETITION,
      url: StringConst.GRADUATION_PROJECT_COMPETITION_CERT_URL,
      image: ImagePath.GRADUATION_PROJECT_COMPETITION_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.HTI,
    ),
    CertificationData(
      title: StringConst.FUNDAMENTALS_OF_AGILE_PROJECT_MANAGEMENT,
      url: StringConst.FUNDAMENTALS_OF_AGILE_PROJECT_MANAGEMENT_CERT_URL,
      image: ImagePath.FUNDAMENTALS_OF_AGILE_PROJECT_MANAGEMENT_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.PROJECT_MANAGEMENT_INSTITUTE,
    ),
    CertificationData(
      title: StringConst.FUNDAMENTALS_OF_PREDICTIVE_PROJECT_MANAGEMENT,
      url: StringConst.FUNDAMENTALS_OF_PREDICTIVE_PROJECT_MANAGEMENT_CERT_URL,
      image: ImagePath.FUNDAMENTALS_OF_PREDICTIVE_PROJECT_MANAGEMENT_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.PROJECT_MANAGEMENT_INSTITUTE,
    ),
    CertificationData(
      title: StringConst.WEB_DEV,
      url: StringConst.WEB_DEV_2_CERT_URL,
      image: ImagePath.WEB_DEV_2_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.EGFWD,
    ),
    CertificationData(
      title: StringConst.BANQUE_MISR_TRAINING_PROGRAM,
      url: StringConst.BANQUE_MISR_TRAINING_PROGRAM_CERT_URL,
      image: ImagePath.BANQUE_MISR_TRAINING_PROGRAM_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.BANQUE_MISR,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
        StringConst.COMPANY_1_ROLE_2,
        StringConst.COMPANY_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}

class Projects {
  static ProjectItemData GAMECHANGER = ProjectItemData(
    projectId: StringConst.GAMECHANGER_ID,
    title: StringConst.GAMECHANGER,
    subtitle: StringConst.GAMECHANGER_SUBTITLE,
    platform: StringConst.GAMECHANGER_PLATFORM,
    primaryColor: AppColors.gameChanger,
    image: ImagePath.GAMECHANGER_COVER,
    coverUrl: ImagePath.GAMECHANGER_COVER,
    navTitleColor: AppColors.gameChanger,
    // navSelectedTitleColor: AppColors.gameChanger,
    appLogoColor: AppColors.gameChanger,
    projectAssets: [
      ImagePath.GAMECHANGER_COVER,
      ImagePath.GAMECHANGER_1,
      ImagePath.GAMECHANGER_2,
      ImagePath.GAMECHANGER_3,
      ImagePath.GAMECHANGER_4,
      ImagePath.GAMECHANGER_5,
      ImagePath.GAMECHANGER_6,
    ],
    category: StringConst.GAMECHANGER_CATEGORY,
    portfolioDescription: StringConst.GAMECHANGER_DETAIL,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.GAMECHANGER_GITHUB_URL,
    playStoreUrl: StringConst.GAMECHANGER_PLAYSTORE_URL,
    appStoreUrl: StringConst.GAMECHANGER_APPSTORE_URL,
    webUrl: StringConst.GAMECHANGER_WEB_URL,
  );
  static ProjectItemData MULHAM = ProjectItemData(
    projectId: StringConst.MULHAM_ID,
    title: StringConst.MULHAM,
    subtitle: StringConst.MULHAM_SUBTITLE,
    platform: StringConst.MULHAM_PLATFORM,
    primaryColor: AppColors.mulham,
    image: ImagePath.MULHAM_COVER,
    coverUrl: ImagePath.MULHAM_COVER,
    navTitleColor: AppColors.mulham,
    // navSelectedTitleColor: AppColors.mulham,
    appLogoColor: AppColors.mulham,
    projectAssets: [
      ImagePath.MULHAM_COVER,
      ImagePath.MULHAM_1,
      ImagePath.MULHAM_2,
      ImagePath.MULHAM_3,
      ImagePath.MULHAM_4,
      ImagePath.MULHAM_5,
      ImagePath.MULHAM_6,
      ImagePath.MULHAM_7,
      ImagePath.MULHAM_8,
      ImagePath.MULHAM_9,
      ImagePath.MULHAM_10,
      ImagePath.MULHAM_11,
      ImagePath.MULHAM_12,
      ImagePath.MULHAM_13,
      ImagePath.MULHAM_14,
      ImagePath.MULHAM_15,
      ImagePath.MULHAM_16,
    ],
    category: StringConst.MULHAM_CATEGORY,
    portfolioDescription: StringConst.MULHAM_DETAIL,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData FAIT = ProjectItemData(
    projectId: StringConst.FAIT_ID,
    title: StringConst.FAIT,
    subtitle: StringConst.FAIT_SUBTITLE,
    platform: StringConst.FAIT_PLATFORM,
    primaryColor: AppColors.fait,
    category: StringConst.FAIT_CATEGORY,
    image: ImagePath.FAIT_COVER,
    coverUrl: ImagePath.FAIT_COVER,
    navTitleColor: AppColors.fait,
    // navSelectedTitleColor: AppColors.fait,
    appLogoColor: AppColors.fait,
    projectAssets: [
      ImagePath.FAIT_COVER,
      ImagePath.FAIT_1,
      ImagePath.FAIT_2,
      ImagePath.FAIT_3,
      ImagePath.FAIT_4,
      ImagePath.FAIT_5,
      ImagePath.FAIT_6,
      ImagePath.FAIT_7,
      ImagePath.FAIT_8,
      ImagePath.FAIT_9,
      ImagePath.FAIT_10,
      ImagePath.FAIT_11,
    ],
    portfolioDescription: StringConst.FAIT_DETAIL,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.FAIT_GITHUB_URL,
  );
  static ProjectItemData ATTENDFY_PRO = ProjectItemData(
    projectId: StringConst.ATTENDFY_PRO_ID,
    title: StringConst.ATTENDFY_PRO,
    subtitle: StringConst.ATTENDFY_PRO_SUBTITLE,
    primaryColor: AppColors.attendfyPro,
    category: StringConst.ATTENDFY_PRO_CATEGORY,
    platform: StringConst.ATTENDFY_PRO_PLATFORM,
    image: ImagePath.ATTENDFY_PRO_COVER,
    coverUrl: ImagePath.ATTENDFY_PRO_COVER,
    navTitleColor: AppColors.attendfyPro,
    // navSelectedTitleColor: AppColors.attendfyPro,
    appLogoColor: AppColors.attendfyPro,
    projectAssets: [
      ImagePath.ATTENDFY_PRO_COVER,
      ImagePath.ATTENDFY_PRO_1,
      ImagePath.ATTENDFY_PRO_2,
      ImagePath.ATTENDFY_PRO_3,
      ImagePath.ATTENDFY_PRO_4,
      ImagePath.ATTENDFY_PRO_5,
      ImagePath.ATTENDFY_PRO_6,
    ],
    portfolioDescription: StringConst.ATTENDFY_PRO_DETAIL,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData MESSAGEME = ProjectItemData(
    projectId: StringConst.MESSAGEME_ID,
    title: StringConst.MESSAGEME,
    primaryColor: AppColors.messageMe,
    subtitle: StringConst.MESSAGEME_SUBTITLE,
    category: StringConst.MESSAGEME_CATEGORY,
    platform: StringConst.MESSAGEME_PLATFORM,
    image: ImagePath.MESSAGEME_COVER,
    coverUrl: ImagePath.MESSAGEME_COVER,
    portfolioDescription: StringConst.MESSAGEME_DETAIL,
    navTitleColor: AppColors.messageMe,
    // navSelectedTitleColor: AppColors.messageMe,
    appLogoColor: AppColors.messageMe,
    projectAssets: [
      ImagePath.MESSAGEME_COVER,
      ImagePath.MESSAGEME_1,
      ImagePath.MESSAGEME_2,
    ],
    technologyUsed: "${StringConst.FLUTTER} / Firebase.",
    gitHubUrl: StringConst.MESSAGEME_GITHUB_URL,
  );
  static ProjectItemData METATRIS = ProjectItemData(
    projectId: StringConst.METATRIS_ID,
    title: StringConst.METATRIS,
    subtitle: StringConst.METATRIS_SUBTITLE,
    category: StringConst.METATRIS_CATEGORY,
    primaryColor: AppColors.metatris,
    platform: StringConst.METATRIS_PLATFORM,
    image: ImagePath.METATRIS_COVER,
    coverUrl: ImagePath.METATRIS_COVER,
    navTitleColor: AppColors.metatris,
    // navSelectedTitleColor: AppColors.metatris,
    appLogoColor: AppColors.metatris,
    projectAssets: [
      ImagePath.METATRIS_COVER,
      ImagePath.METATRIS_1,
      ImagePath.METATRIS_2,
      ImagePath.METATRIS_3,
      ImagePath.METATRIS_4,
      ImagePath.METATRIS_5,
      ImagePath.METATRIS_6,
    ],
    portfolioDescription: StringConst.METATRIS_DETAIL,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData SPACE_FORTRESS = ProjectItemData(
    projectId: StringConst.SPACE_FORTRESS_ID,
    title: StringConst.SPACE_FORTRESS,
    subtitle: StringConst.SPACE_FORTRESS_SUBTITLE,
    primaryColor: AppColors.spaceFortress,
    platform: StringConst.SPACE_FORTRESS_PLATFORM,
    category: StringConst.SPACE_FORTRESS_CATEGORY,
    image: ImagePath.SPACE_FORTRESS_COVER,
    coverUrl: ImagePath.SPACE_FORTRESS_COVER,
    navTitleColor: AppColors.spaceFortress,
    // navSelectedTitleColor: AppColors.spaceFortress,
    appLogoColor: AppColors.spaceFortress,
    projectAssets: [
      ImagePath.SPACE_FORTRESS_COVER,
      ImagePath.SPACE_FORTRESS_1,
      ImagePath.SPACE_FORTRESS_2,
    ],
    portfolioDescription: StringConst.SPACE_FORTRESS_DETAIL,
    technologyUsed: "${StringConst.FLUTTER} / ${StringConst.FLAME}.",
  );
  static ProjectItemData SPACESCAPE = ProjectItemData(
    projectId: StringConst.SPACESCAPE_ID,
    title: StringConst.SPACESCAPE,
    subtitle: StringConst.SPACESCAPE_SUBTITLE,
    category: StringConst.SPACESCAPE_CATEGORY,
    primaryColor: AppColors.spacescape,
    platform: StringConst.SPACESCAPE_PLATFORM,
    image: ImagePath.SPACESCAPE_COVER,
    coverUrl: ImagePath.SPACESCAPE_COVER,
    portfolioDescription: StringConst.SPACESCAPE_DETAIL,
    navTitleColor: AppColors.spacescape,
    // navSelectedTitleColor: AppColors.spacescape,
    appLogoColor: AppColors.spacescape,
    projectAssets: [
      ImagePath.SPACESCAPE_COVER,
      ImagePath.SPACESCAPE_1,
      ImagePath.SPACESCAPE_2,
      ImagePath.SPACESCAPE_3,
      ImagePath.SPACESCAPE_4,
      ImagePath.SPACESCAPE_5,
      ImagePath.SPACESCAPE_6,
    ],
    technologyUsed: "${StringConst.FLUTTER} / ${StringConst.FLAME}.",
    gitHubUrl: StringConst.SPACESCAPE_GITHUB_URL,
    webUrl: StringConst.SPACESCAPE_WEB_URL,
  );
  static ProjectItemData M074MED_V1 = ProjectItemData(
    projectId: StringConst.M074MED_V1_ID,
    title: StringConst.M074MED_V1,
    subtitle: StringConst.M074MED_V1_SUBTITLE,
    primaryColor: AppColors.m074med_v1,
    platform: StringConst.M074MED_V1_PLATFORM,
    category: StringConst.M074MED_V1_CATEGORY,
    image: ImagePath.M074MED_V1_COVER,
    coverUrl: ImagePath.M074MED_V1_COVER,
    navTitleColor: AppColors.m074med_v1,
    // navSelectedTitleColor: AppColors.m074med_v1,
    appLogoColor: AppColors.m074med_v1,
    projectAssets: [
      ImagePath.M074MED_V1_1,
    ],
    portfolioDescription: StringConst.M074MED_V1_DETAIL,
    technologyUsed:
        "${StringConst.HTML} / ${StringConst.CSS} / ${StringConst.JAVASCRIPT} / ${StringConst.BOOTSTRAP}.",
    gitHubUrl: StringConst.M074MED_V1_GITHUB_URL,
    webUrl: StringConst.M074MED_V1_WEB_URL,
  );
  static ProjectItemData WEBSHOP = ProjectItemData(
    projectId: StringConst.WEBSHOP_ID,
    title: StringConst.WEBSHOP,
    subtitle: StringConst.WEBSHOP_SUBTITLE,
    category: StringConst.WEBSHOP_CATEGORY,
    primaryColor: AppColors.webShop,
    platform: StringConst.WEBSHOP_PLATFORM,
    image: ImagePath.WEBSHOP_COVER,
    coverUrl: ImagePath.WEBSHOP_COVER,
    portfolioDescription: StringConst.WEBSHOP_DETAIL,
    navTitleColor: AppColors.webShop,
    // navSelectedTitleColor: AppColors.webShop,
    appLogoColor: AppColors.webShop,
    projectAssets: [
      ImagePath.WEBSHOP_1,
      ImagePath.WEBSHOP_2,
      ImagePath.WEBSHOP_3,
      ImagePath.WEBSHOP_4,
      ImagePath.WEBSHOP_5,
      ImagePath.WEBSHOP_6,
    ],
    technologyUsed:
        "${StringConst.DJANGO} / ${StringConst.MYSQL} / ${StringConst.HTML} / ${StringConst.CSS} / ${StringConst.BOOTSTRAP} / ${StringConst.AJAX}.",
    gitHubUrl: StringConst.WEBSHOP_GITHUB_URL,
    webUrl: StringConst.WEBSHOP_WEB_URL,
  );
  static ProjectItemData JOB_BOARD = ProjectItemData(
    projectId: StringConst.JOB_BOARD_ID,
    title: StringConst.JOB_BOARD,
    subtitle: StringConst.JOB_BOARD_SUBTITLE,
    category: StringConst.JOB_BOARD_CATEGORY,
    primaryColor: AppColors.jobBoard,
    platform: StringConst.JOB_BOARD_PLATFORM,
    image: ImagePath.JOB_BOARD_COVER,
    coverUrl: ImagePath.JOB_BOARD_COVER,
    portfolioDescription: StringConst.JOB_BOARD_DETAIL,
    navTitleColor: AppColors.jobBoard,
    // navSelectedTitleColor: AppColors.jobBoard,
    appLogoColor: AppColors.jobBoard,
    projectAssets: [
      ImagePath.JOB_BOARD_1,
      ImagePath.JOB_BOARD_2,
      ImagePath.JOB_BOARD_3,
      ImagePath.JOB_BOARD_4,
      ImagePath.JOB_BOARD_5,
      ImagePath.JOB_BOARD_6,
    ],
    technologyUsed:
        "${StringConst.DJANGO} / ${StringConst.MYSQL} / ${StringConst.DJANGO_REST}.",
    gitHubUrl: StringConst.JOB_BOARD_GITHUB_URL,
    webUrl: StringConst.JOB_BOARD_WEB_URL,
  );
  static ProjectItemData LMS = ProjectItemData(
    projectId: StringConst.LMS_ID,
    title: StringConst.LMS,
    subtitle: StringConst.LMS_SUBTITLE,
    category: StringConst.LMS_CATEGORY,
    primaryColor: AppColors.lms,
    platform: StringConst.LMS_PLATFORM,
    image: ImagePath.LMS_COVER,
    coverUrl: ImagePath.LMS_COVER,
    portfolioDescription: StringConst.LMS_DETAIL,
    navTitleColor: AppColors.lms,
    // navSelectedTitleColor: AppColors.lms,
    appLogoColor: AppColors.lms,
    projectAssets: [
      ImagePath.LMS_COVER,
      ImagePath.LMS_1,
      ImagePath.LMS_2,
    ],
    technologyUsed: "${StringConst.DJANGO} / ${StringConst.JQUERY}.",
    gitHubUrl: StringConst.LMS_GITHUB_URL,
    webUrl: StringConst.LMS_WEB_URL,
  );
}
