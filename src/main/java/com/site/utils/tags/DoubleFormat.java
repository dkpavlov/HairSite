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
            String str = number.toString();
            String[] arr = str.split("\\.");
            if(part.equals("i")){
                out.print(arr[0]);
            } else {
                if(arr[1].length() > 1){
                    out.print(arr[1]);
                } else {
                    out.print(arr[1] + "0");
                }

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
