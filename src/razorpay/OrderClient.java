package razorpay;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class OrderClient extends ApiClient {

  OrderClient(String auth) {
    super(auth);
  }

  public Order create(JSONObject request) throws RazorpayException, JSONException {
    return post(Constants.ORDER_CREATE, request);
  }

  public List<Order> fetchAll() throws RazorpayException, JSONException {
    return fetchAll(null);
  }

  public List<Order> fetchAll(JSONObject request) throws RazorpayException, JSONException {
    return getCollection(Constants.ORDER_LIST, request);
  }

  public Order fetch(String id) throws RazorpayException, JSONException {
    return get(String.format(Constants.ORDER_GET, id), null);
  }

  public List<Payment> fetchPayments(String id) throws RazorpayException, JSONException {
    return getCollection(String.format(Constants.ORDER_PAYMENT_LIST, id), null);
  }
}
