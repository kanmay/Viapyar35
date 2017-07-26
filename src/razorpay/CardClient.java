package razorpay;

import org.json.JSONException;

public class CardClient extends ApiClient {

  CardClient(String auth) {
    super(auth);
  }

  public Card fetch(String id) throws RazorpayException, JSONException {
    return get(String.format(Constants.CARD_GET, id), null);
  }
}
