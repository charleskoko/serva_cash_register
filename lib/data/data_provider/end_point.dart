class EndPoint {
  static const BaseUrl = 'http://127.0.0.1:8000/api/v1/';
  //static const BaseUrl ='https://api.gastroci.online/api/v1/';
  static const ArticleUrl = BaseUrl + 'cash-register-product';
  static const Login = BaseUrl + 'login';
  static const Initialize = BaseUrl + 'initialization';
  static const Company = BaseUrl + 'company';
  static service(companyId) {
    return BaseUrl + '$companyId/service';
  }

  static getService(companyId, serviceId) {
    return BaseUrl + '$companyId/service/$serviceId';
  }

  static postOrderItem(companyId, serviceId) {
    return BaseUrl + '$companyId/order-article/$serviceId';
  }

  static article(companyId) {
    return BaseUrl + '$companyId/article';
  }

  static deletePatchArticle(companyId, articleId) {
    return BaseUrl + '$companyId/article/$articleId';
  }

  static String invoice(String companyId, String serviceId) {
    return BaseUrl + '$companyId/invoice/$serviceId';
  }

  static String deletePatchInvoice(String companyId, String invoiceId) {
    return BaseUrl + '$companyId/invoice/$invoiceId';
  }
}
