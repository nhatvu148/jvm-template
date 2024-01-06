package com.nhatvu148;

import java.util.*;

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
            System.out.println("i in List: " + x);
        }

        for (int i = 0; i < 5; i++) {
            System.out.printf("Hello World! %d\n", i);
        }
    }
}
