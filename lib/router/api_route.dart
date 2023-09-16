class ApiRoute {
  // static String baseUrl = 'https://india-legal.antino.ca';

  static String baseUrl = 'https://26df-49-249-44-114.ngrok-free.app';

  static String mainUrl = '$baseUrl/api/v1/';

  ///AUTHENTICATION
  static String sendOtp = '${mainUrl}auth/send-otp';
  static String verifyOtp = '${mainUrl}auth/verify-otp';
  static String getUserDetail = '${mainUrl}user';

  ///ONBOARDING
  static String updateUserDetails = '${mainUrl}user';

  ///SELL PRODUCT - START AUCTION
  static String startAuction = '${mainUrl}auction';
  static String closeAuction = '${mainUrl}auction';
  static String getCreatedAuction = '${mainUrl}user/auctions';
  static String getBidCount = '${mainUrl}auction';

  ///BUY PRODUCTS
  static String auction = '${mainUrl}auction';

  // MY BIDS
  static String userBids = '${mainUrl}user/bids';
}
