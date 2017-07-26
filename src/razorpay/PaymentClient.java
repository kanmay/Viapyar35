package razorpay;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.Response;

public class PaymentClient extends ApiClient {

  private RefundClient refundClient;

  PaymentClient(String auth) {
    super(auth);
    refundClient = new RefundClient(auth);
  }

  public Payment fetch(String id) throws RazorpayException, JSONException {
    return get(String.format(Constants.PAYMENT_GET, id), null);
  }

  public List<Payment> fetchAll(JSONObject request) throws RazorpayException, JSONException {
    return getCollection(Constants.PAYMENT_LIST, request);
  }

  public List<Payment> fetchAll() throws RazorpayException, JSONException {
    return fetchAll(null);
  }

  public Payment capture(String id, JSONObject request) throws RazorpayException, JSONException {
    return post(String.format(Constants.PAYMENT_CAPTURE, id), request);
  }

  public Refund refund(String id) throws RazorpayException, JSONException {
    return refund(id, null);
  }

  public Refund refund(String id, JSONObject request) throws RazorpayException, JSONException {
    return post(String.format(Constants.PAYMENT_REFUND, id), request);
  }

  public Refund refund(JSONObject request) throws RazorpayException, JSONException {
    return refundClient.create(request);
  }

  public Refund fetchRefund(String id, String refundId) throws RazorpayException, JSONException {
    return get(String.format(Constants.PAYMENT_REFUND_GET, id, refundId), null);
  }

  public Refund fetchRefund(String refundId) throws RazorpayException, JSONException {
    return refundClient.fetch(refundId);
  }

  public List<Refund> fetchAllRefunds(String id, JSONObject request) throws RazorpayException, JSONException {
    return getCollection(String.format(Constants.PAYMENT_REFUND_LIST, id), request);
  }

  public List<Refund> fetchAllRefunds(String id) throws RazorpayException, JSONException {
    return fetchAllRefunds(id, null);
  }

  public List<Refund> fetchAllRefunds(JSONObject request) throws RazorpayException, JSONException {
    return refundClient.fetchAll(request);
  }

  public List<Transfer> transfer(String id, JSONObject request) throws RazorpayException, JSONException {
    Response response =
        ApiUtils.postRequest(String.format(Constants.PAYMENT_TRANSFER_CREATE, id), request, auth);
    return processCollectionResponse(response);
  }

  public List<Transfer> fetchAllTransfers(String id) throws RazorpayException, JSONException {
    return fetchAllTransfers(id, null);
  }

  public List<Transfer> fetchAllTransfers(String id, JSONObject request) throws RazorpayException, JSONException {
    return getCollection(String.format(Constants.PAYMENT_TRANSFER_GET, id), request);
  }
}
