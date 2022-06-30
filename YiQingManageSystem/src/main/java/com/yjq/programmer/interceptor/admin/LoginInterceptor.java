package com.yjq.programmer.interceptor.admin;

import com.alibaba.fastjson.JSONObject;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
								HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
						   Object arg2, ModelAndView arg3) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object arg2) throws Exception {
		String requestURI = request.getRequestURI();
		Object admin = request.getSession().getAttribute(RuntimeConstant.ADMIN_USER);

		if(admin == null){
			//表示未登录或者登录失效
			System.out.println("链接"+requestURI+"进入拦截器！");
			String header = request.getHeader("X-Requested-With");
			//判断是否是ajax请求
			if("XMLHttpRequest".equals(header)){
				response.getWriter().write(JSONObject.toJSONString(ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED)));
				return false;
			}
			//表示是普通链接跳转，直接重定向到登录页面
			response.sendRedirect(request.getServletContext().getContextPath() + "/admin/user/login");
			return false;
		}


		return true;
	}

}
