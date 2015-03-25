package com.site.utils.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-25
 * Time: 16:29
 */

public class DoubleFormat extends TagSupport {

    private Double number;
    private String part;

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            if(part.equals("i")){
                int integer = (int) (double) number;
                out.print(number);
            } else {
                int integer = (int) (double) number;
                double decimal = (10 * number - 10 * integer)/10;
                out.print(decimal);
            }
        } catch (IOException e) {
            System.err.println(e);
        }

        return SKIP_BODY;
    }

    public void setNumber(Double number) {
        this.number = number;
    }

    public void setPart(String part) {
        this.part = part;
    }
}
