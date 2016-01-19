/**
 * Created by kaluzhskayaas on 19.01.2016.
 */

import java.util.Calendar;
import java.util.Scanner;
import java.util.Locale;



public class Main {

    public static void fun1() {

        Scanner in = new Scanner(System.in);
        System.out.println("Enter year:");
        int year = in.nextInt();

        if (year < 0 || year > 2016){
            System.out.println("Wrong year");
            return;
        }

        Locale locale = Locale.getDefault();

        Calendar calendar = Calendar.getInstance();


        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.DAY_OF_MONTH, 13);


        for (int i = 0; i < 12; i++){
            calendar.set(Calendar.MONTH, i);

            String s = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, locale);

            if (s.equals("Fri"))
            {
                System.out.println(calendar.getDisplayName(Calendar.MONTH, Calendar.SHORT, locale));
            }

        }
    }



    public static void fun2() {

        Scanner in = new Scanner(System.in);

        System.out.println("Enter month:");
        int month = in.nextInt();


        if (month <= 0 || month > 12){
            System.out.println("Wrong month");
            return;
        }

        Locale locale = Locale.getDefault();

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, month-1);
        calendar.set(Calendar.DAY_OF_MONTH, 13);

        for (int i = 1800; i < 2016; i++){


            calendar.set(Calendar.YEAR, i);


            String s = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, locale);

            if (s.equals("Fri"))
            {
                System.out.println(i);
            }

        }
    }




    public static void main(String[] args) {

   fun1();
    fun2();





    }
}