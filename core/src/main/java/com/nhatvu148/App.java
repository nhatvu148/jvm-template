package com.nhatvu148;

import java.util.*;
import java.util.function.BinaryOperator;
import static java.lang.System.*;

public class App {
    public static void main(String[] args) {
        List<Integer> iList = new ArrayList<Integer>() {
            {
                add(1);
                add(2);
                add(3);
            }
        };

        for (var x : iList) {
            out.println("i in List: " + x);
        }

        // lambda expression
        iList.forEach(i -> out.println(i));

        // method reference
        iList.forEach(out::println);

        for (int i = 0; i < 5; i++) {
            out.printf("Hello World! %d\n", i);
        }

        int result = calculator((var a, var b) -> a + b, 12, 34);
        out.println(result);
    }

    public static <T> T calculator(BinaryOperator<T> func, T val1, T val2) {
        T result = func.apply(val1, val2);

        return result;
    }
}
