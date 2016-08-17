package com.site.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Created by dimitar.pavlov.mus on 17.08.2016.
 */
public class DoubleUtils {

    public static double round(Double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        BigDecimal bd = new BigDecimal(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }

}
