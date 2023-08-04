package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Scanner;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
//        Scanner sc = new Scanner(System.in);
//        System.out.println("Nhập vào tọa độ x, y của ba đỉnh của tam giác:");
//        System.out.print("Điểm A (x1): ");
//        double x1 = sc.nextDouble();
//        double y1 = sc.nextDouble();
//        System.out.print("Điểm B (x2): ");
//        double x2 = sc.nextDouble();
//        double y2 = sc.nextDouble();
//        System.out.print("Điểm C (x3): ");
//        double x3 = sc.nextDouble();
//        double y3 = sc.nextDouble();
//        double doDaiAB = tinhDoDai(x1, y1, x2, y2);
//        double doDaiBC = tinhDoDai(x2, y2, x3, y3);
//        double doDaiCA = tinhDoDai(x3, y3, x1, y1);
//        if (check(doDaiAB, doDaiBC, doDaiCA)) {
//            System.out.println("Đây là một tam giác hợp lệ!");
//        } else {
//            System.out.println("Đây không phải là một tam giác hợp lệ!");
//        }
//        sc.close();
    }
//    public static double tinhDoDai(double x1, double y1, double x2, double y2) {
//        return Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));
//    }
//    public static boolean check(double doDaiAB, double doDaiBC, double doDaiCA) {
//        return (doDaiAB + doDaiBC > doDaiCA) && (doDaiBC + doDaiCA > doDaiAB) && (doDaiCA + doDaiAB > doDaiBC);
//    }

}
