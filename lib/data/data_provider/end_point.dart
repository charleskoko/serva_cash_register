class EndPoint {
  static const BaseUrl = 'http://127.0.0.1:8000/api/v1/';
  //static const BaseUrl ='https://api.gastroci.online/api/v1/';
  static const ArticleUrl = BaseUrl + 'cash-register-product';
  static const Login = BaseUrl + 'login';
  static const Company = BaseUrl + 'company';
  static initialBalance(companyId) {
    return BaseUrl + '$companyId/initial-balance';
  }

  static article(companyId) {
    return BaseUrl + '$companyId/article';
  }
}
