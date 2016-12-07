package main;

import java.util.Calendar;
import java.util.Date;

import com.cdyx.common.util.DateUtil;

public class mainTest {

	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();	
		calendar.set(Calendar.HOUR_OF_DAY ,0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		
		Date today=calendar.getTime();
		
		Date endDay=DateUtil.addDay(today,1);
		
		System.out.println(today.toString());
		System.out.println(endDay.toString());

	}

}
