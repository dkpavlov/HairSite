package com.site.utils.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-26
 * Time: 8:33
 */

public class ShortenText extends TagSupport {

    private Integer charecters;
    private String text;

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            if(text.length() > charecters){
                out.print(text.substring(0, charecters) + " ...");
            } else {
                out.print(text);
            }
        } catch (IOException e) {
            System.err.println(e);
        }

        return SKIP_BODY;
    }

    public void setCharecters(Integer charecters) {
        this.charecters = charecters;
    }

    public void setText(String text) {
        this.text = text;
    }
}
