class ApiRoute {
  // static String baseUrl = 'https://india-legal.antino.ca';

  static String baseUrl = 'https://ae9e-2401-4900-1c55-50ef-a9ca-fc87-10c7-a3b3.ngrok-free.app';

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
