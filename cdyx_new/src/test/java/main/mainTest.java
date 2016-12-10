package main;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.prefs.BackingStoreException;

import com.cdyx.common.util.DateUtil;
import com.cdyx.common.util.GenerateOrderCode;
import com.cdyx.entity.Order;

public class mainTest {

	public static void main(String[] args) {
		/*Calendar calendar = Calendar.getInstance();	
		calendar.set(Calendar.HOUR_OF_DAY ,0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		
		Date today=calendar.getTime();
		
		Date endDay=DateUtil.addDay(today,1);
		
		System.out.println(today.toString());
		System.out.println(endDay.toString());*/

		//System.out.println(GenerateOrderCode.getOrderNo());


		Short discount=90;

		float a=(float)discount/100;



		System.out.print(a);
		
		
		
		
	
		
		
		

	}

}
