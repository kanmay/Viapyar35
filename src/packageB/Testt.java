package packageB;

import java.util.Calendar;
import java.util.Date;

import org.json.JSONArray;

public class Testt {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		java.util.Date date= new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH)+1;
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		
		System.out.println("Hiee "+ year);
		
		JSONArray jsonArray = new JSONArray();
		JSONArray nested1 = new JSONArray();
		nested1.put(1999);
		nested1.put(1);
		//jsonArray.put("hie",nested1);
		
		System.out.println(jsonArray);

	}

}
