package rippleshop.bean.api;
import java.util.HashMap;

public class ApiBean {
	int CurrentPriceXRP;
	
	public ApiBean() {
		ApiClient api = new ApiClient("ConnectKey", "SecretKey");
		
		HashMap<String, String> rgParams = new HashMap<String, String>();
		rgParams.put("order_currency", "XRP");
		rgParams.put("payment_currency", "KRW");
		
		try {
			String result = api.callApi("/public/ticker/XRP", rgParams).split(",")[2].split("\"")[3];
		    CurrentPriceXRP = (int)Double.parseDouble(result);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public int getCurrentPriceXRP() {
		return CurrentPriceXRP;
	}	
	
}

