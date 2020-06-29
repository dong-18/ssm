package com.zx.util;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringUtil {
public static  ApplicationContext a() {
	ServletContext sc = ContextLoader.getCurrentWebApplicationContext().getServletContext();
	ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
return ac;
}
}
