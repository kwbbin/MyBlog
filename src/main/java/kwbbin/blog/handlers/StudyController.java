package kwbbin.blog.handlers;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Friendlink;
import kwbbin.blog.service.IHomePageService;
import kwbbin.blog.service.IStudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudyController {

    @Resource(name="HomePageService")
    private IHomePageService serviceHP;

    @Autowired
    IStudyService service;

    int PageNow=1;

    public void setService(IStudyService service) {
        this.service = service;
    }

    public void setServiceHP(IHomePageService serviceHP) {
        this.serviceHP = serviceHP;
    }

    /**
     * 文章分页查询
     * 得到5篇文章信息
     * */
    @RequestMapping("/study.do")
    public ModelAndView doStudy(HttpServletRequest request, ModelAndView mv) throws Exception {

        int num=service.getStudyPageNum(5d);

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
        List<Article> ArticleL=service.getStudyArticle(PageNow,5);

        mv.setViewName("forward:/index.jsp");

        //获取文章和分页信息
        mv.addObject("ArticleL", ArticleL);
        mv.addObject("PageNum", PageNum);





        Map ArticleMap=serviceHP.getAllHomePageLabel();

        //获取标签云
        mv.addObject("ArticleLabelMap", ArticleMap);
        List<Article> rentArticle=serviceHP.getHomePageRecent();
        List<Article> hotArticle=serviceHP.getHomePageHot();

        //获取热门和最近文章
        mv.addObject("rentArticle", rentArticle);
        mv.addObject("hotArticle", hotArticle);

        //友情链接
        List<Friendlink> friendLink=serviceHP.getHomePageFriendsLink();
        mv.addObject("friendLink", friendLink);

        mv.setViewName("jsp/Study.jsp");
        return mv;
    }

    



}
