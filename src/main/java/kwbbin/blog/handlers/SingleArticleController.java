package kwbbin.blog.handlers;

import kwbbin.blog.bean.*;
import kwbbin.blog.service.IHomePageService;
import kwbbin.blog.service.ISingleArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class SingleArticleController {
	@Autowired
	private ISingleArticleService  service;

	@Autowired
    private IHomePageService serviceHp;
	
	int PageNow=1;
	
	public void setService(ISingleArticleService service) {
		this.service = service;
	}



	@RequestMapping("/SingleArticle.do")
	public ModelAndView doRegister(Integer id,HttpServletRequest request,ModelAndView mv) throws Exception {
		service.addReading(id);
		Article article=service.getArticleById(id);
		mv.addObject("article", article);

		List<ReplyArticle> reply=service.getReply(id);

		List<ReplyArticle> replyToUser=service.getReplyToUser();
		mv.addObject("reply", reply);
		mv.addObject("replyToUser", replyToUser);


        //获取标签云
        Map ArticleMap=serviceHp.getAllHomePageLabel();
        mv.addObject("ArticleLabelMap", ArticleMap);
        List<Article> rentArticle=serviceHp.getHomePageRecent();
        List<Article> hotArticle=serviceHp.getHomePageHot();

        //获取热门和最近文章
        mv.addObject("rentArticle", rentArticle);
        mv.addObject("hotArticle", hotArticle);
        //友情链接
        List<Friendlink> friendLink=serviceHp.getHomePageFriendsLink();
        mv.addObject("friendLink", friendLink);

        mv.addObject("pageid",id);
		
		mv.setViewName("forward:/jsp/SingleArticle.jsp");
		
		return mv;
	}

	@RequestMapping("/doReply.do")
	public ModelAndView doReply(Integer id, String content, HttpServletResponse response, HttpServletRequest request, ModelAndView mv) throws Exception {
//		添加评论到数据库
		MyUser myuser= (MyUser) request.getSession().getAttribute("user");
		if(myuser==null){
			mv.addObject("login","shibai");
		}else{
			Date date=new Date(System.currentTimeMillis());
			String content1= URLDecoder.decode(content,"UTF-8");
			Reply reply=new Reply(date,myuser.getId(),0,content1,id);
			service.addReply(reply);
		}
//		添加文章及回复
		Article article=service.getArticleById(id);
		mv.addObject("article", article);
		List<ReplyArticle> reply=service.getReply(id);
		List<ReplyArticle> replyToUser=service.getReplyToUser();
		mv.addObject("reply", reply);
		mv.addObject("replyToUser", replyToUser);
		mv.setViewName("/jsp/SingleArticle.jsp");
		return mv;
	}
	
	@RequestMapping("/replyAjax.do")
	public ModelAndView doReplyAjax(HttpServletRequest request,ModelAndView mv) throws Exception {
		
		
		return mv;
	}
}
