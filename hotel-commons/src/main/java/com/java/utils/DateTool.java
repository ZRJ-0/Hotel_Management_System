package com.java.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

public class DateTool {
    /* 未成功实现 */
    // public static int diffDays(String inTime, String outTime) throws Exception {
    //     int days;
    //     int diff = 0;
    //     if (inTime == null || outTime == null) {
    //         throw new Exception("入住、退房时间不能为null!!!");
    //     }
    //     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    //     Date inDate = sdf.parse(inTime);
    //     Date outDate = sdf.parse(outTime);
    //     //  首先计算出inDate和outDate之间的时间差
    //     Calendar c1 = Calendar.getInstance();
    //     c1.setTime(inDate);
    //     Calendar c2 = Calendar.getInstance();
    //     c2.setTime(outDate);
    //     AtomicInteger yearDiff = new AtomicInteger(c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR));
    //     if (yearDiff.get() == 0) {
    //         days = c2.get(Calendar.DAY_OF_YEAR) - c1.get(Calendar.DAY_OF_YEAR);
    //     } else if (yearDiff.get() < 0) {
    //         throw new Exception("退房时间不能早于入住时间!!!");
    //     } else {
    //         while (yearDiff.get() != 0) {
    //             Calendar c3 = Calendar.getInstance();
    //             c3.setTime(inDate);
    //             diff += c3.get(Calendar.DAY_OF_YEAR);
    //             yearDiff.getAndDecrement();
    //         }
    //         days = c2.get(Calendar.DAY_OF_YEAR) + diff - c1.get(Calendar.DAY_OF_YEAR);
    //     }
    //     //  计算退房时间是否小于12:00:00的时间戳          退房时间超过12点   入住天数自动加1
    //     SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
    //     long time1 = sdf2.parse(outTime.split("\\ ")[1]).getTime();
    //     long time2 = sdf2.parse("12:00:00").getTime();
    //     if (time1 - time2 > 0) {
    //         days++;
    //     }
    //     return days;
    // }
    public static long diffDays(String inTime, String outTime) throws Exception {
        if (inTime == null || outTime == null) {
            throw new Exception("时间参数不能为null");
        }
        String regex = "\\d{4}-\\d{1,2}-\\d{1,2} \\d{1,2}:\\d{1,2}:\\d{1,2}";
        if (!inTime.matches(regex) || !inTime.matches(regex)) {
            throw new Exception("时间格式不正确");
        }
        // 入住时间与退房时间 2018-01-12 12:30:30
        String[] ruTimeArr = inTime.split("\\ ")[0].split("\\-");   // {"2018","01","12"}
        String[] TuiTimeArr = outTime.split("\\ ")[0].split("\\-");
        LocalDate of = LocalDate.of(Integer.parseInt(ruTimeArr[0]), Integer.parseInt(ruTimeArr[1]),
                Integer.parseInt(ruTimeArr[2]));
        LocalDate end = LocalDate.of(Integer.parseInt(TuiTimeArr[0]), Integer.parseInt(TuiTimeArr[1]),
                Integer.parseInt(TuiTimeArr[2]));
        long days = end.toEpochDay() - of.toEpochDay();
        // 2、计算退房时间戳是否小于12:00:00的时间戳
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        long time1 = sdf2.parse(outTime.split("\\ ")[1]).getTime();
        long time2 = sdf2.parse("12:00:00").getTime();
        long timeCha = time1 - time2;
        if (timeCha > 0) {
            days++;
        }
        return days;
    }

    // public static void main(String[] args) throws Exception {
    //     //  使用LocalDate工具类  对年、月、日之间的时间间隔进行计算
    //     LocalDate of = LocalDate.of(2018, 12, 31);
    //     LocalDate end = LocalDate.of(2019, 1, 1);
    //     long days = end.toEpochDay() - of.toEpochDay();
    //     System.out.println(days);
    // int days = DateTool.diffDays("2019-01-14 11:30:30", "2019-01-18 14:59:59");
    // int days = DateTool.diffDays("2016-12-31 11:30:30", "2019-01-01 14:59:59");
    // System.out.println(days);
    // }
}
