package razorpay;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class RefundClient extends ApiClient {

  RefundClient(String auth) {
    super(auth);
  }

  public Refund create(JSONObject request) throws RazorpayException, JSONException {
    return post(Constants.REFUND_CREATE, request);
  }

  public List<Refund> fetchAll(JSONObject request) throws RazorpayException, JSONException {
    return getCollection(Constants.REFUND_LIST, request);
  }

  public Refund fetch(String id) throws RazorpayException, JSONException {
    return get(String.format(Constants.REFUND_GET, id), null);
  }

  public List<Refund> fetchAll() throws RazorpayException, JSONException {
    return fetchAll(null);
  }
}
