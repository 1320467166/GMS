package gms.cuit.utils;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DateUtil {
    public static List<LocalDate> getNextDate() {
        // 获取当前日期
        LocalDate currentDate = LocalDate.now();

        // 计算接下来一百天的每一天的日期
        List<LocalDate> dates = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            LocalDate nextDate = currentDate.plusDays(i);
            dates.add(nextDate);
        }
        return dates;
    }
}