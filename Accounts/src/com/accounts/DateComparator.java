package com.accounts;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;


public class DateComparator implements Comparator<Account> {

	@Override
	public int compare(Account a1, Account a2) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
			Date date1 = sdf.parse(a1.getDate());
			Date date2 = sdf.parse(a2.getDate());
			
			if(date1.compareTo(date2)<0) {
				return 1;
			}else if(date1.compareTo(date2)>0) {
				return -1;
			}else {
				return 0;
			}
		}catch(ParseException pe) {
			pe.printStackTrace();
		}
		return 0;
	}

}
