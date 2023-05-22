  enum HttpMethod { get, post, delete, patch }

  abstract class HttpFacade {
    call(HttpMethod method, String endPoint,
        {Map<String, dynamic>? params, Map<String, dynamic>? data, bool isJson = false});
  }
