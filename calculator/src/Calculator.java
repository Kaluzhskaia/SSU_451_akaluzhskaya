

import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class Calculator {

    public static boolean isInt(String string) {
        try {
            Integer.parseInt(string);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public static int priority(String op) {

        if (op.equals("*") || op.equals("/"))
            return 2;
        if (op.equals("+") || op.equals("-"))
            return 1;

        return 0;
    }

    public static boolean isOperator(String str) {

        if (str.equals("/") || str.equals("*") || str.equals("+") || str.equals("-"))
            return true;
        return false;
    }

    public static LinkedList<String> parse(LinkedList<String> str) {

        LinkedList<String> stack = new LinkedList<String>();
        LinkedList<String> queue = new LinkedList<String>();

        for (String item : str) {

            if (isInt(item))
                queue.add(item);


            if (isOperator(item)) {

                if (!stack.isEmpty()) {
                    while (!stack.isEmpty() && (priority(item) <= priority(stack.getLast())))
                        queue.add(stack.removeLast());
                }

                stack.add(item);

            }

            if (item.equals("("))
                stack.add(item);


            if (item.equals(")")) {
                while (!stack.getLast().equals("("))
                    queue.add(stack.removeLast());
                stack.removeLast();
            }


        }

        if (!stack.isEmpty()) {
            if (stack.getLast().equals("("))
                System.out.println("Open bracket in equation");
        }

        while (!stack.isEmpty())
            queue.add(stack.removeLast());


        return queue;

    }

    public static String evaluate(LinkedList<String> str) {

        LinkedList<String> stack = new LinkedList<String>();


        for (String item : str) {

            if (isInt(item))
                stack.add(item);
            else {
                if (item.equals("*")) {

                    Double result = (Double.valueOf(stack.removeLast()) * Double.valueOf(stack.removeLast()));
                    stack.add(result.toString());
                }

                if (item.equals("/")) {
                    double first = Double.valueOf(stack.removeLast());
                    double second = Double.valueOf(stack.removeLast());
                    Double result = second / first;
                    stack.add(result.toString());
                }
                if (item.equals("+")) {
                    Double result = (Double.valueOf(stack.removeLast()) + Double.valueOf(stack.removeLast()));
                    stack.add(result.toString());
                }
                if (item.equals("-")) {
                    double first = Double.valueOf(stack.removeLast());
                    double second = Double.valueOf(stack.removeLast());
                    Double result = second - first;
                    stack.add(result.toString());
                }
            }
        }


        return stack.getLast();
    }


    public static void main(String[] args) {

        while (true) {
            System.out.println("Input expression");
            Scanner newscan = new Scanner(System.in);
            String input;
            input = newscan.nextLine();
            if (input.equals("close"))
                break;
            LinkedList<String> list = new LinkedList<String>();


            char[] arr = input.replaceAll(" ", "").toCharArray();
            String str = "";


            for (int i = 0; i < arr.length; i++) {
                Character ch = arr[i];


                if (ch == '/' || ch == '*' || ch == '/' || ch == '+' || ch == '-' || ch == '(' || ch == ')') {
                    if (str != "") {
                        list.add(str);
                        str = "";
                    }

                    list.add(ch.toString());

                } else
                    str += ch;
            }
            list.add(str);


            for (int i = 0; i < list.size(); i++)
                System.out.print(list.get(i));

            System.out.println();

            LinkedList<String> parsedStr = parse(list);

            for (int i = 0; i < parsedStr.size(); i++)
                System.out.print(parsedStr.get(i) + " ");

            System.out.println();
            System.out.println(evaluate(parsedStr));

        }
    }

}