package kwbbin.blog.handlers;

import kwbbin.blog.bean.Article;
import kwbbin.blog.service.IFindArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FindArticleController {
	@Autowired
	private IFindArticleService  service;

	int PageNow=1;
	
	public void setService(IFindArticleService service) {
		this.service = service;
	}
	/**
	 * 得到查找页
	 * */
	@RequestMapping("/findArticle.do")
	public ModelAndView doFindArticle(String condition,HttpServletRequest request,ModelAndView mv) throws Exception {
		int num=service.getFindPageNum(5d,condition);
		if("1".equals(request.getParameter("PageBegin"))){
			PageNow=1;
		}else if("1".equals(request.getParameter("PageEnd"))){
			PageNow=num;
		}else if("1".equals(request.getParameter("PageBefore"))&&(PageNow>1)){
			PageNow=PageNow-1;
		}else if("1".equals(request.getParameter("PageLast"))&&(PageNow<=num)){
			PageNow=PageNow+1;
		}else if(request.getParameter("PageNow")==null||request.getParameter("PageNow")==""){
			PageNow=1;
		}else {
			PageNow=Integer.parseInt(request.getParameter("PageNow"));
		}
		
		Map<String, Integer> PageNum=new HashMap<>();
		PageNum.put("PageTotal", num);
		PageNum.put("PageNow", PageNow);
		List<Article> ArticleL=service.findArticle(PageNow, 5, condition);
		mv.setViewName("forward:/jsp/FindArticle.jsp");
		
		//获取文章和分页信息
		mv.addObject("ArticleL", ArticleL);
		mv.addObject("PageNum", PageNum);
		mv.addObject("condition", condition);
		return mv;
	}

	@RequestMapping("/mytest.do")
	public @ResponseBody Article mytest(){
		System.out.println("1111111111111");
		Article a = new Article();
		a.setAuthor("时候");
		a.setContent("sdfsdf sdf ");
		return a;
	}
}
