package kwbbin.blog.handlers;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Friendlink;
import kwbbin.blog.bean.MyUser;
import kwbbin.blog.service.IHomePageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class HomePageController {
	@Resource(name="HomePageService")
	private IHomePageService  service;
	int PageNow=1;

	public void setService(IHomePageService service) {
		this.service = service;
	}
	
	/**
	 * 文章分页查询
	 * 得到5篇文章信息
	 * */
	@RequestMapping("/index.do")
	public ModelAndView doRegister(HttpServletRequest request,ModelAndView mv) throws Exception {
		int num=service.getPageNum(5d);
		
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
		List<Article> ArticleL=service.getHomePageArticle(PageNow,5);
		
		mv.setViewName("forward:/index.jsp");
		
		//获取文章和分页信息
		mv.addObject("ArticleL", ArticleL);
		mv.addObject("PageNum", PageNum);
		
		Map ArticleMap=service.getAllHomePageLabel();

		//获取标签云
		mv.addObject("ArticleLabelMap", ArticleMap);
		List<Article> rentArticle=service.getHomePageRecent();
		List<Article> hotArticle=service.getHomePageHot();
		
		//获取热门和最近文章
		mv.addObject("rentArticle", rentArticle);
		mv.addObject("hotArticle", hotArticle);
		
		//友情链接
		List<Friendlink> friendLink=service.getHomePageFriendsLink();
		mv.addObject("friendLink", friendLink);
		
		
		return mv;
	}

	/**
	 * index的点赞ajax
	 * */
	@ResponseBody
	@RequestMapping("/indexAddGood.do")
	public String doHomePageGood(Integer id,HttpServletRequest request) throws Exception {
        MyUser user = (MyUser) request.getSession().getAttribute("user");
        Set<String> idList = null;
        if (request.getSession().getAttribute("idList") == null) {
            idList = new HashSet<String>();

        } else {
            idList = (Set<String>) request.getSession().getAttribute("idList");
        }
        String idGood = "isGood" + id;
        System.out.println(request.getSession().getAttribute("idList"));


        if (user == null) {
            return"noLogin";
        } else if (idList.add(idGood)) {
            System.out.println("true");
            request.getSession().setAttribute("idList", idList);
            service.addGood(id);
            return "true";
        } else {
            System.out.println("hasGood");
            return "hasGood";
        }

	}
}
