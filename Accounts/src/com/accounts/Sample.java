package com.accounts;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class Sample {

	public static void main(String[] args) throws ParseException {
		String date1 = "05.07.2020";
		String date2 = "08.07.2020";
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		Date dd = sdf.parse(date1);
		System.out.println(dd);
	}

}
