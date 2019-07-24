package kwbbin.blog.Interceptor;

import kwbbin.blog.bean.MyUser;
import kwbbin.blog.service.IMyUserService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器，检测是否已
 * 登录，以及检查是否有
 * cookie，有则通过cookie
 * 登录
 * 
 * */
public class LoginInterceptor implements HandlerInterceptor {
	IMyUserService service;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 String userNumber=null;
				String password=null;
				 Cookie[] cookies = request.getCookies();
				 if (null==cookies) {
					 return true;
		         } else {
		             for(Cookie cookie : cookies){
		            	 if("loginUserNumber".equals(cookie.getName())){
		            		 userNumber=cookie.getValue();
		            	 }
		            	 if("loginPassword".equals(cookie.getName())){
		            		 password=cookie.getValue();
		            	 }
		             }
		             if(userNumber!=null||password!=null){
		            	 MyUser user=service.findMyUser(userNumber, password);
		            	 request.getSession().setAttribute("user", user);
		             }
		         }
		 }
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
